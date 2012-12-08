if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jr jr

_jr() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(jr commands)"
  else
    completions="$(jr completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
