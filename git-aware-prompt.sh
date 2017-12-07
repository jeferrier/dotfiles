find_git_branch() {
  # Based on: http://stackoverflow.com/a/13003854/170413
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

find_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=''
  fi
}

_z_add_pwd() {
	_z --add "$(command pwd 2>/dev/null)" 2>/dev/null;
}

new_ps1() {
  export PS1="\[\e[0;32m\]\n\u@\h \[\e[0;33m\]\w \[\e[0;37m\]$git_branch\[\e[0;31m\]$git_dirty\n\[\e[0;0m\]$ ";
}

PROMPT_COMMAND="_z_add_pwd; find_git_branch; find_git_dirty; new_ps1; $PROMPT_COMMAND"

# Default Git enabled prompt with dirty state
# export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Another variant:
# export PS1="\[$bldgrn\]\u@\h\[$txtrst\] \w \[$bldylw\]\$git_branch\[$txtcyn\]\$git_dirty\[$txtrst\]\$ "

# Default Git enabled root prompt (for use with "sudo -s")
# export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
