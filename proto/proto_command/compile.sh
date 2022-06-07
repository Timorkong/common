#!/bin/sh
#遍历所有的proto源文件
#source ~/.bash_profile
for file in ./*.proto
do
  fullfile=$file
  echo $fullfile
  fullname=$(basename $fullfile)
  filename=$(echo $fullname | cut -d . -f1)
  outputfile_cs=$"./../../lockStep/Assets/Code/Protobuf/Proto/"$filename$".cs"
  mono /usr/local/lib/node_modules/protogen/bin/protogen.exe -i:$file -o:$outputfile_cs
  outputfile_js=$"./../../LockstepServ/src/protobuff/"$filename$".js"
  outputfile_ts=$"./../../LockstepServ/src/protobuff/"$filename$".d.ts"
    #每一个proto文件执行一次
  pbjs -t static-module -w commonjs -o $outputfile_js $file
  pbts -o $outputfile_ts $outputfile_js
done
