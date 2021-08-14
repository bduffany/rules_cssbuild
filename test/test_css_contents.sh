#!/bin/bash
set -e

if ! grep '\.app-child_' "$RUNFILES_DIR/rules_cssbuild/test/styles.css" &>/dev/null; then
  echo "Could not find suffixed '.app-child' rule" >&2
  exit 1
fi

if ! grep '\.widget_' "$RUNFILES_DIR/rules_cssbuild/test/styles.css" &>/dev/null; then
  echo "Could not find suffixed '.widget' rule" >&2
  exit 1
fi
