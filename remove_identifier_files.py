from pathlib import Path


def remove_identifier_files(target_directory: str) -> int:
    """Find and delete all files ending in '.Identifier' in current directory and subdirectories.

    Args:
        root_dir (str, optional): The root directory to start searching from. 
            Defaults to the current directory (".").

    Returns:
        int: The number of '.Identifier' files that were successfully deleted.

    Example:
        >>> removed = remove_identifier_files("/path/to/directory")
        >>> print(f"Removed {removed} .Identifier files")
    """
    """Find and delete all files ending in '.Identifier' in current directory and subdirectories"""

    # Find and remove all .Identifier files
    count = 0
    for path in Path(target_directory).glob('**/*.Identifier'):
        if path.is_file():
            print(f"Removing: {path}")
            try:
                path.unlink()
            except OSError as e: # Skip if file errors on removal.
                print(f"Error removing {path}: {e}")
                continue
            count += 1
    return count

