mkdir ~/projects
mkdir ~/projects/bitbucket
mkdir ~/projects/github
mkdir ~/bin
mkdir -p ~/.git_template/hooks
 
cd ~/projects/github
git clone git@github.com:nloadholtes/dotfiles.git

cd
ln -s projects/bitbucket/dotfiles/hg/.hgrc .hgrc
ln -s projects/bitbucket/dotfiles/hg/.hgignore .hgignore
ln -s projects/bitbucket/dotfiles/git/.gitconfig .gitconfig
ln -s projects/bitbucket/dotfiles/git/.gitignore .gitignore
ln -s projects/bitbucket/dotfiles/emacs/.emacs .emacs
ln -s projects/bitbucket/dotfiles/emacs/emacs.d/ .emacs.d
ln -s projects/bitbucket/dotfiles/unix/.pylintrc .pylintrc
ln -s projects/bitbucket/dotfiles/unix/alias .bash_aliases
ln -s projects/bitbucket/dotfiles/sublime-text-2/Packages/User .config/sublime-text-2/Packages/User
ln -s projects/bitbucket/dotfiles/git/pre-commit .git_template/hooks/post-commit

#install libcurl4-openssl-dev for git stuff

# pip
sudo pip install virtualenvwrapper
sudo pip install pylint
sudo pip install coverage
sudo pip install nose

echo "" >> ~/.bashrc
echo "#Added by dotfiles/install.sh" >> ~/.bashrc
echo "#" >> ~/.bashrc
echo "PATH=\$PATH:~/projects/github/shellGrease:" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "[[ \$- == *i* ]]   &&   . ~/projects/github/git-prompt/git-prompt.sh" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export WORKON_HOME=~/Envs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export HISTSIZE=1000000" >> ~/.bashrc
echo "export HISTFILESIZE=1000000" >> ~/.bashrc
echo "shopt -s histappend" >> ~/.bashrc


#Things to git
cd ~/projects/github
git clone git@github.com:nloadholtes/git-prompt.git
git clone git@github.com:nloadholtes/shellGrease.git
