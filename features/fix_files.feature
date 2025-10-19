Feature: Fix Files
  As a developer
  I want to apply multiple fixes to a collection of files
  So that I can clean up my codebase efficiently

  Background:
    Given a list of file paths to process

  Scenario: Fix all issues in files
    Given files with blank line whitespace, trailing whitespace, and missing newlines
    When fix_files is called with all fixes enabled
    Then blank lines are cleaned in all files
    And trailing whitespace is removed from all files
    And newlines are added to files missing them
    And the function returns counts of (files fixed, blank fixes, trailing fixes, newline fixes)

  Scenario: Fix only blank line issues
    Given files with various whitespace issues
    When fix_files is called with fix_blank=True and other fixes disabled
    Then only blank line whitespace is cleaned
    And trailing whitespace and newlines are not modified
    And the function returns appropriate counts

  Scenario: Fix only trailing whitespace
    Given files with various whitespace issues
    When fix_files is called with fix_trailing=True and other fixes disabled
    Then only trailing whitespace is removed
    And blank lines and newlines are not modified
    And the function returns appropriate counts

  Scenario: Fix only missing newlines
    Given files with various whitespace issues
    When fix_files is called with fix_newlines=True and other fixes disabled
    Then only missing newlines are added
    And blank lines and trailing whitespace are not modified
    And the function returns appropriate counts

  Scenario: Process files with verbose output
    Given a list of files to process
    When fix_files is called with verbose=True
    Then progress information is printed for each file
    And specific details about fixes are shown
    And the function returns the same results as non-verbose mode

  Scenario: Process files without verbose output
    Given a list of files to process
    When fix_files is called with verbose=False
    Then no progress information is printed
    And the function returns fix counts

  Scenario: No files need fixing
    Given files that already conform to all standards
    When fix_files is called
    Then no files are modified
    And all count values returned are zero

  Scenario: Mixed file states
    Given some files need fixes and some don't
    When fix_files is called
    Then only files with issues are modified
    And the function returns accurate counts of all fixes

  Scenario: Sequential file processing
    Given multiple files to process
    When fix_files is called
    Then files are processed in the order provided
    And each file is processed independently
