Feature: Ensure Newline at End of File
  As a developer
  I want all my Python files to end with a newline character
  So that my code follows POSIX standards and editor compatibility

  Scenario: Add newline to file without one
    Given a file that does not end with a newline
    When ensure_newline_at_end_of_file is called on the file
    Then a newline is appended to the end of the file
    And the function returns 1

  Scenario: File already ends with newline
    Given a file that already ends with a newline
    When ensure_newline_at_end_of_file is called on the file
    Then the file is not modified
    And the function returns 0

  Scenario: Empty file handling
    Given an empty file
    When ensure_newline_at_end_of_file is called on the file
    Then the file remains empty
    And the function returns 0

  Scenario: File with multiple lines and no ending newline
    Given a file with multiple lines but no final newline
    When ensure_newline_at_end_of_file is called on the file
    Then a single newline is added at the end
    And the function returns 1

  Scenario: File content is preserved
    Given a file without a final newline
    When ensure_newline_at_end_of_file is called on the file
    Then all existing file content remains unchanged
    And only a newline is appended at the end
