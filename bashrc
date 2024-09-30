# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
############################# CUSTOM STUFF ####################################

# Aliases
alias v='nvim'
alias so='source'
alias c='clear'
alias ll='ls -la'
alias l='ls'
alias ..="cd .."
alias shutdown="shutdown now"
alias wlc="wl-copy <"
alias t="tree"
alias open="evince"


# Custom colors
COLOR_0='\[\033[38;2;0;0;0m\]'        # #000000 (Black)
COLOR_1='\[\033[38;2;255;85;85m\]'    # #ff5555 (Light Red)
COLOR_2='\[\033[38;2;250;0;116m\]'    # #fa0074 (Pink)
COLOR_3='\[\033[38;2;127;10;31m\]'     # #7f0a1f (Dark Red)
COLOR_4='\[\033[38;2;240;250;139m\]'   # #f0fa8b (Light Yellow)
COLOR_5='\[\033[38;2;50;130;255m\]'    # #3282ff (Light Blue)
COLOR_6='\[\033[38;2;18;0;248m\]'      # #1200f8 (Purple)
COLOR_7='\[\033[38;2;27;60;255m\]'     # #1b3cff (Cyan)
COLOR_8='\[\033[38;2;255;120;197m\]'   # #ff78c5 (Pink)
COLOR_9='\[\033[38;2;0;55;252m\]'      # #0037fc (Blue)
COLOR_10='\[\033[38;2;138;233;252m\]'  # #8ae9fc (Cyan)
COLOR_11='\[\033[38;2;187;187;187m\]'  # #bbbbbb (Gray)
COLOR_12='\[\033[38;2;255;255;255m\]'  # #ffffff (White)
COLOR_RESET='\[\033[0m\]'              # Reset color

# Prompt
source ~/.bash-functions/git_branch.sh

PS1="\W \$(git_branch) \$ "

# Case sensitivity
shopt -s nocaseglob
bind "set completion-ignore-case on"

# Add cargo to path
export PATH="$HOME/.cargo/bin:$PATH"
