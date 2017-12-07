#Include the directory jumping tool
_Z_NO_PROMPT_COMMAND=true
. ~/z.sh

#Set up a dynamic ps1 that checks git branch
. ~/git-aware-prompt.sh

#Git related
git_grep_delete_branch() {

	git branch | grep -v "dev" | grep -v "prod" | grep -v "\*" | grep $1 | xargs -n 1 git branch -d

}
alias gclean=git_grep_delete_branch

git_grep_search_branch(){

	git branch | grep -v "dev" | grep -v "prod" | grep -v "\*" | grep $1

}

alias gtry=git_grep_search_branch

alias glist='git branch | grep -v "dev" | grep -v "prod" | grep -v "\*"'

git_grep_branch_checkout() {

	git stash && git stash clear && git branch | grep $1 | xargs -n 1 git checkout

}
alias gco=git_grep_branch_checkout

git_grep_branch_checkout_pull(){

	emptystring=''
	timestamp=`date +%s`
	git stash save $timestamp
	execute=`git stash list | grep $timestamp | sed 's/^\(.*\):.*:.*$/\1/'`
	if [ ! "$execute" = "$emptystring" ] ;
		then echo $execute | xargs -n 1 git stash drop ;
	fi ;
	git branch | grep $1 | xargs -n 1 git checkout -f && git pull

}
alias gcp=git_grep_branch_checkout_pull

alias gd='git diff -b'

alias gs='git status'

alias ll='ls -la'

#Alias for contacting the server
alias adev='ssh jferrier@adev01d.azaleahealth.com'

#Quicksave and restore commands for Faster Than Light
quicksave_ftl(){
	cp /Users/jferrier/Library/Application\ Support/FasterThanLight/continue.sav "/Users/jferrier/ftl_quicksaves/continue-$1.backup"
}

restore_quicksave_ftl() {
	cp "/Users/jferrier/ftl_quicksaves/continue-$1.backup" /Users/jferrier/Library/Application\ Support/FasterThanLight/continue.sav
}

alias qs='quicksave_ftl'
alias rs='restore_quicksave_ftl'
