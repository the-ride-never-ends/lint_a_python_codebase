# Python Linting Utility
## Version 0.1.0
A command-line tool for automatically fixing common linting issues in Python files.

## Features
- Fix blank lines containing whitespace
- Remove trailing whitespace
- Ensure files end with a newline
- Configurable file matching with glob patterns
- Remove .Identifier files
- Selective directory exclusion
- Dry run mode to preview changes
- Verbose output option

## Requirements
- Python 3.12+

## Installation

1. Clone this repository:

```bash
git clone <repository-url>
cd lint_a_python_file
```

## Usage

Basic usage:

```bash
python main.py path/to/codebase
```

Example:

```bash
python main.py path/to/codebase --patterns "**/*.py" --exclude .venv build --verbose
```

### Command Line Options

#### File Selection:

- `--patterns`: File patterns to match (default: ["**/*.py"])
- `--exclude`: Directories to exclude (default: [".venv", ".git", "__pycache__"])

#### Linting Options:

- `--no-blank`: Don't fix blank lines with whitespace
- `--no-trailing`: Don't fix trailing whitespace
- `--no-newlines`: Don't ensure files end with a newline

#### Output Control:

- `--verbose`, `-v`: Print detailed information for each file
- `--dry-run`: Don't make any changes, just show what would be done

## Examples

Fix all Python files in the current directory and subdirectories:

```bash
python main.py
```

Specify custom file patterns:

```bash
python main.py --patterns "*.py" "scripts/*.py"
```

Exclude specific directories:

```bash
python main.py --exclude .venv .git __pycache__ build
```

Disable specific fixes:

```bash
python main.py --no-blank --no-trailing --no-newlines
```

Run in verbose mode to see detailed information:

```bash
python main.py --verbose
```

Preview changes without making them:

```bash
python main.py --dry-run
```

## Exit Codes

- `0`: Success - linting completed without errors
- `1`: Error - an error occurred during linting

## Directory Structure

```
lint_a_python_file/
├── main.py              # CLI entry point
├── fix_whitespace.py    # Core functionality for fixing whitespace issues
├── remove_identifier_files.py    # Find and delete all files ending in '.Identifier' in current directory and subdirectories
├── README.md            # This file
├── TODO.md              # Planned features and improvements
└── CHANGELOG.md         # History of changes
```

## License

MIT License