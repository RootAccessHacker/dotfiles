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
${color grey}Uptime:$color $uptime
${color grey}CPU Usage:$color $cpu%
${color grey}Memory Usage:$color $mem/$memmax - $memperc%
${color grey}Swap Usage:$color $swap/$swapmax - $swapperc%
${color grey}Processes:$color $processes  ${color grey}Running:$color $running_processes
]]
EOF
