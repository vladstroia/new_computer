#!/bin/bash


# add lines to bashrc
echo "
# auto ls after cd
function cd {
    builtin cd "$@" && ls -F
}
alias do="cd ~/Documents"
alias d="cd ~/Desktop"
alias h="cd ~"
alias o="xdg-open"
alias p="python3"
alias ba="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias v="vim"
alias rm="rm -rf" 
alias b="cd .."
alias r="ssh pi@78.96.122.51 -p 2000"

# git add + commit + push in the directory you are in
alias gp="~/scripts/gitpush.sh"

alias pr="cd ~/Documents/programe"

# start tmux when terminal emulator starts
alias t0="sh /home/vlad/scripts/tmux.sh"

shopt -s extglob
PATH=$PATH:$HOME/bin
export PATH
export PATH=$PATH:~/.local/bin
" >> ~/.basrhc

# create scripts
# create scripts directory
mkdir ~/scripts


# create tmux script
echo "#!/bin/bash

VAR=$(tmux attach -t 0 )
# =`tmux attach -t 0`


# if [[ "$VAR" == "*no sessions*" ]];
if [ "$VAR" == "no sessions" ];
then
  tmux
else
  tmux attach -t 0
fi
" > ~/scripts/tmux.sh

echo "#!/bin/bash
git add .
echo "write a commit message"
read commit_message

git commit -m "$commit_message"

git push
" > ~/scripts/gitpush.sh



#make tmux prompt colored
echo "set -g default-terminal 'xterm-256color'" >> ~/.tmux.conf

# create github ssh key
ssh-keygen -t ed25519 -C "vlad.stroia@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
echo "Add the SSH key to your account on GitHub."
 git config --global user.email "vlad.stroia@gmail.com"
 git config --global user.name "vladstroia"


 







# update ubuntu
sudo apt-get update && time sudo apt-get dist-upgrade

#install git and tmux
sudo apt install -y tmux git




# install docker
  sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# docker install finished

