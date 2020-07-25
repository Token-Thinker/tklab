#!/usr/bin/env zsh
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/tklab
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

echo "Starting Token Thinker's Lab Build..."

git clone https://github.com/Token-Thinker/tklab.git

xcode-select --install
##xcode-select --reset

# 1 - Install Homebrew, install if we don't have it
if test ! $(which brew); 
    then
    echo "1. Installing Homebrew..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
    echo "1. Hombrew Installed....Getting Packages"
    ./brew.sh
fi

#2 - Install Oh-My-Zsh
echo "2. Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"--unattended

# 3 - Create Symlinks 
echo "3. Creating Symlinks "
homedir=/Users/tokenthinker

# dotfiles directory
tklabdir=${homedir}/tklab

# list of files/folders to symlink in ${homedir}
files="zshrc"

# change to the dotfiles directory
echo "Changing to the ${tklabdir} directory"
cd ${tklabdir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${tklabdir}/.${file} ${homedir}/.${file}
done

echo "Lab SetUp Complete!"
