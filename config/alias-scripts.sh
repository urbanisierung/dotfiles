# easy check in
gcaa() {
  local msg="${1:-wip $(date '+%Y-%m-%d %H:%M:%S')}"
  git add -A && git commit -m "${msg:-wip}" && gpsup && (gh pr view >/dev/null 2>&1 || gh pr create --fill)
}

# tmux functions

# ── engine ───────────────────────────────────────────────────────────────────
_tmux_open() {
  local session="$1"; shift
  if tmux has-session -t "$session" 2>/dev/null; then
    tmux attach -t "$session"; return
  fi
  tmux new-session -d -s "$session" -c "$1"; shift
  for dir; do
    tmux new-window -t "$session" -c "$dir"
  done
  tmux select-window -t "${session}:1"
  tmux attach -t "$session"
}

# ── config ────────────────────────────────────────────────────────────────────
# Reads sessions from ~/.config/.mytmux
# Format: name:dir1[:dir2:...]
# The first directory always gets two windows (opened twice).
typeset -ga _tmux_aliases=()

() {
  local cfg="$HOME/.config/.mytmux"
  [[ -f "$cfg" ]] || return
  local line parts name quoted p first
  while IFS= read -r line; do
    [[ -z "$line" || "$line" == \#* ]] && continue
    line="${(e)line}"
    parts=("${(@s/:/)line}")
    name="${parts[1]}"
    _tmux_aliases+=("$name")
    quoted="${(q)name}"
    first="${parts[2]}"
    # first dir gets two windows
    quoted+=" ${(q)first} ${(q)first}"
    for p in "${parts[@]:2}"; do quoted+=" ${(q)p}"; done
    eval "${name}() { _tmux_open ${quoted}; }"
  done < "$cfg"
}

tmux-list() {
  local name active
  for name in "${_tmux_aliases[@]}"; do
    if tmux has-session -t "$name" 2>/dev/null; then
      active=" (active)"
    else
      active=""
    fi
    print "${name}${active}"
  done
}

tmux-add() {
  local name="$1"
  if [[ -z "$name" ]]; then
    echo "Usage: tmux-add <name>" >&2; return 1
  fi
  local cfg="$HOME/.config/.mytmux"
  if grep -qE "^${name}:" "$cfg" 2>/dev/null; then
    echo "Name '${name}' already exists in $cfg" >&2; return 1
  fi
  echo "${name}:${PWD}" >> "$cfg"
  # register the alias immediately
  local quoted="${(q)name} ${(q)PWD} ${(q)PWD}"
  eval "${name}() { _tmux_open ${quoted}; }"
  _tmux_aliases+=("$name")
  echo "Added ${name} → ${PWD}"
}