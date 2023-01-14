set-option -ga terminal-overrides ",alacritty:Tc"
set-option -g default-terminal "alacritty"
set -s escape-time 0
set -g base-index 1

# Change the prefix keybind
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Prefix r to source tmux config file
bind r source-file ~/.tmux.conf

# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# vim-like keybinding for copy mode and command prompt
set -g mode-keys vi
set -g status-keys vi

# **************************************
# Tmux Plugin Manager
# **************************************
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Theme
set -g @plugin 'catppuccin/tmux'
set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
