#!/bin/bash
set -e

while read -r line <"$RUNFILES_DIR/rules_cssbuild/test/styles.bundle.css"; do
  # Look for suffixed classname
  if [[ "$line" =~ \.foo-local_.+ ]]; then
    exit 0
  fi
done

echo "Could not find suffixed classname" >&2
exit 1
