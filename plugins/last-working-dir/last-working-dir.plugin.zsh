# Flag indicating if we've previously jumped to last directory
typeset -g ZSH_LAST_WORKING_DIRECTORY

# Updates the last directory once directory is changed
autoload -U add-zsh-hook
add-zsh-hook chpwd chpwd_last_working_dir
chpwd_last_working_dir() {
	if [ "$ZSH_SUBSHELL" = 0 ]; then
		local cache_file="$ZSH_CACHE_DIR/last-working-dir"
		pwd >| "$cache_file"
	fi
}

# Changes directory to the last working directory
lwd() {
	#puts ranger-given path when launching shell into lwd cache
	#parent=$(ps -o pid,comm x | grep $PPID | cut -d ' ' -f 2)
	#[[ $? = 0 ]] && [[ $parent = 'ranger' ]] && chpwd
	local cache_file="$ZSH_CACHE_DIR/last-working-dir"
	[[ -r "$cache_file" ]] && cd "$(cat "$cache_file")"
}

# Jump to last directory automatically unless:
# - this isn't the first time the plugin is loaded
# - it's not in $HOME directory
[[ -n "$ZSH_LAST_WORKING_DIRECTORY" ]] && return
[[ "$PWD" != "$HOME" ]] && return

lwd 2>/dev/null && ZSH_LAST_WORKING_DIRECTORY=1 || true
