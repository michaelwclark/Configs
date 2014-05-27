alias proj='cd C:\Users\Mike.Clark\Projects'
alias pr='cd C:\Users\Mike.Clark\Projects'
alias project='cd C:\Users\Mike.Clark\Projects'
alias daily='cd C:\Users\Mike.Clark\Projects\DailyProgrammer'
alias cfgs='cd C:\Users\Mike.Clark\Projects\Configs\Win\'
alias cfg='"C:\Program Files\Sublime Text 2\sublime_text.exe" C:\Users\Mike.Clark\Projects\Configs\Win\'


 # ------ Build Tools ------ #


 # ------ Github ------ #

alias gs='git status'
 # add/tweak if GIST sublime addon is needed
 # alias gist_token=''curl -v -u michaelclark-wf -X POST https://api.github.com/authorizations --data "{\"scopes\":[\"gist\"]}"'
alias gpo='git push origin'

 # ------ Github Config Commands ------ #
 # sets global alias for git log, also makes log pretty and easier to read.
 # git config --global alias.lg "log --color --graph --pretty='format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

 # sets global config to colorize most git output from cli
 # git config --global color.ui true

 # sets config to push current branch to origin when calling `git push origin`
 # git config ote.origin.push HEAD

 # push the current branch to update a branch with the same name on the receiving end. Works in both central and non-central workflows.
 # git config --global push.default current


 # ------ Functions ------ #
   

alias git_current_branch='git rev-parse --abbrev-ref HEAD;'
alias gcb='$git_current_branch'
alias cb='$git_current_branch'
alias gcs='git rev-parse --sq HEAD@{now}'


 # ------ Configs ------#
      

 # ------ Misc ------#
alias chrome='"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"'
alias subl='"C:\Program Files\Sublime Text 2\sublime_text.exe" $1'

 # ------ LS CD------ #
alias ls='ls -al --color'
alias lsa='ls -al --color'
alias l='ls -al --color'
alias ll='ls -al --color'
alias sl='ls -al --color'
alias ...='ls -al --color ../../'
alias ..='ls -al --color '
alias ..='ls -al --color ../'

