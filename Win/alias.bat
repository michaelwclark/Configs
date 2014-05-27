@ECHO OFF
doskey proj=cd C:\Users\Mike.Clark\Projects
doskey pr=cd C:\Users\Mike.Clark\Projects
doskey project=cd C:\Users\Mike.Clark\Projects
doskey daily=cd C:\Users\Mike.Clark\Projects\DailyProgrammer
doskey cfgs=cd C:\Users\Mike.Clark\Projects\Configs\Win\
doskey cfg_env="C:\Program Files\Sublime Text 2\sublime_text.exe" C:\Users\Mike.Clark\Projects\Configs\Win\


REM # ------ Build Tools ------ #


REM # ------ Github ------ #

doskey gs=git status
REM add/tweak if GIST sublime addon is needed
REM doskey gist_token='curl -v -u michaelclark-wf -X POST https://api.github.com/authorizations --data "{\"scopes\":[\"gist\"]}"'
doskey gpo='git push origin'

REM # ------ Github Config Commands ------ #
REM # sets global doskey for git log, also makes log pretty and easier to read.
REM # git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

REM # sets global config to colorize most git output from cli
REM # git config --global color.ui true

REM # sets config to push current branch to origin when calling `git push origin`
REM # git config remote.origin.push HEAD

REM # push the current branch to update a branch with the same name on the receiving end. Works in both central and non-central workflows.
REM # git config --global push.default current


REM # ------ Functions ------ #
   

doskey git_current_branch=git rev-parse --abbrev-ref HEAD;
doskey gcb=$git_current_branch
doskey cb=$git_current_branch
doskey gcs=git rev-parse --sq HEAD@{now}


REM # ------ Configs ------#
      

REM # ------ Misc ------#
doskey chrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
doskey subl="C:\Program Files\Sublime Text 2\sublime_text.exe" $1
doskey wget="C:\Program Files (x86)\GnuWin32\bin\wget.exe" $*

REM # ------ LS CD------ #
doskey ls=ls -al --color
doskey lsa=ls -al --color
doskey l=ls -al --color
doskey ll=ls -al --color
doskey sl=ls -al --color
doskey ...=ls -al --color ../../
doskey ..=ls -al --color 
doskey ..=ls -al --color ../

