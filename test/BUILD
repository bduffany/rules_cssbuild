load("@npm//@bazel/typescript:index.bzl", "ts_library")

# load("@npm//jest-cli:index.bzl", "jest_test")
load("//:def.bzl", "css_module")

css_module(
    name = "css",
    srcs = ["styles.module.css"],
    out = "styles.css",
    flags = ["-camel_case_js_keys"],
)

genrule(
    name = "css_bundle",
    srcs = ["styles.css"],
    outs = ["styles.bundle.css"],
    cmd_bash = "cat $(SRCS) > $@",
)

sh_test(
    name = "test_css_contents",
    srcs = ["test.sh"],
    data = [":styles.bundle.css"],
)

ts_library(
    name = "example_output",
    srcs = ["example_output.ts"],
)

ts_library(
    name = "test_lib",
    srcs = ["component.test.ts"],
    deps = [
        ":css",
        "@npm//@types/jest",
        "@npm//tslib",
    ],
)

# jest_test(
#     name = "test",
#     args = [
#         "--no-cache",
#         "--no-watchman",
#         "--ci",
#         "--colors",
#         "--config",
#         "jest.ts.config.js",
#     ],
#     data = [
#         ":test_lib",
#         "//:jest.ts.config.js",
#     ],
# )
