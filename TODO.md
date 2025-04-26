# TODO for lint_a_python_file

This file tracks planned improvements for the Python linting utility.

### Todo

- [ ] Write tests suite for the codebase
  - [ ] Unit tests for each function
  - [ ] Integration tests for the CLI
  - [ ] Test coverage report

- [ ] Add import ordering/sorting functionality
  - [ ] Group imports (standard library, third-party, local)
  - [ ] Sort alphabetically within groups
  - [ ] Handle import aliases

- [ ] Add removal of unused imports
  - [ ] Detect imports not referenced in code
  - [ ] Preserve imports used for side effects (marked with # noqa)

- [ ] Add indentation fixing
  - [ ] Convert tabs to spaces (or vice versa based on config)
  - [ ] Fix inconsistent indentation levels
  - [ ] Handle multi-line statements

- [ ] Add quote standardization
  - [ ] Convert between single/double quotes based on config
  - [ ] Handle cases where the alternative is needed (e.g., string contains quotes, multi-line quotes, etc.)

- [ ] Add line length enforcement
  - [ ] Split long lines according to PEP 8 guidelines
  - [ ] Respect line continuation markers
  - [ ] Preserve docstrings, comments, and templates

- [ ] Add configuration file support
  - [ ] Read settings from pyproject.toml, setup.cfg or .pylintrc
  - [ ] Support project-specific configurations

### In Progress

- [ ] Whitespace and blank line fixes

### Done ✓

- [x] Basic CLI with file pattern matching
- [x] Trailing whitespace removal
- [x] Fix blank lines with whitespace
- [x] Ensure files end with newline