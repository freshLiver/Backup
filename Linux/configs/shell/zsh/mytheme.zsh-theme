# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"


# Prompt hints
USER_DEVICE_PROMPT_HINT=%{$GREEN_BOLD%}%n@%m%{$RESET_COLOR%}
PATH_PROMPT=%{$YELLOW_BOLD%}%~%u%{$RESET_COLOR%}

GIT_BRIEF_PROMPT_HINT=$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}
GIT_DETAIL_PROMPT_HINT=%{$GREEN_BOLD%}$(git_current_branch)$(git_prompt_short_sha)$(git_prompt_status)%{$RESET_COLOR%}

TIME_PROMPT_HINT=%{$GREEN_BOLD%}%D{%H:%M:%S}%{$RESET_COLOR%}
EXIT_PROMPT_HINT=%{$GREEN_BOLD%}%(?..%{$RED%}[%?]\ )\$\ %{$RESET_COLOR%}


# Prompt format
PROMPT='
$USER_DEVICE_PROMPT_HINT:$PATH_PROMPT $GIT_BRIEF_PROMPT_HINT
$TIME_PROMPT_HINT $EXIT_PROMPT_HINT'

RPROMPT='$GIT_DETAIL_PROMPT_HINT'
