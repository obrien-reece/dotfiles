#!/bin/bash

#Declare colors
red='\033[0;31m'
nc='\033[0m'
yellow='\033[1;33m'

# Note Directory
notedir="$HOME/.local/share/ns/notes"

# List notes command (list one item per line)
listcommand="/bin/ls -1q"

# Editor of choice (vim, nano, micro, emacs, etc...)
editor=nvim

# viewer for notes (use cat, bat, sed, awk, less, or more)
viewer=batcat

# Peek command (head, tail, sed, etc...)
peeker="sed 11q"

# Remove command (rm, trash-cli, etc...)
remove="/bin/rm"


# create notes directory if it doesn't exist
if [ -d "$notedir" ]; then
    printf ""
else
    mkdir -p $notedir
fi

ns() {
    case $1 in
    -l)
        $listcommand $notedir/
    ;;
    list)
        $listcommand $notedir/
    ;;
    -a)
        $editor $notedir/$2
    ;;
    add)
        $editor $notedir/$2
    ;;
    -e)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Edit Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $editor $notedir/$choice
       else
           $editor $notedir/$2
       fi
    ;;
    edit)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Edit Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $editor $notedir/$choice
       else
           $editor $notedir/$2
       fi
    ;;
    -p)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Peek Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $peeker $notedir/$choice
       else
            $peeker $notedir/$2
       fi
    ;;
    peek)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Peek Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $peeker $notedir/$choice
       else
            $peeker $notedir/$2
       fi
    ;;
    -v)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='View Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $viewer $notedir/$choice
       else
           $viewer $notedir/$2
       fi
    ;;
    view)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='View Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $viewer $notedir/$choice
       else
           $viewer $notedir/$2
       fi
    ;;
    -d)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Delete Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $remove $notedir/$choice
       else
           $remove $notedir/$2
       fi
    ;;
    delete)
       if [ -z "$2" ]; then
        choice="$($listcommand $notedir | fzf --prompt='Delete Note: ' --border=rounded --margin=5% --color=dark --height 100% --reverse)"
        $remove $notedir/$choice
       else
           $remove $notedir/$2
       fi
    ;;
        *)
        printf ${red}"invalid argument:${nc} $1 \n"
        printf ${yellow}"valid arguments are: ${nc}\n"
        printf ${yellow}"list (-l)${nc} -- list all notes in note directory\n"
        printf ${yellow}"add (-a) ${nc} --  add new note and edit with chosen editor\n"
        printf ${yellow}"edit (-e) ${nc} -- edit existing note\n"
        printf ${yellow}"peek (-p) ${nc} -- see first 10 lines of note\n"
        printf ${yellow}"view (-v) ${nc} -- see the whole note\n"
        printf ${yellow}"delete (-d) ${nc} -- delete note\n"
        exit 1
    ;;
    esac
}
ns $1 $2


