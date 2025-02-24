DISABLE_AUTO_TITLE="true"
function precmd () {
  window_title="\033]0;zsh:${PWD##*/}/\007"
  echo -ne "$window_title"
}
