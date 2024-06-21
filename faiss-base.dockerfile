

FROM nvidia/cuda:12.0.0-cudnn8-devel-ubuntu22.04 as gpu

# RUN apt-get update && \
#     apt-get install -y wget git automake build-essential gpg-agent &&\
#     wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null &&\
#     echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | tee /etc/apt/sources.list.d/oneAPI.list &&\
#     apt update &&\
#     apt install -y intel-oneapi-mkl-devel-2024.1

# RUN wget http://prdownloads.sourceforge.net/swig/swig-4.1.1.tar.gz \
#   && tar -xvzf swig-4.1.1.tar.gz \
#   && cd swig-4.1.1 \
#   && wget https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.gz -O pcre2-10.43.tar \
#   && ./Tools/pcre-build.sh \
#   && ./autogen.sh \
#   && ./configure \
#   && make \
#   && make install \
#   && cd .. \
#   && rm -rf swig-4.1.1


# RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.3/cmake-3.27.3-linux-x86_64.sh && \
#     bash ./cmake-3.27.3-linux-x86_64.sh --skip-licence --prefix=/usr/local --exclude-subdir

# RUN apt-get update && apt-get -y install python3 python3-dev python3-pip &&\
#     python3 -m pip install numpy

# RUN git clone -b v1.8.0 https://github.com/facebookresearch/faiss.git && \
#     cd faiss &&\
#     MKLROOT=/opt/intel/oneapi/mkl/2024.1 cmake -B build -DBUILD_TESTING=ON -DBUILD_SHARED_LIBS=ON -DFAISS_ENABLE_GPU=ON -DFAISS_ENABLE_RAFT=OFF -DPYTHON_EXECUTABLE=$(which python3) -DCMAKE_BUILD_TYPE=Release -DBLA_VENDOR=Intel10_64_dyn DCUDAToolkit_ROOT=/usr/local/cuda -DCMAKE_CUDA_ARCHITECTURES="75;70;61" . &&\
#     make -k -C build  && (cd build/faiss/python && python3 setup.py install)

WORKDIR /app

ENTRYPOINT ["bash"]
