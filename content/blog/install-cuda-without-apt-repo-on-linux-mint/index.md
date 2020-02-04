---
title: Install CUDA 10.1 without APT repository on Linux Mint 19.3
description: This article shows how to install CUDA 10.1 with cuDNN without adding an APT repository.
date: 2020-02-02
author: Ugnius Malūkas
---

These days many people use NVIDIA graphic cards for increasing speed of computing time, for example, calculating outcomes of Machine Learning algorithms. In order to use a graphic processing of Nvidia GPUs, CUDA has to be installed. This article shows how to install CUDA, cuDNN and TensorRT packages without having a Nvidia APT repository.  

### Installation

Be sure that you have already installed Nvidia GPU drivers. My recommendation is to install it trough Driver Manager.

1) Download *CUDA 10.1*:
```bash
$ wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda_10.1.105_418.39_linux.run
```

2) Run `cuda_10.1.105_418.39_linux.run`:
```bash
$ sudo sh cuda_10.1.105_418.39_linux.run
```

Screen picture:

{{< image src="cuda-installation.png" alt="CUDA installation" width="100%" height="auto">}}


3) After installation you need open `/etc/environment`:
```bash
$ sudo nano /etc/environment
```

Append `PATH` in `/etc/environment` file with a following line:
```bash
:/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/NsightCompute-2019.1
```

4) Depending on your machine (64-bit or 32-bit) append `LD_LIBRARY_PATH` (or add if does not exist) in `/etc/environment`:

64-bit:
```
:/usr/local/cuda-10.1/lib64
```

32-bit:
```
:/usr/local/cuda-10.1/lib
```

5) After 3rd and 4th step your `/etc/environment` file should look like this:

{{< image src="environment-file.png" alt="/etc/environment file" width="100%" height="auto">}}

6) Restart the computer:
```bash
$ sudo reboot
```

### Validate CUDA Installation
Go to `~/NVIDIA_CUDA-10.1_Samples/`:
```bash
$ cd ~/NVIDIA_CUDA-10.1_Samples/
```

Run:
```bash
$ sudo make
```

Then go to `~/NVIDIA_CUDA-10.1_Samples/0_Simple/asyncAPI` and run `asyncAPI`:
```bash
cd ~/NVIDIA_CUDA-10.1_Samples/0_Simple/asyncAPI
./asyncAPI
```
If there are no errors and just warnings, installation is complete.

 
### Install cuDNN

Go to [https://developer.nvidia.com/rdp/cudnn-download](https://developer.nvidia.com/rdp/cudnn-download).

Press *Download cuDNN v7.6.Y, for CUDA 10.1*.

Then press to download these selections:
* *cuDNN Runtime Library for Ubuntu18.04 (Deb)*,
* *cuDNN Developer Library for Ubuntu18.04 (Deb)*,
* *cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb)*.

Install downloaded files:
```bash
sudo dpkg -i libcudnn7_7.6.Y.Z-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-dev_7.6.Y.Z-1+cuda10.1_amd64.deb
sudo dpkg -i libcudnn7-doc_7.6.Y.Z-1+cuda10.1_amd64.deb
```

### Verify Installation:
Copy cuDNN samples:
```bash
$cp -r /usr/src/cudnn_samples_v7/ ~
```

Go to `mnistCUDNN` folder:
```bash
$ cd ~/cudnn_samples_v7/mnistCUDNN
```

Compile and run:
```bash
$ make clean && make
./mnistCUDNN
```

If you see **Test passed!** at the end of the output then installation is complete.

### (Optional) Install Nvidia Libraries Required by TensorFlow

If you are planning to install *TensorFlow (2.1.0+)*, TensorRT is needed to use that library.

1) Download and install `libnvinfer6`:
```bash
$ wget https://developer.download.nvidia.cn/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer6_6.0.1-1+cuda10.1_amd64.deb
sudo dpkg -i --ignore-depends=libcublas10,cuda-cudart-10-1 libnvinfer6_6.0.1-1+cuda10.1_amd64.deb
```

2) Download and install `libnvinfer-dev`:
```bash
$ wget https://developer.download.nvidia.cn/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-dev_6.0.1-1+cuda10.1_amd64.deb
$ sudo dpkg -i --ignore-depends=libcublas-dev,cuda-cudart-dev-10-1 libnvinfer-dev_6.0.1-1+cuda10.1_amd64.deb
```

3) Download and install `libnvinfer-plugin`:
```bash
$ wget https://developer.download.nvidia.cn/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.1_amd64.deb
$ sudo dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.1_amd64.deb
```

### Conclusion

If there is a possibility of having an APT repository, I recommend installing CUDA, cuDNN and TensorRT libraries via APT because many of the above mentioned steps would not be needed and would require less effort.