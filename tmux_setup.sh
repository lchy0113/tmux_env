#/bin/dash

##########################################################
# tmux configuration Script.
# 19/07/02
##########################################################

CURRENT_DIR="$(pwd)"

TMUX_CONF_LOCAL="$CURRENT_DIR/tmux.conf.local"
TMUX_CONF="$CURRENT_DIR/tmux.conf"

# Define the target symbolic link locations
LINK_TARGET_LOCAL="$HOME/.tmux.conf.local"
LINK_TARGET="$HOME/.tmux.conf"

# Remove existing symbolic links or files if they already exist
if [ -e "$LINK_TARGET_LOCAL" ] || [ -L "$LINK_TARGET_LOCAL" ]; then
    echo "Removing existing $LINK_TARGET_LOCAL"
    rm -f "$LINK_TARGET_LOCAL"
fi

if [ -e "$LINK_TARGET" ] || [ -L "$LINK_TARGET" ]; then
    echo "Removing existing $LINK_TARGET"
    rm -f "$LINK_TARGET"
fi

# Create new symbolic links pointing to the current directory's tmux config files
ln -s "$TMUX_CONF_LOCAL" "$LINK_TARGET_LOCAL"
ln -s "$TMUX_CONF" "$LINK_TARGET"


# Print success message
echo "✅ tmux environment setup completed!"
echo "🔗 $LINK_TARGET_LOCAL -> $TMUX_CONF_LOCAL"
echo "🔗 $LINK_TARGET -> $TMUX_CONF"



