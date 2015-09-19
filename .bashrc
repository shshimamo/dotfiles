PS1='\[\033[36m\][\u@:\[\033[33m\]\w\[\033[36m\]]\[\033[0m\] \$ '
alias ls='ls -G'
alias ll='ls -laG'

# add JBOSS_HOME
export JBOSS_HOME=/Users/shima/wildfly/wildfly

# add PATH for DERBY
#export DERBY_HOME=/Applications/NetBeans/glassfish-4.0/javadb/
export DERBY_HOME=/Users/shima/glassfish_zip/glassfish3/javadb/
export PATH=$DERBY_HOME/bin/:$PATH

# add PATH for RVM
export PATH=/Users/shima/.rvm/bin/:$PATH
# add PATH for mysql
export PATH=/Users/shima/mysql/bin:$PATH
# add PATH for gradle
#export GRADLE_HOME=/Users/shima/gradle/gradle-1.12  zipから展開したやつ
export GRADLE_HOME=/Users/shima/.gvm/gradle/current
export PATH=$GRADLE_HOME/bin:$PATH
# add PATH for maven
export M2_HOME=/Users/shima/maven/apache-maven-3.1.1
export PATH=$M2_HOME/bin:$PATH
# add PATH for java
#export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$CLASSPATH:./

# add PATH for activator
export PATH=/Users/shima/typesafe/activator-1.2.10-minimal:$PATH

# for git
alias git='/usr/local/bin/git'
function parse_git_branch {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
     PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
     #PS1="\h@\u:\W\$(parse_git_branch) \$ "
      PS1='\[\033[36m\][\u@:\[\033[33m\]\W\[\033[36m\]]\[\033[0m\]$(parse_git_branch) \$ '
}
proml

alias g='git'

alias nch='cd /Users/shima/rails_app/nchak'
alias r2='cd /Users/shima/rails_app/resource_reservation'
alias g4='cd /Applications/NetBeans/glassfish-4.0/glassfish/domains/domain1'
alias nb='cd /Users/shima/netbeans/netbeans7_4'
alias jirb='java -cp /Users/shima/Downloads/bsh-2.0b4.jar bsh.Console'
alias sai='cd /Users/shima/saito_project/eclipse_checkout/ee6_study'

# for GNU command
# http://d.hatena.ne.jp/katz_24/20120126/1327586474
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/shima/.gvm/bin/gvm-init.sh" ]] && source "/Users/shima/.gvm/bin/gvm-init.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
