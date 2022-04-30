#!/bin/sh


filelist=`ls /Users/konglingzhao/Desktop/lockStep/common/proto/*.proto`
for file in $filelist
do
echo $file
mono /usr/local/lib/node_modules/protogen/bin/protogen.exe -i:$file -o:${file%.*}.cs
done