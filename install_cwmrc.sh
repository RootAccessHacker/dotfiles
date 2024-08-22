cat <<EOF > ~/.cwmrc
# cwm configuration

# Keybindings
bind-key M-Return "xterm"
bind-key M-c "conky"
bind-key M-q "kill"

# Set the default font for xterm
xterm*faceName: JetBrainsMono Nerd Font:size=12

# Color scheme (optional, can be customized)
color activeborder blue
color inactiveborder grey
color urgentborder red
EOF
