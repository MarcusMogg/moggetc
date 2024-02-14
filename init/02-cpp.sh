#!/usr/bin/env bash

cd /tmp

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

# cmake
wget https://github.com/Kitware/CMake/releases/latest
# 使用wget获取最新的发布版本信息 && 提取版本号（假设版本号格式为vX.Y.Z）
version=$(wget -qO- https://api.github.com/repos/Kitware/CMake/releases/latest | grep 'tag_name' | cut -d\" -f4 | sed 's/v//')
# 拼接下载链接
cmake_name="cmake-$version"
download_url="https://github.com/Kitware/CMake/releases/download/v$version/$cmake_name.tar.gz"
echo $cmake_name
# 使用wget下载文件
wget -O /tmp/$cmake_name.tar.gz $download_url
tar zxvf $cmake_name.tar.gz
cd $cmake_name
sudo ./bootstrap
sudo make -j 24
sudo make install
cmake  --version 
