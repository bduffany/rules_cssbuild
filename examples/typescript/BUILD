load("@com_github_bduffany_rules_cssbuild//:def.bzl", "css_module")
load("@npm//@bazel/typescript:index.bzl", "ts_library")
load("@npm//@bazel/esbuild:index.bzl", "esbuild")

css_module(
    name = "css",
    srcs = ["app.module.css"],
    out = "app.css",
)

ts_library(
    name = "app",
    srcs = ["app.ts"],
    deps = [
        ":css",
    ],
)

esbuild(
    name = "bundle",
    entry_point = "app.ts",
    minify = True,
    deps = [
        ":app",
    ],
)

genrule(
    name = "generate_index_html",
    srcs = [
        ":bundle.js",
        ":app.css",
        ":index.template.html",
    ],
    outs = ["index.html"],
    cmd_bash = """
  cat $(location :index.template.html) | 
      STYLE=$$(cat $(location :app.css)) SCRIPT=$$(cat $(location :bundle.js)) envsubst > $@
  """,
)
