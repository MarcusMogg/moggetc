#!/usr/bin/env bash

# xmake https://xmake.io/#/zh-cn/getting_started
curl -fsSL https://xmake.io/shget.text | bash

# llvm
wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc

echo "deb https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/jammy/ llvm-toolchain-jammy main" \
  > /etc/apt/sources.list.d/llvm-apt.list

# https://apt.llvm.org/
wget https://mirrors.tuna.tsinghua.edu.cn/llvm-apt/llvm.sh  -O /tmp/llvm.sh
chmod +x /tmp/llvm.sh
sudo /tmp/llvm.sh all

LLVM_VERSION=$(/tmp/llvm.sh -h 2>&1 | grep -oP 'CURRENT_LLVM_STABLE=\K[^ ]+')
SHELL_FOLDER=$(cd "$(dirname "$0")"; cd ../ ; pwd)
sudo $SHELL_FOLDER/bin/update-alternatives-clang.sh $LLVM_VERSION 100

