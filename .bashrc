# PS1='\[\033[36m\][\u@:\[\033[33m\]\w\[\033[36m\]]\[\033[0m\] \$ '

# for git
# function parse_git_branch {
#      git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
# }
# function precmd() {
#      PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
# }
# function proml {
#      #PS1="\h@\u:\W\$(parse_git_branch) \$ "
#       PS1='\[\033[36m\][\u@:\[\033[33m\]\W\[\033[36m\]]\[\033[0m\]$(parse_git_branch) \$ '
# }
# proml
