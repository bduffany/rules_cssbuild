load("@npm//@bazel/typescript:index.bzl", "ts_library")

# load("@npm//jest-cli:index.bzl", "jest_test")
load("//:def.bzl", "css_module")

css_module(
    name = "app_css",
    srcs = ["app.module.css"],
    out = "app.css",
    flags = ["-camel_case_js_keys"],
)

css_module(
    name = "widget_css",
    srcs = ["widget.module.css"],
    out = "widget.css",
    flags = ["-camel_case_js_keys"],
)

genrule(
    name = "styles",
    srcs = [
        "app.css",
        "widget.css",
    ],
    outs = ["styles.css"],
    cmd_bash = "cat $(SRCS) > $@",
)

sh_test(
    name = "test_css_contents",
    srcs = ["test.sh"],
    data = [":styles.css"],
)

ts_library(
    name = "test_lib",
    srcs = ["app.test.ts"],
    deps = [
        ":app_css",
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
