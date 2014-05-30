#!/bin/zsh
git config --global core.autocrlf input

git config --global core.whitespace \ trailing-space,space-before-tab,indent-with-non-tab    
git config --global color.ui true
git config --global remote.origin.push HEAD 
git config --global push.default current
git config --global grep.extendRegexp true
git config --global alias.g "grep --break --heading --line-number"
git config --global grep.lineNumber true  

git config --global credential.helper osxkeychain
git config --global core.editor subl
git config --global user.name 'Michael Clark' 

git config --global user.email michael.clark@webfilings.com
git config --global merge.tool diffmerge

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit”
