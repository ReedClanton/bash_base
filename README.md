# Bash Base

I create symbolic soft links to a local clone of this repo in my local environment. I provide no warranties.

## Setup

Run `environment_setup.sh` file to remove your current bash file(s) and directory(ies), any file in your home directory that starts with `.bash*` or directory named `bash`, and replace them with the bash files from this repo.

## Functions

This secton contains basic info regarding the bash function(s) that are included in this repo. Most info is stored in the same file as the code and may be accessed by calling the function and passing in `-h` or `--help`.

### log

Bash function that produces formatted logs to stdout.

#### Location

bash/functions/log.sh

#### Example Usage

```sh
declare infoLvl="-i -c=example_script"

log $infoLvl -m="Requesting input from user..."
printf "Enter number you'd like to count to: "
read userVar
log $infoLvl -m="User entered: '$userVar'"

for (( i=1; i<=$userVar; i++)); do
	echo "$i"
done
```

### output

TODO

#### Location

bash/functions/output.sh

#### Example Usage

TODO

### backUp

Bash script that copies files and directories from user's home directory to another location.

#### Location

bash/functions/backUp.sh

#### Example Usage

```sh
backUp
```

