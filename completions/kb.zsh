if [[ ! -o interactive ]]; then
    return
fi

compctl -K _kb kb

_kb() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(kb commands)"
  else
    completions="$(kb completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
