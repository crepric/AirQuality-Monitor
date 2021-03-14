def ipython(name, deps, **kwargs):
    native.py_binary(
            name = name,
            srcs = ["//bazel_helpers:shell.py"],
            deps = deps,
            python_version = "PY3",
    )
