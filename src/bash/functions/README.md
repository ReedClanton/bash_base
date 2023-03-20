# POSIX Functions, Globals, and Constants

TODO

## POSIX Functions

TODO

### `backUp`

Bash script that copies files and directories from user's home directory to another location.

### `checkRequiredOpts`

TODO

### `output`

TODO

### `log`

Bash function that produces formatted logs to stdout.

#### `log` Example Usage

```sh
declare -r infoLvl="-i -c=example_script"

log $infoLvl -m="Requesting input from user..."
printf "Enter number you'd like to count to: "
read userVar
log $infoLvl -m="User entered: '$userVar'"

for (( i=1; i<=$userVar; i++)); do
	log $infoLvl -m="$i"
done
```

## POSIX Globals

TODO

## POSIX Constants

TODO
