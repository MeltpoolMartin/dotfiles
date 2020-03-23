#!/usr/bin/env bash

echo "#####################################################################"
echo ""
if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    echo ""
    echo "Warning: Be aware, this script copies the files bash_profile, bashrc, bash_prompt and aliases into the home directory and overwrites those files, if they already exist"
    exit 1
fi

homedir=$1
echo "Your home directory: $homedir"

# dotfiles directory
dotfiledir=$(pwd)
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}

echo ""
echo "#####################################################################"
echo "Start installation procedure"

# affected files
files="bash_profile bashrc bash_prompt aliases"
echo "Affected files: $files"

# copy and possilby overwrites current files
for file in ${files}; 
do
    #echo "cp ${dotfiledir}/.${file} ${homedir}"
    if [ -e "$homedir.$file" ]; then
        echo "Deprecated ${file} gets deleted"
        rm -f $homedir.$file
        cp -v $dotfiledir/.$file $homedir
    else
        echo "${file} gets copied into ${homedir}"
        cp -v ${dotfiledir}/.${file} ${homedir}
    fi
done
echo "installation complete"
echo "#####################################################################"