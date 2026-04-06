FROM --platform=linux/amd64 ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nasm binutils binutils-multiarch gcc-multilib g++-multilib gdb make git openssh-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace