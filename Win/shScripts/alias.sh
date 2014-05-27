# ------ Projects ------ #
    alias proj='~/workspaces/'
    alias pr='~/workspaces/'
    alias project='~/workspaces/'
    alias daily='cd ~/workspaces/DailyProgrammer'
    alias acm='cd ~/workspaces/ACM'
    alias scripts='cd ~/workspaces/scripts'
    alias cfg_zsh='~/.oh-my-zsh'
    alias cfgs='~/workspaces/configs/'

# ------ Bigsky ------ #
    alias bigsky='~/workspaces/wf/bigsky/z_bigsky && source ~/dev/wf/sky/bin/activate'
    alias sky='bigsky'
    alias skytest='python manage.py test --test-seed=-1'
    alias lgtest='python manage.py test --test-seed=-1 2>&1 |tee  ~/workspaces/wf/test-logs/BigSkyTests_`date +%y.%m.%d_%I:%M%p`.log'
    alias testlogs='ll ~/workspaces/wf/test-logs/'
    alias readlogs='subl ~/workspaces/wf/test-logs/'
    alias server=' python manage.py runserver 8001'
    alias server_nc='python manage.py runserver 8001 --disable_static_caching'
    alias snc='python manage.py runserver 8001 --disable_static_caching'
    alias erasereset=' python tools/erase_reset_data.py'
    alias mvn='nocorrect mvn'
    alias skyup='pip install -Ur requirements_dev.txt && pip install -Ur requirements.txt'
    alias skyup-force='pip install -r requirements_dev.txt && pip install -r requirements.txt'
    alias server-fix='pip uninstall -y PIL;pip uninstall httplib2; pip install httplib2;pip install -Ur requirements_dev.txt; pip install -Ur requirements.txt;git clean -xdf lib'
    alias wfhome='~/workspaces/wf/bigsky/z_bigsky/apps/home/ '
    alias wfrich='~/workspaces/wf/bigsky/z_bigsky/externals/richapps/'

# ------ Build Tools ------ #
    alias basic='ant clean-no-flex stage-no-flex generate-media'
    alias full='ant clean generate-as build stage generate-media'
    alias lazy='ant build-lazy generate-me  dia'
    alias js='ant clean-no-flex stage-no-flex'
    alias release='ant clean generate-as build-release stage generate-media'
    alias bust='ant -f build_parallel.xml bust-my-cache'
    alias build_generate='ant -f build_parallel.xml generate-as'
    alias bamboo_build='mvn package -T1C -Pci,generate-media,automation,generate -Dpython-testing-cpus=3'
    alias deploy_home='appcfg.py update -A wf-home . -V'
    alias deploy_richapps='appcfg.py update -A wf-richapps . -V'
    alias kill_pip='pip freeze | xargs pip uninstall -y'
# ------ Web Bones ------ #
    alias bones='~/workspaces/wf/web-bones'
    alias bonediff='git diff WebBones/master'
    alias start_qa='git push Codebuilders'

    function bone_synch {
        # fetch latest branches
        git fetch WebBones;
        # checkout local master
        git checkout master;
        # merge latest changes into local master
        git merge WebBones/master;
        # push updated master to repo
        git push origin;
        # checkout original branch
        git checkout $arg[0];
        # merge updated master
        git merge master;
        # push updated branch to repo.
        git push origin;
    }

# ------ Python ------ #
    alias clean_pyc='find . -name \*.pyc -exec rm {} \;'

# ------ GAE Tools ------
    alias start_server=' python manage.py runserver 8001'
    alias remote_console=' python tools/remote_api/console.py --servername=wf-keil.appspot.com --appid=s~wf-keil'
    alias remote_console_s16=' python tools/remote_api/console.py --servername=wf-section16.appspot.com --appid=s~wf-section16'
    alias remote_console_local=' python tools/remote_api/console.py --servername=localh329t:8001'
    alias deploy_to_appspot=' appcfg.py  -A wf-keil update . -V'
    alias reset_appspot_datastore=' python tools/remote_api/create_test_docs.py --servername=wf-keil.appspot.com --appid=s~wf-keil'
    alias reset_local_datastore=" python tools/erase_reset_data.py --admin='michael.clark@webfilings.com' --password='mike'"

