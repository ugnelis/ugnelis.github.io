---
title: Install CUDA 10.1, Anaconda and TensorFlow on Linux Mint 19.3
description: A guide how to install CUDA, Anaconda and TensorFlow on Linux Mint 19.3.
date: 2020-02-03
author: Ugnius Malūkas
---

In order to install *TensorFlow* for *Nvidia* GPU (418.x+), *Nvidia CUDA* is needed. *TensorFlow* (2.1.0+) only supports *Nvidia CUDA* 10.1. That is why the newiest *CUDA* version cannot be used here.

I use *Anaconda* because it helps to separate *Python* versions from system ones and manage dependencies without writing them into *Linux* system folders.

### Install CUDA
#### Installation

Be sure that you have already installed Nvidia GPU drivers. My recommendation install it trough Driver Manager.

If you need to install CUDA, cuDNN and TensorRT without APT repository, follow this tutorial: [Install CUDA 10.1 without APT repistory on Linux Mint 19.3](/blog/install-cuda-without-apt-repo-on-linux-mint/).

1) Add NVIDIA package repositories
```bash
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt-get update
```

2) Reboot your computer:
```bash
$ sudo reboot
```

3) Check if GPU are visable using `nvidia-smi` command:
```bash
$ nvidia-smi
```

4) Install *CUDA* and *cuDNN*:
```bash
sudo apt-get install --no-install-recommends \
    cuda-10-1 \
    libcudnn7=7.6.4.38-1+cuda10.1  \
    libcudnn7-dev=7.6.4.38-1+cuda10.1
```

5) Install *TensorRT* required by *TensorFlow*:
```bash
sudo apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 \
    libnvinfer-dev=6.0.1-1+cuda10.1 \
    libnvinfer-plugin6=6.0.1-1+cuda10.1
```

### Install TensorFlow with Anaconda

1) Download *Anaconda* for *Python 3.7* from [https://www.anaconda.com/distribution/#linux](https://www.anaconda.com/distribution/#linux).

2) Run installation:
```bash
$ chmod u+x Anaconda3-X.Y.Z-Linux-x86_64.sh
$ ./Anaconda3-X.Y.Z-Linux-x86_64.sh
```

3) In the end of *Anaconda* installation write `yes` when *Anaconda* asks "Do you wish the installer to initialize Anaconda3
by running conda init?".

4) *Optional:* When *Anaconda* is installed, it is activated by default when a new terminal is open. To prevent this, use this command:
```bash
$ conda config --set auto_activate_base false
```

5) Close and open terminal.

6) Create *TensorFlow* environment for *Python 3.7*:
```bash
$ conda create -n tensorflow python=3.7
```

7) Activate the created environment:
```bash
$ conda activate tensorflow
```

8) Install *TensorFlow* `GPU` version
```bash
(tensorflow)$ pip install tensorflow-gpu
```

#### Verify Installiation
1) For verifying *TensorFlow* installation, one of options is to use `ipython`. If it is not installed, use this command:
```bash
(tensorflow)$ pip install ipython.
```

2) Open `ipython`:
```bash
(tensorflow)$ ipython
```

3) Check if *TensorFlow* is installed and GPU is being used:
```bash
(tensorflow)$ pip install ipython.

In [1]: import tensorflow as tf 
   ...: print(tf.test.is_built_with_cuda())  
```

The result should be similar to this output:

{{< image src="ipython-output.png" alt="ipython output" width="100%" height="auto">}}

### Reference List
* [NVIDIA CUDA Installation Guide for Linux](https://docs.nvidia.com/cuda/archive/10.1/cuda-installation-guide-linux/index.html)
* [TensorFlow GPU Support](https://www.tensorflow.org/install/gpu)

### Tested on
* Lenovo Legion Y740 with GPU GeForce 2060
