# easy check in
gcaa() {
  local msg="${1:-wip $(date '+%Y-%m-%d %H:%M:%S')}"
  git add -A && git commit -m "$msg" && gpsup && (gh pr view >/dev/null 2>&1 || gh pr create --fill)
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
# Format: "alias-name:dir1:dir2:..."
# alias-name becomes both the shell alias and the tmux session name.
# Each dir gets its own window. Paths must not contain colons.
typeset -ga _tmux_aliases=()

() {
  local -a sessions=(
    "tmux-kh:$HOME/github.com/lifosy/monorepo:$HOME/github.com/lifosy/monorepo"
    "tmux-lumen:$HOME/github.com/lumen-logic-studio/monorepo:$HOME/github.com/lu>
    "tmux-erd:$HOME/github.com/data-democracy/monorepo-nextgen:$HOME/github.com/>
    "tmux-u11g:$HOME/github.com/urbanisierung/urbanisierung.dev:$HOME/github.com>
    # "tmux4:$HOME"
  )
  local entry parts name quoted p
  for entry in "${sessions[@]}"; do
    parts=("${(@s/:/)entry}")
    name="${parts[1]}"
    _tmux_aliases+=("$name")
    quoted="${(q)name}"
    for p in "${parts[@]:1}"; do quoted+=" ${(q)p}"; done
    eval "${name}() { _tmux_open ${quoted}; }"
  done
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