# ------ Github ------ #
    alias gitsu='git submodule init && git submodule update'
    alias skydiff='git diff BigSky/master'
    alias mydiff='gd origin/'
    alias skyreset='git reset --hard Bigsky/master' #Reset branch to BigSky/Master branch.
    alias gs='git status'
    alias gist_token='curl -v -u michaelclark-wf -X POST https://api.github.com/authorizations --data "{\"scopes\":[\"gist\"]}"'
    alias gpo='git push origin'
    # ------ Github Config Commands ------ #
        # sets global alias for git log, also makes log pretty and easier to read.
        # git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

        # sets global config to colorize most git output from cli
        # git config --global color.ui true

        # sets config to push current branch to origin when calling `git push origin`
        # git config remote.origin.push HEAD

        # push the current branch to update a branch with the same name on the receiving end. Works in both central and non-central workflows.
        # git config --global push.default current

        # git grep configuration
        # git config --global grep.extendRegexp true
        # git config --global alias.g "grep --break --heading --line-number"
        # git config --global grep.lineNumber true

# ------ Functions ------ #
    git_commit_and_push() {
        [[-z $2]] &&  remote_branch=$2 ||  remote_branch='KenMaiRemote';
        # NO: int a = ($b == 5) ? $c : $d;
        # case "$b" in
        #      5) a=$c ;;
        #      *) a=$d ;;
        # esac
         # [[ $b = 5 ]] && a="$c" || a="$d"

        git commit -a -m $1;
        git push origin;
        git push $remote_branch;
    }
    alias gcandp='git_commit_and_push'

    git_checkout() {
        git checkout $1;
        gitsu;
        git status;
    }
    alias gco='git_checkout'

    #show diff against upstream branch.
    git_diff_all_remotes(){
        echo "Auto Diff. Origin Excluded."
        CUR_NAME=`git rev-parse --abbrev-ref HEAD`;

        #setup remote branches to compare against. Defaults to All remotes.
        if [ -n "$1" ]; then
            REMOTE_BRANCHES=("$1");
        else
            REMOTE_BRANCHES=($(git remote));
        fi

        for REMOTE in ${REMOTE_BRANCHES[@]}
        do
            #compare against branch
            { #try
                # if [$REMOTE -ne 'origin']; then
                    echo "Diff for:" $REMOTE
                    REMOTE=$(echo $REMOTE | sed 's/origin//g')
                    sleep 2s;
                    git diff $REMOTE/$CUR_NAME 2>/dev/null;
                    git diff $REMOTE/$CUR_NAME --numstat 2>/dev/null;
                # fi
            } || { #catch
                echo "No diff for " $REMOTE "/" $CUR_NAME
            }
        done

    # One Liner
    # {git diff KenMaiRemote/$(git rev-parse --abbrev-ref HEAD) 2>/dev/null}||{ echo "no diff" }
    }
    alias gda='git_diff_all_remotes'


    # function sed_remove_list(){
    #     sed_format=''
    #     for arg in $@
    #     do
    #         $sed_format+='s/'+$arg+'//g'
    #     done
    #     sed $sed_format
    # }
    # alias sr='sed_remove_list'

    # # git_current_branch=`git rev-parse --abbrev-ref HEAD`;
    # # gcb=$git_current_branch
    # # cb=$git_current_branch
    # alias git_current_checksum=`git rev-parse --sq HEAD@{now} | sed_remove_list '\ ' '\*' "'"`;
    # alias gcks='print $git_current_checksum'

    server_restart_and_bust(){
        print "Stopping Servers..."
        ks('python manage.py');
        print 'Servers Stopped!'

        print 'Busting Cache...'
        ant -f build_parallel.xml bust-my-cache > /dev/null 2>&1;
        print 'Busted!'

        print 'Starting Server...'
        python manage.py runserver 8001 --disable_static_caching > /dev/null 2>&1;
        print 'Started!'
    }
    alias rb='server_restart_and_bust'

    # Kill Proces ses that match query.
    process_kill_matching(){
        pid_query=$1;
        parallel kill ::: $(ps |grep -v grep | grep $pid_query | awk  '{print $1}')
    }
    alias pkm='process_kill_matching'

    # Kill all procs in list
    process_kill_list(){
        pids=$1
        if [  $pids[@] -gt 0 ]; then
            parallel kill ::: pids
        else
            print 'No processes found.'
        fi
    }
    alias pkl='process_kill_list'


    function run_cmd_x_times(){
        if [ $# -eq 0 ]
          then
            echo "No arguments supplied";

        fi
    }

    process_kill_server(){
        query='python manage.py';
        pids=$(process_get_running $query);
        process_kill_list $pids;
    }
    alias pks='process_kill_server'

    # Return array of PIDs that match selector
    process_get_running(){
        query=$1
        pids=$(ps |grep -v grep | grep $query | awk  '{print $1}')
        OIFS=$IFS;
        IFS='\n';
        pidArr=($pids);
        $IFS=$OIFS;
        return $pidArr
    }
    alias pgr='process_get_running'

    get_process_using_port(){
        port=$1;
        pid=$(sudo lsof -i | grep 35729 | awk '{print $2}');
        if [[ -n $pid ]]; then
            print "Pid: ${pid}";
            print "Port: ${port}";
            print "Kill process? (y/n)";
            read kill_choice;
            if [[ $kill_choice == "y" ]]; then
                sudo kill $pid;
            fi
        else;
            print "Port #${port}Not in use."
        fi
    }
    alias gpup='get_process_using_port'
# ------ No Correct ------#
    # alias subl='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2 2>&1 > /dev/null &'
    # alias subl='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2 > /dev/null 2>&1'

# ------ Configs ------#
    alias aliasconf='subl ~/.oh-my-zsh/lib/aliases.zsh'
        alias cfg_a='aliasconf'
        alias ca='aliasconf'

    alias sublconf='subl ~/Library/Application\ Support/Sublime\ Text\ 2'
        alias cfg_s='sublconf'
        alias cs='sublconf'

    alias sublsnip='subl ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/*.sublime-snippet'
        alias cfg_ss='sublsnip'
        alias css='sublsnip'

    alias zpconf='subl ~/.oh-my-zsh/themes/dallas.zsh-theme'
        alias cfg_z='zshconf'
        alias cz='zshconf'

    alias zshconf='subl ~/.oh-my-zsh/'
        alias cfg_zp='zpconf'
        alias czp='zpconf'
    alias zcfg='cd ~/.oh-my-zsh'

# ------ Reload Configs ------#
    reload_configs(){
        for arg in $@
        do
            print 'Reloading: ' $arg '...';
            case $arg in
                'zsh'|'all'|'*' )
                    source ~/.zshrc;;
                'alias'|'all'|'*' )
                    source ~/.oh-my-zsh/lib/aliases.zsh;;
                'prompt'|'all'|'*' )
                    source ~/.oh-my-zsh/themes/dallas.zsh-theme;;
                'exports'|'all'|'*' )
                    source ~/.oh-my-zsh/lib/exports.zsh;;
           esac
           print 'Reload Succesfull...'
        done
    }

    alias rlc='reload_configs'
    alias rlz='rlc "zsh"'
    alias rl='rlc "*"'
    alias rlp='rlc "prompt"'
    alias rla='rlc "alias"'

