############# 终端别名设置脚本 #############
#
#
#
###########################################



# 公共配置

echo -e "\033[33m  load term_alias.bash \033[0m \r\n"
function parse_git_branch_and_add_brackets {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

function iterm2_print_user_vars() {
  iterm2_set_user_var iterm2_current_ip $current_ip
 iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

PS1='\[\e[1;33m\]\u\[\e[m\]@\[\e[1;33m\]\H:\[\e[0m\e[1;33m\]\W\[\e[m\]$\[\e[1;33m\]$(parse_git_branch_and_add_brackets)\[\e[m\] '
export CLICOLOR=1
export LSCOLORS=gxfxaxdxcxegedabagacad

# git alias

alias ga='git add .'
alias gb='git branch '
alias gd='git diff '
alias gf='git fetch --all'
if["$(uname)"=="Darwin"];then
    alias gfm='git fetch --all && git rev-parse --abbrev-ref HEAD | xargs -t -I {} git merge origin/{}'
    alias gg='git rev-parse --abbrev-ref HEAD | xargs -t -I {} git push origin {}:{}'
    alias gga='git rev-parse --abbrev-ref HEAD | xargs -t -I {} git push all {}:{}'
else
    alias gfm='git fetch --all && git rev-parse --abbrev-ref HEAD | xargs -t -i {} git merge origin/{}'
    alias gg='git rev-parse --abbrev-ref HEAD | xargs -t -i {} git push origin {}:{}'
    alias gga='git rev-parse --abbrev-ref HEAD | xargs -t -i {} git push all {}:{}'
fi
alias gitdebug='ga && gm "debug" && gg'
alias gitmergeabort='echo -e "\033[33m 有内鬼，终止交易！\033[0m \r\n" && echo -e "\033[33m git merge --abort \033[0m \r\n" && git merge --abort'
alias glog='git log master --date=format:"%Y-%m-%d" --pretty=format:"%Cred%h%Creset%Cgreen>>>>>>%cd>>>>>>%C(bold blue)%an>>>>>>%Cblue%s%Creset"  --since="2017-08-01 15:27:36" '
alias gm='git commit -m '
alias gs='git status'
