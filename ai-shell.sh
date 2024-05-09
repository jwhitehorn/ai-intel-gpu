#! /bin/bash

echo "Launching AI (Intel GPU) Shell..."

docker run -it --rm -v LOCAL_PATH_PLACEHOLDER:/ai/ \
                                --device /dev/dri:/dev/dri \
                                -e NEOReadDebugKeys=1 -e OverrideGpuAddressSpace=48 \
                                -e GGML_SYCL_DEVICE=0 -e GGML_SYCL_DEBUG=0 -e GGML_SYCL_F16=ON \
                                -e HF_TOKEN=HUGGING_FACE_API_KEY_PLACEHOLDER\
                                -e HF_HOME=HUGGING_FACE_CACHE_PLACEHOLDER \
                                --entrypoint /bin/bash jwhitehorn/ai-intel-gpu:2024-05-08
