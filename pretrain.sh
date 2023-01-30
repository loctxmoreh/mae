#!/usr/bin/env bash

data_dir=${1:-/nas/common_data/ILSVRC2012}
[[ ! -d $data_dir ]] && echo Dataset dir $data_dir not found && exit 1

mkdir -p ./output_dir

/usr/bin/env python3 main_pretrain.py \
    --model mae_vit_base_patch16 \
    --data_path $data_dir \
    --batch_size 64 \
    --log_dir ./output_dir \
    --output_dir ./output_dir \
    --warmup_epochs 2 --epochs 3
