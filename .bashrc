py() {
  if [[ $# -eq 0 ]]; then
    command python3 main.py
  else
    command python3 "$@"
  fi
}

rs() {
  command cargo run "$@"
}

rsb() {
  command cargo build --release --target-dir .target "$@"
}

twee() {
  ~/.neotwee "$@"
  #you can use -f btw
}

if [[ -t 1 ]]; then
  alias grep='grep --color=auto'
  alias ls='command ls --color=auto'
  alias dir='command dir --color=auto'
fi

alias mvenv='bash ~/.venv.sh'
alias pif='pip freeze > requirements.txt'
alias cls='clear'
alias upd='sudo apt update && sudo apt upgrade -y'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

is() {
  [[ $# -lt 1 ]] && { echo "usage: is <path> [...]" >&2; return 1; }

  local status=0
  for path in "$@"; do
    if [[ -e $path ]]; then
      echo "$path true"
    else
      echo "$path false"
      status=1
    fi
  done

  return $status
}

shopt -s cdspell
shopt -s cmdhist
shopt -s histappend

export PS1="\[\e[38;2;246;173;198m\]\u\[\e[38;2;154;183;255m\]@\h\[\e[0m\]:\[\e[38;5;117m\] \w\[\e[0m\]\$ "

export PIP_BREAK_SYSTEM_PACKAGES=1
