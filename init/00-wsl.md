## 安装
https://learn.microsoft.com/zh-cn/windows/wsl/install

## zsh Slow tab completion on WSL2 

https://github.com/sorin-ionescu/prezto/issues/1820#issuecomment-690138955

wsl `sudo vim /etc/wsl.conf`

```
[interop]
enabled=true # WSL 是否支持启动 Windows 进程。 for code
appendWindowsPath=false # WSL 是否将 Windows 路径元素添加到$PATH环境变量。
```

## auto net proxy

win `code %USERPROFILE%\.wslconfig`

```
[experimental]
autoProxy=false
```