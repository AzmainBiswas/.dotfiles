# Taken from: https://github.com/dideler/dotfiles/blob/master/functions/extract.fish

function ex --description "Expand or extract bundled & compressed files"
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  set --local file_name (echo $argv[1] | awk -F. '{print $1}')
  switch $ext
    case tar  # non-compressed, just bundled
      mkdir $file_name && tar -xvf $argv[1] --directory="./$file_name"
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar  # tar bundle compressed with gzip
        mkdir $file_name && tar -zxvf $argv[1] --directory="./$file_name"
      else  # single gzip
        gunzip $argv[1]
      end
    case tgz  # same as tar.gz
      mkdir $file_name && tar -zxvf $argv[1] --directory="./$file_name"
    case bz2  # tar compressed with bzip2
      mkdir $file_name && tar -jxvf $argv[1] --directory="./$file_name"
    case xz
        mkdir $file_name && tar -xvf $argv[1] --directory="./$file_name"
    case zst
        unzstd $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1] -d "./$file_name"
    case 7z
        7z x $argv[1] -o$file_name
    case '*'
      echo "unknown extension"
  end
end
