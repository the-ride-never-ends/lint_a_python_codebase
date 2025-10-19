Feature: Main Entry Point
  As a developer
  I want to run the linting tool on my Python codebase
  So that common formatting issues are automatically fixed

  Background:
    Given a target directory exists

  Scenario: Successfully lint a Python codebase with default settings
    Given the target directory contains Python files
    When I run the main function with the target directory
    Then the tool finds all Python files in the directory
    And the tool removes any .Identifier files
    And the tool fixes blank lines with whitespace
    And the tool fixes trailing whitespace
    And the tool ensures files end with a newline
    And a summary of changes is printed

  Scenario: Lint with custom file patterns
    Given the target directory contains various file types
    When I run the main function with custom patterns
    Then only files matching the patterns are processed

  Scenario: Lint with excluded directories
    Given the target directory has subdirectories
    When I run the main function with excluded directories
    Then files in excluded directories are not processed

  Scenario: Dry run mode
    Given the target directory contains Python files with issues
    When I run the main function with dry-run flag
    Then no files are modified
    And a list of files that would be processed is shown

  Scenario: Verbose output mode
    Given the target directory contains Python files
    When I run the main function with verbose flag
    Then detailed information for each file is printed

  Scenario: Selective fix disabling
    Given the target directory contains Python files with multiple issues
    When I run the main function with --no-blank, --no-trailing, or --no-newlines flags
    Then only the enabled fixes are applied

  Scenario: Target directory does not exist
    Given the target directory path does not exist
    When I run the main function
    Then a FileNotFoundError is raised with an appropriate message

  Scenario: Empty target directory
    Given the target directory is empty
    When I run the main function
    Then zero files are processed
    And a summary showing no changes is printed
