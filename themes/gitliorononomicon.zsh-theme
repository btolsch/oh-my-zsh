function prompt_char {
	git branch &>/dev/null && echo '»' && return
	echo '='
}

function virtualenv_info {
	[ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') '
}

main_color='green'
PROMPT='
%{$fg[$main_color]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[$main_color]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
%{$fg[$main_color]%}$(virtualenv_info)$(prompt_char)::%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[$main_color]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}!"
ZSH_THEME_GIT_PROMPT_CACHED="%{$fg_bold[yellow]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
