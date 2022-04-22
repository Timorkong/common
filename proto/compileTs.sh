#!/bin/sh
#遍历所有的proto源文件
source ~/.bash_profile
for file in ./*.proto
do
  fullfile=$file
  echo $fullfile
  fullname=$(basename $fullfile)
  dir=$(dirname $fullfile)
  filename=$(echo $fullname | cut -d . -f1)
  extension=$(echo $fullname | cut -d . -f2)
  outputfile=$"./../../LockstepServ/src/protobuff/"$filename$".js"
  tsfile=$"./../../LockstepServ/src/protobuff/"$filename$".d.ts"
  echo $dir , $fullname , $filename , $extension , $outputfile
   #每一个proto文件执行一次
  pbjs -t static-module -w commonjs -o $outputfile $file
  pbts -o $tsfile $outputfile
done
