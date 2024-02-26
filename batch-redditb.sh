#!/bin/sh
#SBATCH --mem-per-cpu=3000
#SBATCH --job-name GCN-REDDITB
#SBATCH --output=results/REDDIT-BINARY/slurm-%A_%a.out
#SBATCH --array=0-99%100
#SBATCH --partition=Kathleenhigh,Kathleenlow

seed=$1
date=$2
nfolds=100
dataset="REDDIT-BINARY"
outputdir="results/${dataset}/GCN_${dataset}.${date}/"
mkdir $outputdir > /dev/null
filename="${outputdir}results_dictionary.pkl"

params=()
for ((i=0; i<$nfolds; i++)) do
    params[i]="--task graph --model GCN --dataset ${dataset} --filename ${filename} --seed ${seed} --foldindex ${i}"
done

srun python main.py ${params[$SLURM_ARRAY_TASK_ID]}