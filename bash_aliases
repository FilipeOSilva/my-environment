# Indicate branch in use in git
if [[ $TERM == "xterm-256color" ]]; then
	[[ $(git --version &> /dev/null)$? -eq 0 ]] && {
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[37m\]@\[\033[33m\]\h:\[\033[01;34m\]\w\[\033[31;1m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
	}
fi

# Using user bin to execute bash and python scripts
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/.local/bin/scripts/bash/

#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# Bind
#bind '"\C-r"':"\"history | fzf\C-m\""
bind '"\C-r": "history | fzf | awk \x27{ $1=\x22\x22; print substr($0,2) }\x27; \C-m"'

# Alias
alias ips='ip -c -br a'
alias update='sudo apt update && sudo apt upgrade'
alias pstree='pstree -npTC age'

# Functions Alias
remote_wireshark() {
    echo $3 | sshpass -p $3 ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR -o ConnectTimeout=5 admin@$1 'tcpdump -i '$2 '-U -w -' | wireshark -k -i -
}

