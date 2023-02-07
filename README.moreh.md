# [Moreh] Running Masked AutoEncoder on Moreh AI Framework
![](https://badgen.net/badge/Nvidia-A100/passed/green) ![](https://badgen.net/badge/Moreh-HAC/passed/green)

## Prepare

### Code
Clone this fork:
```bash
git clone https://github.com/loctxmoreh/mae
```

#### Patching the code
On HAC machine, as of Moreh version 23.1.2, apply this patch to the source
```bash
patch < torch-tensor-reshape.diff
```

### Data
Download and extract ImageNet 2012 train and val images from
http://image-net.org/. The directory structure is the standard layout for the
torchvision
[`datasets.ImageFolder`](https://pytorch.org/docs/stable/torchvision/datasets.html#imagefolder),
and the training and validation data is expected to be in the `train/` folder
and `val/` folder respectively:

```
/path/to/imagenet/
  train/
    class1/
      img1.jpeg
    class2/
      img2.jpeg
  val/
    class1/
      img3.jpeg
    class2/
      img4.jpeg
```

### Environment

#### On A100 machine
```bash
conda env create -f a100env.yml
conda activate mae
```

#### On HAC machine
```bash
conda env create -f hacenv.yml
conda activate mae
update-moreh --force --target 23.1.2
```

## Run

### Pretrain
```bash
./pretrain.sh [path-to-imagenet2012]

# For example
./pretrain.sh /nas/common_data/ILSVRC2012
```

### Finetune
Download and evaluate checkpoints provided by the authors
```bash
./finetune.sh [path-to-imagenet2012]

# For example
./finetune.sh /nas/common_data/ILSVRC2012
```

### Linear probing
```bash
./linprob.sh [path-to-imagenet2012]

# For example
./linprob.sh /nas/common_data/ILSVRC2012
```

## Logs
[2023.02.07] Log files for pretrain task is located inside `./logs`
- `pretrain-a100.log`: Log file on A100 machine
- `pretrain-medium128gb.log`: Log file on HAC machine, running with SDA `Medium.128GB`
Both files are produced by pretrain on the ILSVRC2012 full training set using with `--warmup-epochs 0 --epochs 1`
