#!/usr/bin/env python3
# # -*- coding: utf-8 -*-
"""
Script to automatically fix common linting issues in Python files.
"""
from __future__ import annotations


import argparse
import os


from fix_whitespace import fix_files, find_files
from remove_identifier_files import remove_identifier_files


def main() -> None:
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(description="Fix common linting issues in Python codebases.")
    parser.add_argument("target_directory", required=True,
                        help="Target directory to process.")
    parser.add_argument("--patterns", nargs="+", default=["**/*.py"],
                        help="File patterns to match (default: '**/*.py')")
    parser.add_argument("--exclude", nargs="+", default=[".venv", ".git", "__pycache__"],
                        help="Directories to exclude (default: .venv, .git, __pycache__)")
    parser.add_argument("--no-blank", action="store_true",
                        help="Don't fix blank lines with linting")
    parser.add_argument("--no-trailing", action="store_true",
                        help="Don't fix trailing linting")
    parser.add_argument("--no-newlines", action="store_true",
                        help="Don't ensure files end with a newline")
    parser.add_argument("--verbose", "-v", action="store_true",
                        help="Print detailed information for each file")
    parser.add_argument("--dry-run", action="store_true",
                        help="Don't make any changes, just show what would be done")
    args = parser.parse_args()

    if args.target_directory:
        if not os.path.exists(args.target_directory):
            raise FileNotFoundError(f"Target directory '{args.target_directory}' does not exist")
        if args.verbose:
            print(f"Target directory: {args.target_directory}")

    # Remove .Identifier files
    identifier_files = remove_identifier_files(args.target_directory)

    # Find files
    file_paths = find_files(args.target_directory, args.patterns, args.exclude)
    print(f"Found {len(file_paths)} python files to process")

    if args.dry_run:
        print("Dry run mode - no changes will be made")
        for file_path in file_paths:
            print(f"Would process: {file_path}")
        return

    # Fix files
    files_fixed, blank_fixes, trailing_fixes, newline_fixes = fix_files(
        file_paths,
        fix_blank=not args.no_blank,
        fix_trailing=not args.no_trailing,
        fix_newlines=not args.no_newlines,
        verbose=args.verbose
    )

    # Print summary
    print(f"\nFixed {files_fixed} out of {len(file_paths)} files:")
    if identifier_files:
        print(f"- Removed {len(identifier_files)} .Identifier files")
    if not args.no_blank:
        print(f"- {blank_fixes} blank lines")
    if not args.no_trailing:
        print(f"- {trailing_fixes} lines with trailing whitespace")
    if not args.no_newlines:
        print(f"- {newline_fixes} files missing final newline")


if __name__ == "__main__":
    main()
