ARG ONEAPI_VERSION=2024.1.0-devel-ubuntu22.04
FROM intel/oneapi-basekit:$ONEAPI_VERSION as runtime

WORKDIR /ai

RUN apt-get update && \
    apt-get install -y git python3 libpython3.11 python3-pip python3-venv vim \
                       libjpeg-dev libpng-dev \
		       intel-oneapi-dpcpp-cpp-2024.1=2024.1.0-963 intel-oneapi-mkl-devel=2024.1.0-691 intel-oneapi-ccl-devel=2021.12.0-309


RUN CMAKE_ARGS="-DLLAMA_SYCL=on -DCMAKE_CXX_COMPILER=icpx -DLLAMA_SYCL_F16=ON" pip3 install llama-cpp-python==0.2.76 --force-reinstall --upgrade --no-cache-dir

RUN cd /etc && wget -O llama.cpp.tar.gz "https://github.com/ggerganov/llama.cpp/archive/refs/tags/b3070.tar.gz" && \
    tar -xvzf llama.cpp.tar.gz && mv llama.cpp-b3070/ llama.cpp && rm llama.cpp.tar.gz &&  cd llama.cpp && \
    cmake -B build -DLLAMA_SYCL=ON -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DLLAMA_SYCL_F16=ON && \
    cmake --build build --config Release -j -v

RUN pip3 install dpcpp-cpp-rt==2024.0.2 mkl-dpcpp==2024.0.0 onednn==2024.0.0 gradio
RUN pip3 install --pre --upgrade ipex-llm[xpu] --extra-index-url https://pytorch-extension.intel.com/release-whl/stable/xpu/us/

RUN pip3 install torch==2.1.0.post0 \
                torchvision==0.16.0.post0 \
                torchaudio==2.1.0.post0 \
                intel-extension-for-pytorch==2.1.20+xpu \
                oneccl_bind_pt==2.1.200+xpu --extra-index-url https://pytorch-extension.intel.com/release-whl/stable/xpu/us/ \
                transformers==4.36.2 \
                ipex_llm \
                accelerate \
                huggingface_hub[cli] \
                diffusers \
                termcolor
RUN ln -s /usr/bin/python3 /usr/bin/python

COPY welcome.sh /root/.welcome.sh
RUN chmod +x /root/.welcome.sh
RUN printf "\n/root/.welcome.sh\n" >> /root/.bashrc
