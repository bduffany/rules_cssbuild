#!/bin/bash
rm go.sum
go get github.com/bduffany/cssbuild@latest
bazel run //:gazelle -- update-repos -from_file=go.mod -to_macro=deps.bzl%rules_cssbuild_dependencies
