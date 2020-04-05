# dotfiles - backup of my customized bash

Disclaimer: most of the shell scripts are inspired by the repos of:
1. https://github.com/CoreyMSchafer/dotfiles
2. https://github.com/mathiasbynens/dotfiles 

and a little touch of my own flavour

## How to use?

install_cp.sh and install_ln.sh are both valid scripts, that can apply the installation process. It depends on the users itself, if he would like to copy and possibly overwrite already existing bash files (affected files: .bash_profile, .bash_prompt, .bashrc and .aliases), or create a symlink into his home directory.

If you more likely change and customize the files for yourself, it is recomended and more convinient to use the install_ln.sh (symlink method, because you can make the changes in your cloned/forked repository and don't have to copy the files in your home directory once again.

To apply the changes make sure, that you are in directory of the dotfiles repository and enter the command 

for the symlink method:
```
./install_ln.sh ~/
```
for the copy method:
```
./install_cp.sh ~/
```
The console output should look like this:
````
#####################################################################

Your home directory: /Users/_UserName_/
Changing to the /Users/_UserName_/dev/dotfiles directory

#####################################################################
Start installation procedure
Affected files: .bash_profile .bashrc .bash_prompt .aliases
Symlink for /Users/_UserName_/dev/dotfiles/.bash_profile --> /Users/_UserName_/.bash_profile
Symlink for /Users/_UserName_/dev/dotfiles/.bashrc --> /Users/_UserName_/.bashrc
Symlink for /Users/_UserName_/dev/dotfiles/.bash_prompt --> /Users/_UserName_/.bash_prompt
Symlink for /Users/_UserName_/dev/dotfiles/.aliases --> /Users/_UserName_/.aliases
installation complete
#####################################################################
