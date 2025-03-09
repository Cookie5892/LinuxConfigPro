# ~/.bashrc：由 bash(1) 为非登录 shell 执行。
# 参阅 /usr/share/doc/bash/examples/startup-files（位于 bash-doc 包中）获取示例。

# 如果不是交互式运行，则不做任何操作
case $- in
    *i*) ;;
      *) return;;
esac

# 不在历史记录中保存重复行或以空格开头的行
# 更多选项请参阅 bash(1) 手册
HISTCONTROL=ignoreboth

# 将新命令追加到历史文件，不覆盖原有内容
shopt -s histappend

# 设置历史记录长度，参阅 HISTSIZE 和 HISTFILESIZE 的 bash(1) 手册
HISTSIZE=1000
HISTFILESIZE=2000

# 每条命令执行后检查窗口大小，必要时更新 LINES 和 COLUMNS 的值
shopt -s checkwinsize

# 如果启用，模式 "**" 在路径扩展上下文中将匹配所有文件和零个或多个目录及子目录
# shopt -s globstar

# 使 less 对非文本输入文件更友好，参阅 lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# 设置标识当前 chroot 环境的变量（用于下面的提示符）
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# 设置一个花哨的提示符（除非我们明确想要彩色提示符，否则默认为非彩色）
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# 如果终端支持彩色，则取消注释以启用彩色提示符；
# 默认关闭，以免分散用户注意力：终端窗口的焦点应放在命令输出上，而非提示符
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # 我们支持彩色；假设它符合 Ecma-48（ISO/IEC-6429）标准
        # 缺乏此类支持的情况极为罕见，且此类情况往往支持 setf 而非 setaf
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# 如果这是 xterm，则将标题设置为 user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;

*)
    ;;
esac

# 启用 ls 的彩色支持，并添加一些便捷的别名
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    # alias dir='dir --color=auto'
    # alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ll="ls -lh"
    alias gs="git status"
    alias gc="git commit"
    alias v="vim"
    alias sl=ls
fi

# GCC 警告和错误的彩色输出
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# 更多 ls 别名
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c=clear

# 为长时间运行的命令添加“alert”别名。使用方式如下：
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 别名定义
# 您可能想将所有添加项放入一个单独的文件，如 ~/.bash_aliases，而不是直接添加在此处
# 参阅 bash-doc 包中的 /usr/share/doc/bash-doc/examples

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# 启用可编程补全功能（如果 /etc/bash.bashrc 和 /etc/profile 已启用此功能，则无需再次启用）
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# 设置环境变量
export NEMU_HOME=/home/robot/ics2024/nemu
export AM_HOME=/home/robot/ics2024/abstract-machine

# 设置提示符为绿色，显示用户、主机和路径
PS1='\[\e[32m\]\u@\h:\w\$\[\e[0m\] '

# 忽略重复/删除重复的历史记录条目
export HISTCONTROL=ignoredups:erasedups
# 记录命令执行时间
export HISTTIMEFORMAT='%F %T '

# 输入目录名自动跳转
shopt -s autocd
# 路径补全不区分大小写
shopt -s nocaseglob
# 添加 VSCode 的安装路径到系统的环境变量中
export PATH="$PATH:/usr/share/code/bin"