# ------ Maven Aliases ------#
    alias mvn_full_flex='mvn clean install -T12 -P-python-scripts,-js-projects'
    alias mff='mvn_full_flex'

    alias mvn_full='mvn clean install -T12'
    alias mf='mvn_full'

    alias mvn_lazy_flex='mvn install -T12 -Plazy,-python-scripts,-js-projects,-generate-media -DskipTests'
    alias mlf='mvn_lazy_flex'

    # I have merged the latest master into my branch. How do I rebuild affected
    #   libraries/modules/applications and run all flex unit tests?
    alias mvn_rebuild_and_test='mvn install -Pquick,-python-scripts,-js-projects,-generate-media -T12'
    alias mrt='mvn_rebuild_and_test'

    # I merged the latest master into my branch and ran a quick build from the
    #   flex directory, but the build failed. What gives?
    alias mvn_quick='mvn install -P-python-scripts,-js-projects,-generate-media'
    alias mq='mvn_quick'

    # I have made changes to several libraries. I want to rebuild all necessary files
    #    and run all flex unit tests. Could maven be told to run only suites in the
    #    rebuilt libraries?
    alias mvn_changed='mvn install -Plazy,-python-scripts,-js-projects,-generate-media'
    alias mc='mvn_changed'

    # I have made changes to a single library. How do I rebuild and run all of that
    #   library's unit tests?
    mvn_changed_single(){
        mvn test -pl flex/libraries/$1
    }
    alias mcs='mvn_changed_single $1'

    # How do I add a new flex library?
    mvn_add_lib(){
        cd flex/libraries
        mvn archetype:generate
            -DarchetypeRepository=http://repository.sonatype.org/content/groups/flexgroup/
            -DarchetypeGroupId=org.sonatype.flexmojos
            -DarchetypeArtifactId=flexmojos-archetypes-library
            -DarchetypeVersion=$1
            # $1:<flexmojos version>

    }
    alias m+='mvn_add_lib $1'

    # I ran unit tests in a library and Maven told me that one of the classes failed.
    #   How can I tell which test in that class failed?
    # Check out the test log for that class. You can find the test log in
    #   <your library>/target/surefire-reports/.
    # For example, if you were running wf_text and the TableImportRangeTest failed, you'd look for
    #   <repo root>/flex/libraries/wf_text/target/surefire-reports/TEST-com.webfilings.table.TableImportRangeTest.xml.

    # I have made changes to a single library. I want to test those changes in the application.
    # Just do a build (lazy or quick are fine) from the flex directory. The necessary RSLs and
    #   updated files will be copied to your static directory by the assembler, which runs from the flex directory when other projects have finished building (or been skipped).

