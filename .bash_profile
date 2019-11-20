alias ls="ls -G"
GREEN="$(tput setaf 2)"
RESET="$(tput sgr0)"
export PROMPT_COMMAND='BRANCH="";\
    if git branch &>/dev/null; then\
        BRANCH=$(git branch 2>/dev/null | grep \* | cut -d " " -f 2)" ";\
    fi;\
    echo -ne "\033]0;alexMac\007"\
'
PS1='\[\e[0;33m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] ${GREEN}$BRANCH${RESET}\$ '
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

