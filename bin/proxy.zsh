#!/bin/bash

# 检查传入的参数
if [ "$1" == "set" ]; then
    echo "Acquire::http::Proxy \"$http_proxy\";" | sudo tee /etc/apt/apt.conf.d/proxy.conf > /dev/null
    echo "Acquire::https::Proxy \"$https_proxy\";" | sudo tee -a /etc/apt/apt.conf.d/proxy.conf > /dev/null

    cat  /etc/apt/apt.conf.d/proxy.conf
elif [ "$1" == "unset" ]; then
    if [ -f "/etc/apt/apt.conf.d/proxy.conf" ]; then
        sudo mv /etc/apt/apt.conf.d/proxy.conf /etc/apt/apt.conf.d/proxy.conf.backup
        echo "代理已取消，配置文件已备份。"
    fi
else
    echo "无效的参数。请使用 'set' 或 'unset'。"
fi