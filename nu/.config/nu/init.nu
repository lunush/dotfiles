# Launch tmux if not already running
if $(which tmux | empty?) == $false {
  if $nu.env.TERM !~ "tmux" {
    if $nu.env.TERM !~ "screen" {
      exec tmux new-session
    } {}
  } {}
} {}

# Setup keyboard
setxkbmap -option grp:alt_shift_toggle -option ctrl:nocaps -layout us,ru
xset r rate 300 50
