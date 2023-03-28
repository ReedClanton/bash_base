# Return Codes

Meaning of each return code:
| Code | Returned When                                                                                | Note(s)                                                   |
| ----:|:-------------------------------------------------------------------------------------------- |:--------------------------------------------------------- |
| `0`  | <ul><li>Help message is requested and produced.</li><li>Processing is successfull.</li></ul> |                                                           |

| `20` | A provided option name is invalid.                                                           | Codes in the 20s relate to options.                       |
| `21` | A provided option value is invalid.                                                          |                                                           |
| `22` | A required option is not provided.                                                           |                                                           |

| `31` | A provided argument value is invalid.                                                        | Codes in the 30s relate to arguments.                     |
| `32` | A required argument is not provided.                                                         |                                                           |

| `40` | Required file doesn't exist.                                                                 | Codes in the 40s relate to file access.                   |
| `41` | Failed to create a file.                                                                     |                                                           |
| `42` | Failed to remove file.                                                                       |                                                           |
| `43` | File already exists.                                                                         |                                                           |
| `44` | Failed to move/rename file.                                                                  |                                                           |
| `45` | Failed to copy file.                                                                         |                                                           |
| `46` | Failed to open file.                                                                         |                                                           |
| `47` | Failed read from file.                                                                       |                                                           |
| `48` | Failed to write to file.                                                                     |                                                           |

| `50` | Required directory doesn't exist.                                                            | Codes in the 50s relate to directory access.              |
| `51` | Failed to create a directory.                                                                |                                                           |
| `52` | Failed to remove directory.                                                                  |                                                           |
| `53` | Directory already exists.                                                                    |                                                           |
| `54` | Failed to move/rename directory.                                                             |                                                           |
| `55` | Failed to copy directory.                                                                    |                                                           |
| `56` | Failed to enter directory.                                                                   |                                                           |

| `60` | Code not run from same directory it's located in.                                            | Codes in the 60s relate to the location code is run from. |
| `61` | Code not run from user's home directory.                                                     |                                                           |
| `62` | Code not run from the correct directory (generic version of other codes).                    |                                                           |

| `70` | Code sourced when it shouldn't be.                                                           | Codes in the 70s relate to how the code is envoked.       |
| `71` | Code isn't sourced when it should be.                                                        |                                                           |
| `72` | Code not run by/as root when it should be.                                                   |                                                           |
| `73` | Code run as/by root when it shouldn't be.                                                    |                                                           |
| `74` | Code run by incorrect user.                                                                  |                                                           |

| `80` | Environment variable(s) set to unsupported value.                                            | Codes in the 80s rleate to environment setup.             |
| `81` | Environment variable(s) not set.                                                             |                                                           |
| `82` | Requried script/function not accesible (doesn't exist at expected path, isn't sourced, etc). |                                                           |


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
