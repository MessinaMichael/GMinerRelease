
for c in 0 1 2 3 4 5 6; do
    if [ $c = 1 ] || [ $c = 3 ]; then
       sudo nvidia-smi -i $c -pl 285
       echo "changed GPU $c"
    else
    	sudo nvidia-smi -i $c -pl 130
    	echo "changed GPU $c"
    fi
done

echo "Power limit change finished for all GPUs."
read -p "Press enter to continue"

echo "Start changing memory transfer rate"

for c in 0 1 2 3 4 5 6; do
    if [ $c = 1 ] || [ $c = 3 ]; then
       sudo nvidia-settings -a [gpu:$c]/GPUMemoryTransferRateOffset[4]=2600
       echo "changed GPU $c"
    else
    	sudo nvidia-settings -a [gpu:$c]/GPUMemoryTransferRateOffset[4]=2400
    	echo "changed GPU $c"
    fi
done


echo "All changes finished."
read -p "Press enter to continue"

cd gminer_2_70_linux64/

./miner --algo ethash --server us-eth.2miners.com:2020 --user bc1qcqc4pcngpwsapl6lt3k9w3ztxjtrelvfq7pwa6.powpowstrong



