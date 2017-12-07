#!/bin/sh
# Start up an SSH agent so I don't have to write the keys all the time
# Taken from https://github.com/laserswald/dotfiles/blob/master/sh/.sh.d/modules/sshagent.sh
# Author Ben Davenport-Ray

EXTRA_KEYS=''

ssh_add_extras() {
	set -x
	echo "Adding extra SSH keys to your keyring..."
	for f in $EXTRA_KEYS
	do
		if test -f $f
		then
			ssh-add "$f"
		fi
	done
	set +x
}

ssh_setup_keys() {
	if ! ssh-add -l >/dev/null; then
		ssh-add
		ssh_add_extras
	fi
}

ssh_agent_stop() {
	pkill ssh-agent
	unset SSH_AGENT_PID SSH_AUTH_SOCK
	[ -f ~/.ssh/agent_cmds.sh ] && rm ~/.ssh/agent_cmds.sh
}

if ! pgrep -u $USER ssh-agent > /dev/null; then
	unset SSH_AGENT_PID SSH_AUTH_SOCK
	ssh-agent -s > ~/.ssh/agent_cmds.sh
fi
if [ ! "$SSH_AGENT_PID" -o ! "$SSH_AUTH_SOCK" ]; then
	eval $(<~/.ssh/agent_cmds.sh)
	if ! ssh-add -l >/dev/null; then
		ssh_setup_keys
	fi
fi
