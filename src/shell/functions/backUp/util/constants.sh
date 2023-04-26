###############
## Default(s) ##
###############
## Directory(ies) ##
# Name of directory back ups are stored in.
DEFAULT_BACK_UP_DEST_DIR=$(date +"%Y-%m-%d")
readonly DEFAULT_BACK_UP_DEST_DIR

## Default Path(s) ##
# Tracks default path to directory being backed up.
DEFAULT_BACK_UP_SOURCE_PATH="$HOME/"
readonly DEFAULT_BACK_UP_SOURCE_PATH
# Tracks path backup will be created at.
DEFAULT_BACK_UP_DEST_PATH="/run/media/reedclanton/Common/Fedora/Home/$DEFAULT_BACK_UP_DEST_DIR/"
readonly DEFAULT_BACK_UP_DEST_PATH
