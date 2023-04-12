# POSIX Shell Functions

This document contains all information that's generic to all shell functions as well as basic descriptions of what each script does. For more detailed information regarding usage of a script, either open the file that contains the script or, if you've already setup your environment, then in your terminal enter: `<scriptName> -h` or `<scriptName> --help`.

## Return Codes

The table bellow defines what the meaning of each return value. For details regarding what exactly might have caused a given return code to be returned, check the log produced above the doc that's printed to `stderr` for a log that describes what caused the off nominal code.
Alternatively, enter `<funcationName> --help` for a document that describes how to use the function of intrest.

| Code  | Returned When                                                                 | Example                    | Note(s)                                        |
| -----:|:----------------------------------------------------------------------------- |:-------------------------- |:---------------------------------------------- |
| `0`   | <ul><li>Help message is requested and produced.</li><li>Processing is successfull.</li></ul> |             |                                                |
| `1`   | POSIX Standard: `Catchall for general errors`                                 | `let "var1 = 1/0"`         | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `2`   | POSIX Standard: `Misuse of shell builtins (according to Bash documentation)`  | `empty_function() {}`      | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `3`   | Failed to execute, but it's not that bad.                                     | Failed to change file, but reverted it. |                                   |
| `4`   | Failed to execute, and it is that bad.                                        | Failed to change file & to revert it. |                                     |
| `126` | POSIX Standard: `Command invoked cannot execute`                              | `/dev/null`                | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `127` | POSIX Standard: `command not found`                                           | `illegal_command`          | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `128` | POSIX Standard: `Invalid argument to exit`                                    | `exit 3.14159`             | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `128+n` | POSIX Standard: `Fatal error signal "n"`                                    | `kill -9 $PPID of script`  | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `130` | POSIX Standard: `Script terminated by Control-C`                              | `Ctl-C`                    | https://tldp.org/LDP/abs/html/exitcodes.html   |
| `131` | Control-C is handled prior to exiting or user chooses to exit through the UI. |                            |                                                |
| `140` | A provided option name is invalid.                                            |                            | Codes in the 14Xs relate to options.           |
| `141` | A provided option value is invalid.                                           |                            |                                                |
| `142` | A required option is not provided.                                            |                            |                                                |
| `151` | A provided argument value is invalid.                                         |                            | Codes in the 15Xs relate to arguments.         |
| `152` | A required argument is not provided.                                          |                            |                                                |
| `160` | Required file doesn't exist.                                                  |                            | Codes in the 16Xs relate to file access.       |
| `161` | Failed to create a file.                                                      |                            |                                                |
| `162` | Failed to remove file.                                                        |                            |                                                |
| `163` | File already exists.                                                          |                            |                                                |
| `164` | File doesn't already exist or can't be found/accessed.                        |                            |                                                |
| `165` | Failed to move/rename file.                                                   |                            |                                                |
| `166` | Failed to copy file.                                                          |                            |                                                |
| `167` | Failed to open file.                                                          |                            |                                                |
| `168` | Failed read from file.                                                        |                            |                                                |
| `169` | Failed to write to file.                                                      |                            |                                                |
| `170` | Required directory doesn't exist.                                             |                            | Codes in the 17Xs relate to directory access.  |
| `171` | Failed to create a directory.                                                 |                            |                                                |
| `172` | Failed to remove directory.                                                   |                            |                                                |
| `173` | Directory already exists.                                                     |                            |                                                |
| `174` | Directory doesn't already exist or can't be found/accessed.                   |                            |                                                |
| `175` | Failed to move/rename directory.                                              |                            |                                                |
| `176` | Failed to copy directory.                                                     |                            |                                                |
| `177` | Failed to enter directory.                                                    |                            |                                                |
| `180` | Code not run from same directory it's located in.                             |                            | Codes in the 18Xs relate to the location code is run from. |
| `181` | Code not run from user's home directory.                                      |                            |                                                |
| `182` | Code not run from the correct directory (generic version of other codes).     |                            |                                                |
| `190` | Code sourced when it shouldn't be.                                            |                            | Codes in the 19Xs relate to how the code is envoked. |
| `191` | Code isn't sourced when it should be.                                         |                            |                                                |
| `192` | Code not run by/as root when it should be.                                    |                            |                                                |
| `193` | Code run as/by root when it shouldn't be.                                     |                            |                                                |
| `194` | Code run by incorrect user.                                                   |                            |                                                |
| `200` | Environment variable(s) set to unsupported value.                             |                            | Codes in the 20Xs relate to environment setup. |
| `201` | Environment variable(s) not set.                                              |                            |                                                |
| `202` | Requried script/function not accessible (doesn't exist at expected path, isn't sourced, etc). |            |                                                |
| `203` | Required system commands not accessible.                                      |                            |                                                |
| `209` | Any other environment issue.                                                  |                            |                                                |
| `255` | POSIX Standard: `Exit status out of range`                                    | `exit -1`                  | https://tldp.org/LDP/abs/html/exitcodes.html   |

# POSIX Functions

## `backUp`

Script that copies files and directories from user's home directory to another location.

## `checkRequiredOpts`

Used by other scripts to ensure that all option(s) passed into it are valid (contain something).
If that's not the case, then the calling scripts doc is produced to std out.

## `log`

Produces formatted logs to stdout.

### `log` Example Usage

```sh
infoLvl="-i -c=example_script"
readonly infoLvl

log $infoLvl -m="Requesting input from user..."
printf "Enter number you'd like to count to: "
read userVar
log $infoLvl -m="User entered: '$userVar'"

for (( i=1; i<=$userVar; i++)); do
	log $infoLvl -m="$i"
done
```

## `output`

Used to add pre-fix, post-fix, headers, and/or footers to message text. Used by log()'s title
options.

## `shellName`

Returns the name of the shell that called the script to `stdout`.
