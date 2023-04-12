# Shell Base

This project contains all shell configuration files needed to setup a POSIX compilent shell environment. It also includes shell functions that may be utalized by user created scripts (e.g. log).

There's a script that uses this project's contents to setup a user's shell environment.

## Terminology

| Term                           | Meaning                                                         | Refrence                                |
|:------------------------------ |:--------------------------------------------------------------  |:--------------------------------------- |
| CUT                            | **C**ode **U**nder **T**est                                     |                                         |
| `Describe`/`ExampleGroup`/`Context` |                                                            | [shellspec-Basic structure](https://github.com/shellspec/shellspec#basic-structure) |
| DOD                            | Defenition Of Done                                              |                                         |
| environment setup script       | Environment configuration script.                               | [environment setup script](src/environmentSetup/environmentSetup.sh) |
| functions readme               | `README.md` covering **all** function(s).                       | [functions readme](src/shell/functions/README.md) |
| {local} user shell environment | Files used by Unix based/derived systems to configure a user's environment (aliases, PATH, etc). |        |
| project readme                 | This `README.md`.                                               | [project readme](README.md)             |
| shell readme                   | `README.md` covering shell configureation file(s).              | [shell readme](src/shell/README.md)     |
| `stderr`                       | Output stream that error data is published to.                  | Google it.                              |
| `stdout`                       | Output stream that most return values are published to.         | Google it.                              |
| source readme                  | `README.md` covering **all** source code.                       | [source readme](src/README.md)          |
| test readme                    | `README.md` covering **all** testing.                           | [test readme](spec/README.md)           |
| unit test readme               | `README.md` covering **unit** testing.                          | [unit test readme](spec/unit/README.md) |

## Goal(s)

Make setting up a new POSIX complient shell environment as easy as possible and provided additional shell script functionality, like a logger.

## Setup

Run the [environment setup script](src/environmentSetup/environmentSetup.sh) to remove your current user shell configuration file(s) and directory(ies). For more information regarding shell environment configration, see the [shell readme](src/shell/README.md).

## Functionality

### Shell Environment Configuration

See the [shell readme](src/shell/README.md) for information regarding what user shell configuration is handled by this project and how you can deploy it to your local user shell environment. 

### Shell Scripting Utility(ies)

See the [functions readme](src/shell/functions/README.md) for information regarding the functionality this project provides that you can use in the shell scripts you create.

## Testing

See the [test readme](spec/README.md) for information regarding how tests of this project are organized, what the goals of the tests are, test requirements, etc.
