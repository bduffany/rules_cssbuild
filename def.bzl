# load("@build_bazel_rules_nodejs//:providers.bzl", "declaration_info", "js_ecma_script_module_info", "js_module_info")

load("@build_bazel_rules_nodejs//:providers.bzl", "declaration_info")

def _css_module_impl(ctx):
    if len(ctx.files.srcs) > 1:
        fail("Compiling multiple CSS module files is not yet supported.")

    js_out = ctx.actions.declare_file(ctx.files.srcs[0].basename + ".js", sibling = ctx.outputs.out)
    ts_out = ctx.actions.declare_file(ctx.files.srcs[0].basename + ".d.ts", sibling = ctx.outputs.out)

    args = [
        "-in",
        ctx.files.srcs[0].path,
        "-out",
        ctx.outputs.out.path,
        "-js_out",
        js_out.path,
        "-ts_out",
        ts_out.path,
        "-js_module_name",
        ctx.workspace_name + "/" + ctx.files.srcs[0].short_path,
    ]
    args.extend(ctx.attr.flags)

    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [ctx.outputs.out, js_out, ts_out],
        executable = ctx.executable.cssbuild,
        arguments = args,
        progress_message = "Creating %s and %s" % (ctx.outputs.out.path, js_out.path),
    )

    return [
        DefaultInfo(files = depset(direct = [ctx.outputs.out, js_out, ts_out])),
        declaration_info(declarations = depset(direct = [ts_out])),
        # TODO(bduffany): Figure out whether these are needed
        # js_module_info(sources = depset(direct = [js_out])),
        # js_ecma_script_module_info(sources = depset(direct = [js_out])),
    ]

css_module = rule(
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
        "out": attr.output(
            mandatory = True,
            doc = "Output file target.",
        ),
        "flags": attr.string_list(
            doc = "Extra flags to pass to cssbuild.",
        ),
    },
)
