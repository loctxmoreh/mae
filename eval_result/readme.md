# Train & evaluation result on Moreh version 23.1.3

## Prepare
Check out [this README](../README.moreh.md)

## Run
In order not to take up too much time, the smaller dataset `imagenet_100cls` is
used instead of the full ImageNet-1K.

### Pretrain
```bash
mkdir -p ./output_dir

python3 main_pretrain.py \
    --model mae_vit_base_patch16 \
    --data_path /nas/common_data/imagenet_100cls \
    --batch_size 64 \
    --log_dir ./output_dir --output_dir ./output_dir \
    --warmup_epochs 2 --epochs 5
```

### Evaluate
After training is finished, a checkpoint named `checkpoint-4.pth` will be saved
in `./output_dir`. To evaluate this checkpoint:

```bash
python3 main_finetune.py --eval \
    --finetune ./output_dir/checkpoint-4.pth \
    --batch_size 16 \
    --data_path /nas/common_data/imagenet_100cls
```

## Logs
On HAC with SDA `Medium.128GB`:
- `pretrain-medium128-imnet100cls-2-5.log`
- `eval-medium128-imnet100cls-2-5.log`
