set-option -g default-terminal "tmux-256color"
set-option -ga terminal-overrides ",*:RGB"

set -s escape-time 0
set -g base-index 1

# Change the prefix keybind
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Prefix + r to source tmux config file
bind r source-file ~/.tmux.conf

# Split binds config
unbind %
bind | split-window -h 

unbind '"'
bind - split-window -v

# vim-like pane switching
# bind -r ^ last-window
bind k select-pane -U
bind j select-pane -D
bind h select-pane -L
bind l select-pane -R

# vim-like keybinding for copy mode and command prompt
set -g mode-keys vi
set -g status-keys vi

# Maximize pane
bind -r m resize-pane -Z

# **************************************
# Tmux Plugin Manager
# **************************************
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'tmux-plugins/tmux-resurrect' # persist tmux sessions after computer restart
set -g @plugin 'tmux-plugins/tmux-continuum' # automatically saves sessions for you every 15 minutes

set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '1' # Save every 5 minutes

# Themes
set -g @plugin 'janoamaral/tokyo-night-tmux'
# set -g @plugin 'catppuccin/tmux'
# set -g @catppuccin_flavour 'mocha' # or frappe, macchiato, mocha

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
