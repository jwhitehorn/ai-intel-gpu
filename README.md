Docker image for easily running AI workloads on Intel GPUs

### Included Software

* Python 3.10.12
* Intel oneAPI 2024.1.0
* Intel Extensions for Transformers
* Intel Extensions for PyTorch 2.1.20+xpu
* Hugging Face CLI

### Getting Started

The idea behind this docker image is to allow you to run a shell inside a container that is already setup and configured with all the libraries needed to get right to work with AI workloads on Intel GPUs.

This github repo has a sample script called ai-shell.sh than can be copied locally and used as a foundation for your own version. 

There are three placeholders you will need to configure at minimum, but you free to extended this script to your choosing. Those three placeholders are:

* LOCAL_PATH_PLACEHOLDER - this placeholder should be replaced with a path on your local filesystem that will be mounted within this container. This path will serve as your default working directly in the container, and will be where you house all your scripts and data between shell sessions. For example, if your username is `jason` and you have an `ai` folder in your home directory, this paceholder might be replaced with `/home/jason/ai`
* HUGGING_FACE_API_KEY_PLACEHOLDER - This is your Hugging Face API key that you can get from [here](https://huggingface.co/settings/tokens). Feel free to remove this environmental variable if you do not use Hugging Face.
* HUGGING_FACE_CACHE_PLACEHOLDER - All data and changes created during shell sessions is deleted unless stored on a mounted path (see LOCAL_PATH_PLACEHOLDER), therefore when using Hugging Face it's important to ensure that it stores its data somewhere that is persistent. For example, if LOCAL_PATH_PLACEHOLDER is `/users/jason/ai`, I might want to keep my Hugging Face cache within a subfolder of that, say `huggingface.cache`, so for this placeholder you'd use `/ai/models/huggingface.cache/`.


Once configured, you can launch directly into this AI-centric environment by executing it:

```
$./ai-shell.sh
Launching AI (Intel GPU) Shell...
Welcome to ithe AI (Intel GPU) shell
For more information visit: https://github.com/jwhitehorn/ai-intel-gpu

The following SYCL devices have been discovered:
[opencl:acc:0] Intel(R) FPGA Emulation Platform for OpenCL(TM), Intel(R) FPGA Emulation Device OpenCL 1.2  [2024.17.3.0.08_160000]
[opencl:cpu:1] Intel(R) OpenCL,       Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz OpenCL 3.0 (Build 0) [2024.17.3.0.08_160000]
[opencl:gpu:2] Intel(R) OpenCL Graphics, Intel(R) Arc(TM) A770 Graphics OpenCL 3.0 NEO  [23.43.27642.40]
[ext_oneapi_level_zero:gpu:0] Intel(R) Level-Zero, Intel(R) Arc(TM) A770 Graphics 1.3 [1.3.27642]

root@de44f10a6cf1:/ai#
```

