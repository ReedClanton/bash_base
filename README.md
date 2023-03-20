# Bash Base

I create symbolic links to a local clone of this repo in my local environment. This repo provides almost all environment files I use on my machines. I provide no warranties.

## Setup

Run `environment_setup.sh` file to remove your current bash file(s) and directory(ies), any file in your home directory that starts with `.bash*` or directory named `bash`, and replace them with the bash files from this repo.

## Functionality

This section covers what functionality is provided by this repo. For more info, see the  `README.md` files in the directory that's closest to the code you want to know more about or use the links from this section. In other words, this section is just for letting you know what functionality exists.

### Source Code

Section covers where to go to find out more about the functionality provided by the code in this repo. There is another section that covers tests.

#### [Basic Environment Setup and Configuration](src/README.md)

There is an environment setup script here as well as the base file(s) used when configuring a POSIX complient environment. The `README.md` linked to above contains more info.

Please note that an attempt is made to ensure everything is POSIX complient, but most of my systems run `bash`.

#### [Advanced Environment Configuration](src/bash/README.md)

These file(s) are used (sourced) by the files covered by [Basic Environment Setup and Configuration](#basic-environment-setup-and-configuration). The `README.md` linked to above contains more info.

#### [POSIX Functions](src/bash/functions/README.md)

These file(s) contain POSIX complient function(s). The `README.md` linked to above contains more info.

#### [POSIX Function Constants](src/bash/functions/constants/README.md)

These file(s) contain constants used by the POSIX functions in the parient directory. The `README.md` linked to above contains more info.

### Tests

TODO

#### [Unit Tests](tests/unit/README.md)

The `README.md` linked to above contains more info.
