if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ALIASES
alias vim='nvim'
alias ls='exa --icons --color always'
alias ll='exa --icons --color always -l'
alias lsa='exa --icons --color always -a'
alias m='mpv'
alias a='aura -A'
alias subs='python3 submpv.lua'
# alias find='grep -rnw'

# SET THE DEFAULT EDITOR FOR RANGER TO BE VIM
set -x EDITOR nvim

# EXPORT
set fish_greeting # Supresses fish's intro message

# ABBR 
abbr fish 'source ~/.config/fish/config.fish'

# CD
abbr .. "cd .."
abbr .... "cd ../.."
abbr ...... "cd ../../.."
abbr mf "mkdir"

# TRASH
abbr tr 'trash-restore'
abbr te 'trash-empty'
abbr t 'trash'
abbr tl 'trash-list'

abbr sed 'sed -n'
abbr untar 'tar -xvzf '

# VNSTAT
abbr vq 'vnstat -q'
abbr vm 'vnstat -m'
abbr vl 'vnstat -l'
abbr vh 'vnstat -h'
abbr vd 'vnstat -d'
abbr vt 'vnstat -t'

abbr s 'sudo pacman -S'
abbr sr 'sudo pacman -Rns'

# GITHUB
abbr ga 'git add .'
abbr gc 'git commit -m'
abbr gcl 'git clone'
abbr gp 'git push'
abbr gb 'git branch'
abbr gs 'git status'
abbr gcc 'git checkout'

abbr bm 'blueman-manager'
abbr pa 'php artisan'
abbr font 'fc-cache -f -v'
abbr clip 'xclip -selection clipboard'
abbr open 'xdg-open'

# TMUX
abbr ta "tmux a"
abbr tn 'tmux new -s (pwd | sed "s/.*\///g")'
abbr tm "tmux"

abbr l 'ls'
abbr ether 'm "https://www.youtube.com/watch?v=7Y1DjR80JJ4"'

# Scripts
abbr df "dotfiles"
abbr rem "reminder"

abbr txt "txt"
abbr mnv 'm --no-video'
abbr za 'zathura'
abbr rss 'newsboat'

# open yazi filemanager
abbr yz 'yazi'

# obsidian
abbr ob 'obsidian'

#image viewer
abbr image 'sxiv'

abbr gC 'cd ~/.config'
abbr gd 'cd ~/Downloads'
abbr gy 'cd ~/Downloads/paru && clear && ls'

# autojump/zoxide
abbr j 'z'

# Unzip
abbr zip 'unzip'

# LINK TO STARSHIP
starship init fish | source

# LINK TO ZOXIDE
zoxide init fish | source

# ACTIVATE CONDA FOR FISH SHELL
# source ~/anaconda3/etc/fish/conf.d/conda.fish

set -x PATH $HOME/.local/bin $PATH
