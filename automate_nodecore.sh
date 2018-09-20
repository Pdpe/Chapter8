#!/bin/bash
echo "Killing nodecore screens..."
for session in $(screen -ls | grep -o '[0-9]*\.nodecore'); do screen -S "${session}" -X quit; done
echo "Initializing miners..."
for i in `seq 0 7`;
do
        screen -S nodecore -dm bash -c "./nodecore_pow_cuda_1 -o 74.79.107.169:8501 -u VBYTXuj2Q8meiNXHmWiEzZWPd2zXSu -d $i"
        echo it $i done.
done
echo "All miners initialized."
