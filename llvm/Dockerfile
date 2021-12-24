FROM alpine:latest
MAINTAINER ale-cci <alecrd98@gmail.com>


# Install llvm requirements
RUN apk --no-cache --update add \
    "cmake>=3.13.4" \
    "gcc>=5.1.0" \
    "python3>=3.6" \
    "zlib>=1.2.3.4" \
    "make>=3.79" \
    "binutils" \
    "zip"

RUN ln -sf `which python3` /usr/bin/python

WORKDIR /root
RUN wget https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-13.0.0.tar.gz \
    && tar zxf llvmorg-13.0.0.tar.gz \
    && rm -rf llvmorg-13.0.0.tar.gz

RUN apk --no-cache --update add \
    musl-dev \
    "g++>=5.1.0"
ARG ARCH="X86"
RUN cd llvm-project-llvmorg-13.0.0 \
    && mkdir build \
    && cd build \
    && cmake ../llvm \
        -G "Unix Makefiles" \
        -DLLVM_TARGETS_TO_BUILD="$ARCH" \
        -DLLVM_ENABLE_PROJECTS="clang;lld"

RUN cd llvm-project-llvmorg-13.0.0/build \
    && make -j$(nproc) \
    && make install

ENV CC=clang
ENV CXX=clang++
