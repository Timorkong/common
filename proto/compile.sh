#!/bin/sh
#遍历所有的proto源文件
source ~/.bash_profile
for file in *.proto
do
  arr=(${arr[*]} $file)
   #每一个proto文件执行一次
  protoc -I=./ --csharp_out=./../../lockStep/Assets/Code/Protobuf/Proto/ $file
done
