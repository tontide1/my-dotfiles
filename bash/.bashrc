# ~/.bashrc: Môi trường tinh gọn cho Backend & AI/MLOps

# 1. Exit nếu không phải interactive shell
case $- in *i*) ;; *) return;; esac

# 2. Cấu hình History (Lịch sử lệnh)
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=5000       # Tăng dung lượng lưu trữ lịch sử
HISTFILESIZE=10000
shopt -s checkwinsize

# 3. Prompt (Giao diện dòng lệnh cơ bản, có màu, hoạt động mọi OS)
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# 4. Aliases (Các lệnh tắt an toàn)
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias grep='grep --color=auto'

# Tải custom aliases nếu có
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# 5. AI & MLOps Cache Routing (Chuẩn hóa thư mục lưu model)
export XDG_CACHE_HOME="$HOME/.cache"
export PIP_CACHE_DIR="$HOME/.cache/pip"
export HF_HOME="$HOME/.cache/huggingface"
export TRANSFORMERS_CACHE="$HOME/.cache/huggingface/transformers"
export TORCH_HOME="$HOME/.cache/torch"

# 6. Backend Runtimes (Tải an toàn Node, Bun)
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 7. Conda (Tự động nhận diện thư mục Home)
CONDA_BASE="$HOME/miniconda3"
if [ -d "$CONDA_BASE" ]; then
    __conda_setup="$('$CONDA_BASE/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    elif [ -f "$CONDA_BASE/etc/profile.d/conda.sh" ]; then
        . "$CONDA_BASE/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_BASE/bin:$PATH"
    fi
    unset __conda_setup
fi

# 8. Load Secret Variables (An toàn bỏ qua nếu không có file)
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
