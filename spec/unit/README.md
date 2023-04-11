# Unit Testing

This directory and its child directories contain all unit tests of this repo's code. For generic info regarding testing, see the top level [test readme](../README.md).

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
- **Implementation** changes should **not break** tests... ideally.

## Directory Structure

Each directory in this `README.md`'s directory has the name of a command that may be used when this repo is used to configure a POSIX environment. Tests of that functionality are stored in each directory. If the functionality has supporting code, constants, etc, then tests of that code will be in a `util` directory.


## Test Naming

Bellow is the unit test file naming convention:

```
<cotFileName>_[optional/required][Option/Argument]_<optionOrArgumentName>_spec.sh
```

For example, `output_optionalOption_help_spec.sh` would contain unit tests of the `--help`/`-h` option for the `output()` function.

## Tag Naming Requirement(s)

- The part of the tag name after the `:` **must** be the same as the title in cammle case with the first character in lower case.
- The part of the tag before the `:` should be the same as the tag of its parent with the `:` removed and the first character of the right hand potion of the tag capitalized.
- The top level tag **must** follow: `<userFacingFunctionName>:<nextLevelDown>`:
    - Example:
        - Top three level tags of a util function called `createHeaderFooter()` used by a user facing function called `output()` would be: `output:output`, `outputOutput:util`, & `outputOutputUtil:createHeaderFooter` respectivly.

[**See an example here**.](#test-structure-example)

## Unit Test Structure Requirement(s)

- All levels (`It`, `Describe`, etc) **must** be named.
- All levels, other than the bottom one, **must** have `:` as the last character in the name:
    - This is done so the test output is eaiser to read.
- Each level of the test should reflect how the CUT is organized, thus:
    - The top level `Describe` (see: [shellspec basic structure for more info](https://github.com/shellspec/shellspec#basic-structure)) must be named the same as the user facing function the test is most closly related to:
    - For example:
        - If the test if of a util fnction called `utilFunc()`, and `utilFunc()` is used by the `output()` function, then the top level `Describe` should have the title `output():`.
        - The next level would be named `Util:`.
        - The next would be named `utilFunc():`.
- The bottom level (`It`) must **always** have a unique tag.
- Each piece of functionality that can be tested separately from any other funcinality, even if only partialy, **must** be placed in its own file:
    - Splitting tests up into different files allows `shellspec` to run them in parallel.
    - Additional tests needed to get full coverage should be placed in a diffrent file.

**Note:** If an existing test file doesn't follow any of these rules, then the one who is modifying the file must update the entire file to follow all rules.

## Test Structure Example

A test of `output()`'s `--help` option would look like this:

```
Describe "output():" output:output
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Help:" outputOutputOptionalOption:help
			It "-h" outputOutputOptionalOptionsHelp:h
				Test here.
			End
			It "--help" outputOutputOptionalOptionsHelp:help
				Test here.
			End
		End
	End
End
```
