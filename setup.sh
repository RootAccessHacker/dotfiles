#!/bin/ksh

# Ensure the script is run as a normal user with root privileges
if [ "$(id -u)" = "0" ]; then
    echo "Please run this script as a normal user with root privileges (doas or sudo)."
    exit 1
fi

echo "Updating package repository and installing required packages..."
doas pkg_add -u
doas pkg_add cwm xterm conky nerd-fonts

echo "Creating configuration directories..."
mkdir -p ~/.config/cwm
mkdir -p ~/.config/conky

echo "Configuring cwm..."
cat <<EOF > ~/.cwmrc
# cwm configuration

# Keybindings
bind-key M-Return "xterm"
bind-key M-c "conky"
bind-key M-q "kill"

# Font configuration for xterm
xterm*faceName: JetBrainsMono Nerd Font:size=12

# Color scheme (optional)
color activeborder blue
color inactiveborder grey
color urgentborder red
EOF

echo "Configuring xterm..."
cat <<EOF > ~/.Xresources
XTerm*faceName: JetBrainsMono Nerd Font
XTerm*faceSize: 12
EOF

# Apply the Xresources configuration
xrdb -merge ~/.Xresources

echo "Configuring conky..."
cat <<EOF > ~/.conkyrc
conky.config = {
    alignment = 'top_right',
    background = false,
    border_width = 1,
    cpu_avg_samples = 2,
    default_color = 'white',
    default_outline_color = 'black',
    default_shade_color = 'black',
    draw_borders = false,
    draw_graph_borders = true,
    draw_outline = false,
    draw_shades = false,
    use_xft = true,
    font = 'JetBrainsMono Nerd Font:size=10',
    gap_x = 10,
    gap_y = 10,
    minimum_height = 5,
    minimum_width = 5,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = false,
    out_to_stderr = false,
    extra_newline = false,
    own_window = true,
    own_window_class = 'Conky',
    own_window_type = 'override',
    stippled_borders = 0,
    update_interval = 1.0,
    uppercase = false,
    use_spacer = 'none',
    show_graph_scale = false,
    show_graph_range = false
}

conky.text = [[
\${color grey}Uptime:\$color \$uptime
\${color grey}CPU Usage:\$color \$cpu%
\${color grey}Memory Usage:\$color \$mem/\$memmax - \$memperc%
\${color grey}Swap Usage:\$color \$swap/\$swapmax - \$swapperc%
\${color grey}Processes:\$color \$processes  \${color grey}Running:\$color \$running_processes
]]
EOF

echo "Setting up xsession to autostart conky and cwm..."
cat <<EOF > ~/.xsession
#!/bin/ksh

# Merge Xresources
xrdb -merge ~/.Xresources

# Start conky
conky &

# Start cwm
exec cwm
EOF

# Make xsession executable
chmod +x ~/.xsession

echo "Setup complete. You can start your session with 'startx'."
