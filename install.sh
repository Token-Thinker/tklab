#!/usr/bin/env zsh
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/tklab
# And also installs Homebrew Packages
# And sets Sublime preferences
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# dotfiles directory
tklabdir=${homedir}/tklab

# list of files/folders to symlink in ${homedir}
files="bash_profile bashrc bash_prompt aliases private"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

# Download Git Auto-Completion
curl "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh" > ${homedir}/.git-completion.zsh

# Run the Homebrew Script
./brew.sh

# Run the Sublime Script
./sublime.sh
