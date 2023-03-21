#! /bin/bash

 ##############
## Default(s) ##
 ##############
## Directory(ies) ##
# Name of directory back ups are stored in.
declare -r DEFAULT_BACK_UP_DEST_DIR=$(date +"%Y-%m-%d")

## Default Path(s) ##
# Tracks default path to directory being backed up.
declare -r DEFAULT_BACK_UP_SOURCE_PATH="$HOME/"
# Tracks path backup will be created at.
declare -r DEFAULT_BACK_UP_DEST_PATH="/run/media/reedclanton/Common/Fedora/Home/$DEFAULT_BACK_UP_DEST_DIR/"