# ------ Misc ------#
    # alias python='/usr/bin/python'
    alias chrome="open /Applications/Google\ Chrome.app/" #--args --disable-web-security"
   # alias ctags="`brew --prefix`/bin/ctags"
    alias diff='colordiff'
    alias cls='clear'
    alias ctags="`brew --prefix`/bin/ctags"
    alias click_off='crontab -r'
    alias click='~/workspaces/scripts/click'
    alias click_cron='print "*/2 * * * * _click 50 450"'
    alias click_on='click_cron > /tmp/click.crontab; crontab /tmp/click.crontab; rm /tmp/click.crontab'
    alias log_it=
    _click() {
        click_log='/Users/michaelclark/workspaces/configs/Cron/logs/click.log';
        print "`date`:: Calling click..." >> $click_log;
        click -x $1 -y $2;
    }

#------ CD ------ #
    alias ...='cd ../..'
    alias -- -='cd -'
    alias pu='pushd'
    alias po='popd'

# ------ Sudo ------ #
    alias _='sudo'
    alias please='sudo'

# ------ Grep ------ #
    alias g='grep -in'
    alias afind='ack-grep -il'

# ------ LS ------ #
    alias lsa='ls -lah'
    alias l='ls -la'
    alias ll='ls -l'
    alias la='ls -lA'
    alias sl=ls