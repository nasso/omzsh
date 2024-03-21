# "sunaku" but orange/yellow

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

local user_color='yellow'
test $UID -eq 0 && user_color='red'

_sunakayu_vcs_status() {
  jj_prompt_template 'if(!self.empty(), "!")' \
  || git_prompt_status
}

_sunakayu_vcs_info() {
  jj_prompt_template 'self.change_id().shortest(3) ++ " "' \
  || git_prompt_info
}

_sunakayu_vcs_short_desc() {
  jj_prompt_template 'surround("", " ", self.description().first_line())'
}

PROMPT='%(?..%{$fg_bold[red]%}exit %?
%{$reset_color%})'\
'%{$bold_color%}$(_sunakayu_vcs_status)%{$reset_color%}'\
'$(_sunakayu_vcs_info)'\
'%{$bold_color%}$(_sunakayu_vcs_short_desc)%{$reset_color%}'\
'%{$fg[$user_color]%}%~%{$reset_color%}'\
'%(!.#.>) '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
