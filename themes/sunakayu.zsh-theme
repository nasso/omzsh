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
  local ref='self.change_id().shortest(3)'
  local empty_color="$fg[green]"
  local nonempty_color="$fg[magenta]"

  jj_prompt_template_raw "if(self.empty(), \"%{$empty_color%}\", \"%{$nonempty_color%}\") ++ $ref ++ \" \"" \
  || git_prompt_status
}
_omz_register_handler _sunakayu_vcs_status
_sunakayu_vcs_status_async() {
  echo -n $_OMZ_ASYNC_OUTPUT[_sunakayu_vcs_status]
}

_sunakayu_vcs_info() {
  jj_prompt_template 'surround("", " ", self.description().first_line())' \
  || git_prompt_info
}
_omz_register_handler _sunakayu_vcs_info
_sunakayu_vcs_info_async() {
  echo -n $_OMZ_ASYNC_OUTPUT[_sunakayu_vcs_info]
}

PROMPT='%(?..%{$fg_bold[red]%}exit %?
%{$reset_color%})'\
'%{$bold_color%}$(_sunakayu_vcs_status_async)%{$reset_color%}'\
'$(_sunakayu_vcs_info_async)'\
'%{$fg[$user_color]%}%~%{$reset_color%}'\
'%(!.#.>) '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
