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
alias mnv='m --no-video'
# alias find='grep -rnw'

# SET THE DEFAULT EDITOR FOR RANGER TO BE VIM
set -x EDITOR nvim

# EXPORT
set fish_greeting # Supresses fish's intro message

# ABBR 
abbr .. "cd .."
abbr .... "cd ../.."
abbr ...... "cd ../../.."
abbr tr 'trash-restore'
abbr t 'trash'
abbr tl 'trash-list'
abbr sed 'sed -n'
abbr untar 'tar -xvzf '
abbr vq 'vnstat -q'
abbr vm 'vnstat -m'
abbr vl 'vnstat -l'
abbr vh 'vnstat -h'
abbr vd 'vnstat -d'
abbr vt 'vnstat -t'
abbr s 'sudo pacman -S'
abbr sr 'sudo pacman -Rns'
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
abbr fish 'vim ~/.config/fish/config.fish'
abbr ta "tmux a"
abbr tn 'tmux new -s (pwd | sed "s/.*\///g")'
abbr tm "tmux"
abbr l 'ls'
abbr ether 'm "https://www.youtube.com/watch?v=7Y1DjR80JJ4"'
abbr df "dotfiles"

# open yazi filemanager
abbr yz 'yazi'

# obsidian
abbr ob 'obsidian'

#image viewer
abbr image 'sxiv'

abbr gC 'cd ~/.config'
abbr gd 'cd ~/Downloads'
abbr gy 'cd ~/Downloads/paru && clear && ls'


# SCRIPT TO RUN AUTOJUMP
set -gx AUTOJUMP_SOURCED 1

# # set user installation path
if test -d ~/.autojump
    set -x PATH ~/.autojump/bin $PATH
end

# Set ostype, if not set
if not set -q OSTYPE
    set -gx OSTYPE (bash -c 'echo ${OSTYPE}')
end


# enable tab completion
complete -x -c j -a '(autojump --complete (commandline -t))'


# set error file location
if test (uname) = Darwin
    set -gx AUTOJUMP_ERROR_PATH ~/Library/autojump/errors.log
else if test -d "$XDG_DATA_HOME"
    set -gx AUTOJUMP_ERROR_PATH $XDG_DATA_HOME/autojump/errors.log
else
    set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
end

if test ! -d (dirname $AUTOJUMP_ERROR_PATH)
    mkdir -p (dirname $AUTOJUMP_ERROR_PATH)
end


# change pwd hook
function __aj_add --on-variable PWD
    status --is-command-substitution; and return
    autojump --add (pwd) >/dev/null 2>>$AUTOJUMP_ERROR_PATH &
end


# misc helper functions
function __aj_err
    # TODO(ting|#247): set error file location
    echo -e $argv 1>&2
    false
end

# default autojump command
function j
    switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l output (autojump $argv)
            # Check for . and attempt a regular cd
            if [ $output = "." ]
                cd $argv
            else
                if test -d "$output"
                    set_color red
                    echo $output
                    set_color normal
                    cd $output
                else
                    __aj_err "autojump: directory '"$argv"' not found"
                    __aj_err "\n$output\n"
                    __aj_err "Try `autojump --help` for more information."
                end
            end
    end
end


# jump to child directory (subdirectory of current path)
function jc
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            j (pwd) $argv
    end
end


# open autojump results in file browser
function jo
    set -l output (autojump $argv)
    if test -d "$output"
        switch $OSTYPE
            case 'linux*'
                xdg-open (autojump $argv)
            case 'darwin*'
                open (autojump $argv)
            case cygwin
                cygstart "" (cygpath -w -a (pwd))
            case '*'
                __aj_err "Unknown operating system: \"$OSTYPE\""
        end
    else
        __aj_err "autojump: directory '"$argv"' not found"
        __aj_err "\n$output\n"
        __aj_err "Try `autojump --help` for more information."
    end
end


# open autojump results (child directory) in file browser
function jco
    switch "$argv"
        case '-*'
            j $argv
        case '*'
            jo (pwd) $argv
    end
end
# END OF AUTOJUMP SCRIPT #

# LINK TO STARSHIP##
starship init fish | source

# ACTIVATE CONDA FOR FISH SHELL
# source ~/anaconda3/etc/fish/conf.d/conda.fish

set -x PATH $HOME/.local/bin $PATH

# Auto compile groff files in vim

set -x PATH $HOME/.scripts $PATH
