Docker image for easily running AI workloads on Intel GPUs

### Included Software

* Python 3.10.12
* Intel oneAPI 2024.1.0

#### Python Modules

Many AI-focused python packages already installed, including:

```
Package                     Version
--------------------------- ----------------------
accelerate                  0.21.0
intel-cmplr-lib-rt          2024.0.2
intel-cmplr-lic-rt          2024.0.2
intel-extension-for-pytorch 2.1.20+xpu
intel-opencl-rt             2024.0.2
intel-openmp                2024.0.2
ipex-llm                    2.1.0b20240504
llama_cpp_python            0.2.69
numpy                       1.26.4
oneccl-bind-pt              2.1.200+xpu
onednn                      2024.0.0
onemkl-sycl-blas            2024.0.0
onemkl-sycl-datafitting     2024.0.0
onemkl-sycl-dft             2024.0.0
onemkl-sycl-lapack          2024.0.0
onemkl-sycl-rng             2024.0.0
onemkl-sycl-sparse          2024.0.0
onemkl-sycl-stats           2024.0.0
onemkl-sycl-vm              2024.0.0
pandas                      2.2.2
torch                       2.1.0.post0+cxx11.abi
torchaudio                  2.1.0.post0+cxx11.abi
torchvision                 0.16.0.post0+cxx11.abi
transformers                4.36.2
```
