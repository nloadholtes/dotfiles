mkdir ~/projects
mkdir ~/projects/bitbucket
mkdir ~/projects/github
 
cd
ln -s projects/bitbucket/dotfiles/hg/.hgrc .hgrc
ln -s projects/bitbucket/dotfiles/hg/.hgignore .hgignore
ln -s projects/bitbucket/dotfiles/git/.gitconfig .gitconfig
ln -s projects/bitbucket/dotfiles/git/.gitignore .gitignore
ln -s projects/bitbucket/dotfiles/emacs/.emacs .emacs
ln -s projects/bitbucket/dotfiles/emacs/emacs.d/ .emacs.d
ln -s projects/bitbucket/dotfiles/unix/.pylintrc .pylintrc
ln -s projects/bitbucket/dotfiles/unix/alias .bash_aliases

# pip
#virtualenv
#pylint

echo "PATH=$PATH:~/projects/github/shellGrease:" >> ~/.bashrc
echo "[[ $- == *i* ]]   &&   . ~/projects/github/git-prompt/git-prompt.sh" >> ~/.bashrc
echo "export WORKON_HOME=~/Envs" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

#Things to git
cd ~/projects/github
git clone git@github.com:nloadholtes/git-prompt.git
git clone git@github.com:nloadholtes/shellGrease.git
