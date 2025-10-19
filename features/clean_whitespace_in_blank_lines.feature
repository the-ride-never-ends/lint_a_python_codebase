Feature: Clean Whitespace in Blank Lines
  As a developer
  I want blank lines in my Python files to contain no whitespace
  So that my code adheres to PEP 8 style guidelines

  Scenario: Clean blank lines containing only whitespace
    Given a file with blank lines containing spaces or tabs
    When clean_whitespace_in_blank_lines is called on the file
    Then all blank lines are replaced with empty newlines
    And the function returns the count of fixed lines

  Scenario: File with no whitespace in blank lines
    Given a file where blank lines already contain no whitespace
    When clean_whitespace_in_blank_lines is called on the file
    Then the file is not modified
    And the function returns zero

  Scenario: File with multiple blank lines with whitespace
    Given a file with 5 blank lines containing various amounts of whitespace
    When clean_whitespace_in_blank_lines is called on the file
    Then all 5 blank lines are cleaned
    And the function returns 5

  Scenario: File with no blank lines
    Given a file with only non-empty lines
    When clean_whitespace_in_blank_lines is called on the file
    Then the file is not modified
    And the function returns zero

  Scenario: File with mixed blank lines
    Given a file with some blank lines with whitespace and some without
    When clean_whitespace_in_blank_lines is called on the file
    Then only blank lines with whitespace are fixed
    And the function returns the count of lines that had whitespace

  Scenario: Preserve non-blank line content
    Given a file with regular content and blank lines with whitespace
    When clean_whitespace_in_blank_lines is called on the file
    Then all regular line content remains unchanged
    And only blank lines are modified
