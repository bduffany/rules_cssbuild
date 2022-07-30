load("@npm//@bazel/typescript:index.bzl", "ts_project")
load("@npm//jest-cli:index.bzl", "jest_test")
load("//:def.bzl", "css_module")

css_module(
    name = "app_css",
    srcs = ["app.module.css"],
)

ts_project(
    name = "app_css_ts",
    srcs = ["app.module.css.ts"],
    composite = True,
    tsconfig = "//:tsconfig.json",
)

css_module(
    name = "widget_css",
    srcs = ["widget.module.css"],
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
    srcs = ["test_css_contents.sh"],
    data = [":styles.css"],
)

ts_project(
    name = "app_test_lib",
    srcs = ["app.test.ts"],
    composite = True,
    tsconfig = "//:tsconfig.json",
    deps = [
        ":app_css_ts",
        "@npm//@types/jest",
        "@npm//tslib",
    ],
)

jest_test(
    name = "app_test",
    args = [
        "--no-cache",
        "--no-watchman",
        "--ci",
        "--colors",
        "--config",
        "jest.ts.config.js",
    ],
    data = [
        ":app_test_lib",
        "//:jest.ts.config.js",
    ],
)
