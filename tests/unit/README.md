# Unit Testing

## Unit Testing Goals

Unit tests should:

- Test the smallest possible unit of code in a single way.
- Ensure no code outside of the function under test, or file if not encapelated in a function, should be executed.
- Be broken up into files with tests that exersies the same functionality.

## Organization

Unit tests are stored in directories with the same name as the Code Under Test (COT) in the `tests` directory (`<currentDir>/tests/<cotName>/test_<cotName>*.sh`).


