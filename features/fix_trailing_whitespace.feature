Feature: Fix Trailing Whitespace
  As a developer
  I want to remove trailing whitespace from lines in my Python files
  So that my code is clean and follows best practices

  Scenario: Remove trailing spaces from lines
    Given a file with lines ending in spaces
    When fix_trailing_whitespace is called on the file
    Then trailing spaces are removed from all lines
    And newlines at the end of lines are preserved
    And the function returns the count of fixed lines

  Scenario: Remove trailing tabs from lines
    Given a file with lines ending in tabs
    When fix_trailing_whitespace is called on the file
    Then trailing tabs are removed from all lines
    And the function returns the count of fixed lines

  Scenario: File with no trailing whitespace
    Given a file where no lines have trailing whitespace
    When fix_trailing_whitespace is called on the file
    Then the file is not modified
    And the function returns zero

  Scenario: Mixed trailing whitespace
    Given a file with some lines having trailing spaces and tabs
    When fix_trailing_whitespace is called on the file
    Then all trailing whitespace is removed
    And the function returns the count of lines with trailing whitespace

  Scenario: Blank lines are handled correctly
    Given a file with blank lines
    When fix_trailing_whitespace is called on the file
    Then blank lines remain as newline characters
    And they are not counted as fixed lines

  Scenario: Preserve line content and newlines
    Given a file with various line endings
    When fix_trailing_whitespace is called on the file
    Then line content remains unchanged
    And newline characters are preserved at line ends
    And only trailing whitespace before newlines is removed
