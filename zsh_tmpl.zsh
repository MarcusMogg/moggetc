#!/usr/bin/env zsh

# 子命令处理核心函数
myapp() {
  local cmd="$1"
  if [[ -z "$cmd" ]]; then
    echo "请提供有效的子命令" >&2
    return 1
  fi

  # 自动映射 myapp-<子命令> 函数
  if (( $+functions[myapp-$cmd] )); then
    shift
    "myapp-$cmd" "$@"
    return $?
  fi

  echo "未知子命令: $cmd" >&2
  return 1
}

# 子命令实现示例
myapp-example() {
  # 具体命令逻辑
  echo "执行示例命令，参数: $@"
}

# 自动补全定义
_myapp() {
  local context state state_descr line
  typeset -A opt_args

  # 一级子命令列表
  _1st_arguments=(
    'example:示例命令'
    'help:显示帮助信息'
    'version:显示版本信息'
  )

  # 子命令参数定义
  _example() {
    _arguments \
      '--verbose[详细模式]' \
      '--config[配置文件路径]: :_files'
  }

  # 动态补全处理
  _arguments '*:: :->command'
  
  if (( CURRENT == 1 )); then
    _describe -t commands "myapp command" _1st_arguments
    return
  fi

  case "$words[1]" in
    example)
      # 提供参数
      _example
      ;;
    use)
      # 提供可选枚举
      compadd "$@" "option1" "option2"
      ;;
    # 添加其他子命令处理
  esac
}

# 注册补全函数
compdef _myapp myapp

# 使用示例：
# 1. 将本文件保存为 myapp.plugin.zsh
# 2. 在.zshrc中加载：source path/to/myapp.plugin.zsh
# 3. 使用补全功能：myapp [TAB]