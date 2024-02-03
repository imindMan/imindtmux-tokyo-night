#!/usr/bin/env bash
set -euxo pipefail

export LC_ALL=en_US.UTF-8

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# shellcheck source=src/utils.sh
. "$CURRENT_DIR/utils.sh"

theme_variation="night"
theme_enable_icons=1
theme_disable_plugins=0

# shellcheck source=src/palletes/night.sh
. "$CURRENT_DIR/palletes/$theme_variation.sh"

### Load Options
border_style_active_pane="fg=${PALLETE[blue2]}"
border_style_inactive_pane="fg=${PALLETE[bg_highlight]}"
left_separator=''
right_separator=''

# https://man.openbsd.org/OpenBSD-current/man1/tmux.1#acs
window_with_activity_style="italics"
window_status_bell_style="bold"

tmux set-option -g status-position top
tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

tmux set-window-option -g window-status-activity-style "$window_with_activity_style"
tmux set-window-option -g window-status-bell-style "${window_status_bell_style}"

# message styling
tmux set-option -g message-style "bg=${PALLETE[orange]},fg=${PALLETE[bg_dark]}"

# status bar
tmux set-option -g status-style "bg=${PALLETE[bg_dark]},fg=${PALLETE[white]}"

# border color
tmux set-option -g pane-active-border-style "$border_style_active_pane"
tmux set-option -g pane-border-style "$border_style_inactive_pane"

### Left side
tmux set-option -g status-left "$(generate_left_side_string)"

### Windows list
tmux set-window-option -g window-status-format "$(generate_inactive_window_string)" 
tmux set-window-option -g window-status-current-format "$(generate_active_window_string)"

### Right side
tmux set-option -g status-right ""

plugin="datetime"

# shellcheck source=src/plugin/datetime.sh
. "${CURRENT_DIR}/plugin/${plugin}.sh"

icon_var="plugin_${plugin}_icon"
accent_color_var="plugin_${plugin}_accent_color"
accent_color_icon_var="plugin_${plugin}_accent_color_icon"

plugin_icon="${!icon_var}"
accent_color="${!accent_color_var}"
accent_color_icon="${!accent_color_icon_var}"

separator_start="#[fg=${PALLETE[$accent_color]},bg=${PALLETE[bg_dark]}]${right_separator}#[none]"
separator_end="#[fg=${PALLETE[bg_dark]},bg=${PALLETE[$accent_color]}]${right_separator}#[none]"
separator_icon_start="#[fg=${PALLETE[$accent_color]},bg=${PALLETE[bg_dark]}]${right_separator}#[none]"
separator_icon_end="#[fg=${PALLETE[$accent_color]},bg=${PALLETE[$accent_color]}]${right_separator}#[none]"

plugin_output="#[fg=${PALLETE[bg]},bg=${PALLETE[$accent_color]}]$(load_plugin)#[none]"
plugin_icon_output="${separator_icon_start}#[fg=${PALLETE[bg]},bg=${PALLETE[$accent_color]}]${plugin_icon}${separator_icon_end}"

plugin_output_string="${plugin_icon_output}${plugin_output}"

tmux set-option -ga status-right "$plugin_output_string"

tmux set-window-option -g window-status-separator ''
