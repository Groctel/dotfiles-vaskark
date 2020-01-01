# Minimal zsh theme
# Requires Nerd Fonts for the icons

# Configuration
num_dirs=2 # Use 0 for full path
truncated_path="%F{yellow}[%$num_dirs~]%f"
#                         
decoration="%F{cyan}%f"
time="%F{cyan}[%D{%l:%M %p}]%f"

# Left prompt
PROMPT='$truncated_path $decoration '
# Right prompt
RPROMPT='$time'

# Input in bold
zle_highlight=(default:bold)
