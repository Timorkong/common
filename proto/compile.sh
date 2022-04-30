#!/bin/sh
#遍历所有的proto源文件
source ~/.bash_profile
for file in ./*.proto
do
  fullfile=$file
  echo $fullfile
  fullname=$(basename $fullfile)
  filename=$(echo $fullname | cut -d . -f1)
  outputfile=$"./../../lockStep/Assets/Code/Protobuf/Proto/"$filename$".cs"
  mono /usr/local/lib/node_modules/protogen/bin/protogen.exe -i:$file -o:$outputfile
done
