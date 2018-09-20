#!/bin/bash
echo "Killing all screens..."
killall screen
echo "Initializing miners..."
for i in `seq 0 7`;
do
	screen -dm bash -c "./nodecore_pow_cuda_1 -o 74.79.107.169:8501 -u VBYTXuj2Q8meiNXHmWiEzZWPd2zXSu -d $i"
	echo ... $i done.
done
echo "All miners initialized."