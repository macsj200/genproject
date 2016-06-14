#!/bin/zsh
# To use this file, you need to edit your bashrc/bash_profile 
# and source this script. If you project directory does not look 
# like PROJECTS_DIR, you will need to change it to match that directory
# Function that creates a new project

PROJECT_CONFIG="$PROJECTS_DIR/.config"
if [ ! -f $PROJECT_CONFIG ]; then
    touch PROJECT_CONFIG
fi
function new-project() {
    if [ -z "$1" ]
      then
        echo "no project name supplied, exiting"
        exit 1
    fi

    target="$PROJECTS_DIR/$1"
    echo "Creating new project at $target"
    mkdir $target
    cd $target

    echo "directory created, initializing git"

    echo "$1" >> README.md
    echo "==============" >> README.md

    git init
    git add README.md
    git commit -m "Initialize repo"
}
# Function that sets the current project
function set-project() {
    if [[ $# > 1 ]]; then
        echo "command should be formatted as 'set-project [<project-dir>]'"
        exit 1
    elif [ $# -eq 1 ]; then
        dir=$1
    else
        dir="."
    fi
    if [ "$dir" = "." ]; then 
        dir=$(pwd)
    else
        dir="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
    fi
    echo $dir >| $PROJECT_CONFIG
}
# Function that sets the current project
function get-project() {
    projdir=$(<$PROJECT_CONFIG)
    echo $projdir
}
function project() { cd $(get-project) }
