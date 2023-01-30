#!/usr/bin/env bash

checkpoint_dir=./checkpoints
data_dir=${1:-/nas/common_data/ILSVRC2012}
[[ ! -d $data_dir ]] && echo Dataset dir $data_dir not found && exit 1

[[ -z `ls $checkpoint_dir/*.pth` ]] && bash download_checkpoints.sh

/usr/bin/env python3 main_finetune.py \
    --eval \
    --resume checkpoints/mae_finetuned_vit_base.pth \
    --model vit_base_patch16 \
    --batch_size 16 \
    --data_path $data_dir
