seed=$(($RANDOM*$RANDOM))
printf -v date '%(%Y-%m-%d.%H:%M:%S)T' -1
sbatch batch-protein.sh $seed $date