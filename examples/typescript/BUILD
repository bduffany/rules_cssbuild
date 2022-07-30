load("@com_github_bduffany_rules_cssbuild//:def.bzl", "css_module")
load("@npm//@bazel/typescript:index.bzl", "ts_project")
load("@npm//@bazel/esbuild:index.bzl", "esbuild")

css_module(
    name = "css",
    srcs = ["app.module.css"],
)

ts_project(
    name = "css_ts",
    srcs = [":app.module.css.ts"],
    composite = True,
    tsconfig = ":tsconfig.json",
)

ts_project(
    name = "app",
    srcs = ["app.ts"],
    composite = True,
    tsconfig = ":tsconfig.json",
    deps = [
        ":css_ts",
        "@npm//tslib",
    ],
)

esbuild(
    name = "bundle",
    entry_point = "app.ts",
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
