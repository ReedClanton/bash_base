# Unit Testing

This directory and its child directories contain all unit tests of this repo's code. For generic info regarding testing, see the top level [test README.md](../README.md).

## Unit Testing Goals

Unit tests should:

- Test the **smallest** possible unit of code in a **single** way.
- Test the **smallest** possible unit of code in **every** way.
- **All** code **must** have **100%** coverage:
    - This includes things like files that define constants.
- Ensure **no code outside** of the Code Under Test (COT) **is executed**.
- **Environment changes** should **never break** tests:
    - For example, changing the value of a value in a constants file should only cause tests to fail when the new value is invalid.
- **Functionality** changes **should** always **break** tests.
- **Implementation** changes should **never break** tests.

## Organization

### Directory Organization

Each directory in this `README.md`'s directory has the name of a command that may be used when this repo is used to configure a POSIX environment. Tests of that functionality are stored in each directory. If the functionality has supporting code, constants, etc, then tests of that code will be in a `util` directory.


### Test Naming

Bellow is the unit test file naming convention:

```
<cotFileName>_[optional/required][Option/Argument]_<optionOrArgumentName>_spec.sh
```

For example, `output_optionalOption_help_spec.sh` would contain unit tests of the `--help`/`-h` option for the `output()` function.
