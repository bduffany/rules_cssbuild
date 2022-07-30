load("@npm//@bazel/typescript:index.bzl", "ts_project")

def _css_module_impl(ctx):
    if len(ctx.files.srcs) > 1:
        fail("Compiling multiple CSS module files is not yet supported.")

    args = [
        "-in",
        ctx.files.srcs[0].path,
        "-out",
        ctx.outputs.css_out.path,
        "-ts_out",
        ctx.outputs.ts_out.path,
    ]
    args.extend(ctx.attr.flags)

    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [ctx.outputs.css_out, ctx.outputs.ts_out],
        executable = ctx.executable.cssbuild,
        arguments = args,
        progress_message = "Compiling CSS module",
    )

    return [
        DefaultInfo(files = depset([ctx.outputs.css_out, ctx.outputs.ts_out])),
    ]

_css_module = rule(
    implementation = _css_module_impl,
    attrs = {
        "cssbuild": attr.label(
            default = "@com_github_bduffany_cssbuild//:cssbuild",
            executable = True,
            cfg = "host",
        ),
        "srcs": attr.label_list(
            allow_empty = False,
            allow_files = [".module.css"],
            doc = "CSS module input file target. Currently only supports one file at a time.",
        ),
        "css_out": attr.output(
            mandatory = True,
            doc = "Output CSS file.",
        ),
        "ts_out": attr.output(
            mandatory = True,
            doc = "Output TS file (containing CSS classname mapping).",
        ),
        "flags": attr.string_list(
            doc = "Extra flags to pass to cssbuild.",
        ),
    },
)

def css_module(name, srcs):
    if len(srcs) != 1:
        fail("exactly one CSS file must be specified in srcs")

    css_out = srcs[0].replace(".module.css", ".css")
    ts_out = srcs[0] + ".ts"

    _css_module(
        name = name,
        srcs = srcs,
        ts_out = ts_out,
        css_out = css_out,
        flags = ["-camel_case_js_keys"],
    )
