Feature: Find Files
  As a developer
  I want to find files matching specific patterns in a directory
  So that I can process only the files I need

  Background:
    Given a target directory structure with various files

  Scenario: Find files with default pattern
    Given the target directory contains Python files
    When find_files is called with pattern "**/*.py"
    Then all Python files in the directory and subdirectories are returned
    And the files are returned in sorted order

  Scenario: Find files with multiple patterns
    Given the target directory contains various file types
    When find_files is called with multiple patterns
    Then all files matching any of the patterns are returned
    And duplicate files are removed
    And the files are returned in sorted order

  Scenario: Exclude specific directories
    Given the target directory has .venv, .git, and __pycache__ subdirectories
    When find_files is called with these directories in the exclude list
    Then files in excluded directories are not returned
    And files in other directories are returned

  Scenario: Find files in target directory only
    Given files exist both inside and outside the target directory
    When find_files is called with a specific target directory
    Then only files within the target directory are returned
    And files outside the target directory are excluded

  Scenario: No matching files
    Given the target directory contains no files matching the patterns
    When find_files is called
    Then an empty list is returned

  Scenario: Target directory with nested subdirectories
    Given the target directory has deeply nested subdirectories
    When find_files is called with recursive pattern "**/*.py"
    Then files from all nested levels are returned
    And the files are returned in sorted order

  Scenario: Absolute path handling
    Given the target directory path can be relative or absolute
    When find_files is called
    Then the function converts paths to absolute paths for comparison
    And excluded directories are matched correctly

  Scenario: Pattern with no recursion
    Given the target directory has files in subdirectories
    When find_files is called with pattern "*.py" (no recursion)
    Then only Python files in the root target directory are returned
    And files in subdirectories are excluded
