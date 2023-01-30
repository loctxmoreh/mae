#!/usr/bin/env bash

checkpoint_dir=./checkpoints
models=(mae_finetuned_vit_base mae_finetuned_vit_large mae_finetuned_vit_huge)

mkdir -p $checkpoint_dir
for model in "${models[@]}"; do
        model_url="https://dl.fbaipublicfiles.com/mae/finetune/${model}.pth"
	model_file=${checkpoint_dir}/${model}.pth
	[[ ! -f $model_file ]] && curl $model_url --output $model_file
done
