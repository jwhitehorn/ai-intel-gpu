# Docker Image for Running AI Workloads on Intel GPUs

## Included Software

- Python 3.10.12
- Intel oneAPI 2024.1.0
- Intel Extensions for Transformers
- Intel Extensions for PyTorch 2.1.20+xpu
- Hugging Face CLI

## Getting Started

The purpose of this Docker image is to provide a convenient environment for running AI workloads on Intel GPUs. It comes pre-configured with all the necessary libraries, allowing you to dive straight into your projects.

Within this GitHub repository, you'll find a sample script named `ai-shell.sh`, which can be copied and used as a starting point for your own setup.

To use the script, there are three placeholders you must configure:

1. **LOCAL_PATH_PLACEHOLDER**: This placeholder should be replaced with a path on your local filesystem. This path will be mounted within the container and serve as your default working directory. For example, if your username is `jason` and you have an `ai` folder in your home directory, this placeholder might be replaced with `/home/jason/ai`.

2. **HUGGING_FACE_API_KEY_PLACEHOLDER**: This is your Hugging Face API key, which you can obtain from [here](https://huggingface.co/settings/tokens). If you don't use Hugging Face, feel free to remove this environmental variable.

3. **HUGGING_FACE_CACHE_PLACEHOLDER**: All data and changes created during shell sessions are deleted unless stored on a mounted path (see `LOCAL_PATH_PLACEHOLDER`). Therefore, when using Hugging Face, ensure it stores its data somewhere persistent. For example, if `LOCAL_PATH_PLACEHOLDER` is `/users/jason/ai`, you might want to keep your Hugging Face cache within a subfolder such as `/ai/models/huggingface.cache/`.

Once configured, you can launch directly into this AI-centric environment by executing:

```
$./ai-shell.sh
Launching AI (Intel GPU) Shell...
Welcome to the AI (Intel GPU) shell
For more information visit: https://github.com/jwhitehorn/ai-intel-gpu

The following SYCL devices have been discovered:
[opencl:acc:0] Intel(R) FPGA Emulation Platform for OpenCL(TM), Intel(R) FPGA Emulation Device OpenCL 1.2  [2024.17.3.0.08_160000]
[opencl:cpu:1] Intel(R) OpenCL,       Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz OpenCL 3.0 (Build 0) [2024.17.3.0.08_160000]
[opencl:gpu:2] Intel(R) OpenCL Graphics, Intel(R) Arc(TM) A770 Graphics OpenCL 3.0 NEO  [23.43.27642.40]
[ext_oneapi_level_zero:gpu:0] Intel(R) Level-Zero, Intel(R) Arc(TM) A770 Graphics 1.3 [1.3.27642]

root@de44f10a6cf1:/ai#
```

## Host Configuration
If you do not see a Level-Zero device in the output above, or if docker fails to run due to /dev/dri not existing, then likely your host environment is not setup correctly. While most configuration has been abstracted by this container, a minimal amount of host configuration is necessary to ensure that Docker itself can see the GPU.

On debian:

### 1. Install the Intel Non-Free Drivers
```
apt install intel-media-va-driver-non-free
```

### 2. Install the 6.8.4 Kernel
Due to [breaking changes](https://github.com/intel/compute-runtime/issues/726) Linux Kernel 6.8.4 is the most recent Kernel version recommended at this time. To install this kernel version you can use Zabbly:

```
apt install lsb-release software-properties-common apt-transport-https ca-certificates curl -y
curl -fSsL https://pkgs.zabbly.com/key.asc | gpg --dearmor | tee /usr/share/keyrings/linux-zabbly.gpg > /dev/null
codename=$(lsb_release -sc) && echo deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/linux-zabbly.gpg] https://pkgs.zabbly.com/kernel/stable $codename main | tee /etc/apt/sources.list.d/linux-zabbly.list
apt update
apt install linux-image-6.8.4-zabbly+
```

### 3. Install Intel GPU Tools (optional)
While not necessary, you may find it convenient to install the Intel GPU Tools on the host so that you have easy access to tools like `intel_gpu_top`. To install these tools, simply run:

```
apt install intel-gpu-tools
```
