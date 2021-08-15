load("@bazel_gazelle//:deps.bzl", "go_repository")

def rules_cssbuild_dependencies():
    go_repository(
        name = "com_github_bduffany_cssbuild",
        importpath = "github.com/bduffany/cssbuild",
        sum = "h1:FesQL98l4c6uzbrfZq0PQR31Ga9G+f/qL8EZE9tDWLs=",
        version = "v0.1.4",
    )
    go_repository(
        name = "com_github_tdewolff_parse_v2",
        importpath = "github.com/tdewolff/parse/v2",
        sum = "h1:Kjaj3KQOx/4elIxlBSglus4E2oMfdROphvbq2b+OBZ0=",
        version = "v2.5.19",
    )
    go_repository(
        name = "com_github_tdewolff_test",
        importpath = "github.com/tdewolff/test",
        sum = "h1:76mzYJQ83Op284kMT+63iCNCI7NEERsIN8dLM+RiKr4=",
        version = "v1.0.6",
    )
