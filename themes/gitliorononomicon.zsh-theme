function prompt_char {
	git branch &>/dev/null && echo '»' && return
	echo '='
}

function virtualenv_info {
	[ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') '
}

main_color='038'
attn_color='003'
alert_color='124'
PROMPT='%(?..%{$FG[$alert_color]%}o_O %?)
%{$FG[$main_color]%}%n%{$reset_color%}@%{$FG[$attn_color]%}%m%{$reset_color%}:%{$FG[$main_color]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
%{$FG[$main_color]%}$(virtualenv_info)$(prompt_char)::%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$FG[$main_color]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[$attn_color]%}%B!%b"
ZSH_THEME_GIT_PROMPT_CACHED="%{$FG[$attn_color]%}%B?%b"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$FG[$alert_color]%}%B(+)%b"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$FG[$attn_color]%}%B++%b"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$FG[$attn_color]%}%B--%b"
ZSH_THEME_GIT_PROMPT_DIVERGED=" %{$FG[$attn_color]%}%B<>%b"
ZSH_THEME_GIT_PROMPT_EVEN=" %{$FG[$attn_color]%}%B==%b"
