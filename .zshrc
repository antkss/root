if [ -z $DISPLAY ]; then 
   neofetch
fi 
autoload -U colors && colors
export DISPLAY=:0
export zshdir=~/.zsh
export PATH=$PATH:/home/as/.bin/bin
autoload -Uz compinit 
if [[ -n $zshdir/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;
## Colorize the ls output ##
alias ls='ls --color=auto'
source $zshdir/zsh-autosuggestions/zsh-autosuggestions.zsh
source $zshdir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export HISTFILE="$zshdir/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP
# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Note: If you change %c% in line
# 	%{$terminfo[bold]$fg[yellow]%}%c%{$reset_color%}\
# to %~% it will display the whole working directory
#
# Feb 2022 TOURE A. KARIM

# VCS
PARROT_VCS_PROMPT_PREFIX1=" %{$reset_color%}on%{$fg[blue]%} "
PARROT_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
PARROT_VCS_PROMPT_SUFFIX="%{$reset_color%}"
PARROT_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
PARROT_VCS_PROMPT_CLEAN=" %{$fg[green]%}✓"

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="${PARROT_VCS_PROMPT_PREFIX1}git${PARROT_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$PARROT_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$PARROT_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$PARROT_VCS_PROMPT_CLEAN"

# SVN info
ZSH_THEME_SVN_PROMPT_PREFIX="${PARROT_VCS_PROMPT_PREFIX1}svn${PARROT_VCS_PROMPT_PREFIX2}"
ZSH_THEME_SVN_PROMPT_SUFFIX="$PARROT_VCS_PROMPT_SUFFIX"
ZSH_THEME_SVN_PROMPT_DIRTY="$PARROT_VCS_PROMPT_DIRTY"
ZSH_THEME_SVN_PROMPT_CLEAN="$PARROT_VCS_PROMPT_CLEAN"

# HG info
parrot_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${PARROT_VCS_PROMPT_PREFIX1}hg${PARROT_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [[ "$(hg config oh-my-zsh.hide-dirty 2>/dev/null)" != "1" ]]; then
			if [ -n "$(hg status 2>/dev/null)" ]; then
				echo -n "$PARROT_VCS_PROMPT_DIRTY"
			else
				echo -n "$PARROT_VCS_PROMPT_CLEAN"
			fi
		fi
		echo -n "$PARROT_VCS_PROMPT_SUFFIX"
	fi
}

# Virtualenv
YS_THEME_VIRTUALENV_PROMPT_PREFIX=" %{$fg[green]%}"
YS_THEME_VIRTUALENV_PROMPT_SUFFIX=" %{$reset_color%}%"
virtenv_prompt() {
	[[ -n "${VIRTUAL_ENV:-}" ]] || return
	echo "${YS_THEME_VIRTUALENV_PROMPT_PREFIX}${VIRTUAL_ENV:t}${YS_THEME_VIRTUALENV_PROMPT_SUFFIX}"
}

local exit_code="%(?,,code:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# [TIME] [PRIVILEGES USER @ MACHINE] [DIRECTORY] on git:BRANCH STATE code:LAST_EXIT_CODE
# $ COMMAND

PROMPT="
%{$fg_bold[red]%}┌──[%{$reset_color%}%*\
%{$fg_bold[red]%}]─[%{$reset_color%}\
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
%{$reset_color%}@\
%{$fg[green]%}%m\
%{$reset_color%}%{$fg_bold[red]%}]─[%{$reset_color%}\
%{$terminfo[bold]$fg[yellow]%}%c%{$reset_color%}\
%{$fg_bold[red]%}]%{$reset_color%}\
${hg_info}\
${git_info}\
${svn_info}\
${venv_info}\
 \
$exit_code
%{$terminfo[bold]$fg[red]%}└──╼ %{$reset_color%}\
%(?:%{$fg_bold[yellow]%}$ :%{$fg_bold[red]%}$ )%{$reset_color%}"
