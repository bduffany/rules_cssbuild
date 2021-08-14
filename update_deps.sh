#!/bin/bash
bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%rules_cssbuild_dependencies
