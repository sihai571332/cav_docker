#!/bin/bash
ips=($(hostname -I))

for ip in "${ips[@]}"
do
	echo $ip
done

docker build -t cav/hello . 
cd .. 
ls
if [ -d "shared_folder" ] 
then
  rm -r shared_folder
fi
mkdir shared_folder 
cd shared_folder 
docker run -p 9000:9000 -p 3000:3000 -v "$(pwd):/mydata" cav/hello /mydata