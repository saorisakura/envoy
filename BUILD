load("//bazel:envoy_build_system.bzl", "envoy_package")
load("//tools/python:namespace.bzl", "envoy_py_namespace")

licenses(["notice"])  # Apache 2

envoy_package()

envoy_py_namespace()

exports_files([
    "VERSION.txt",
    "API_VERSION.txt",
    ".clang-format",
    "pytest.ini",
    ".coveragerc",
    "CODEOWNERS",
    "OWNERS.md",
    ".github/config.yml",
    "reviewers.yaml",
])

# 要使用 Bazel 构建 `alias` 目标，可以使用 `bazel build` 命令。假设你要构建 `envoy` 这个 `alias` 目标，命令如下：
#
#```sh
#bazel build :envoy
#```
#
#如果你要构建 `envoy.stripped` 这个 `alias` 目标，命令如下：
#
#```sh
#bazel build :envoy.stripped
#```
#
#这些命令会构建 `BUILD` 文件中定义的相应 `alias` 目标。
alias(
    name = "envoy",
    actual = "//source/exe:envoy",
)

alias(
    name = "envoy.stripped",
    actual = "//source/exe:envoy-static.stripped",
)

filegroup(
    name = "clang_tidy_config",
    srcs = [".clang-tidy"],
    # 在 Bazel 中，`visibility` 用于控制目标的可见性，即哪些其他包可以依赖或使用该目标。`public` 是一个特殊的可见性设置，表示该目标对所有包都是可见的。
    #
    #在你的代码中，`visibility = ["//visibility:public"]` 表示 `filegroup` 目标 `clang_tidy_config` 对所有包都是可见的���
    #
    #以下是你的代码中相关部分的解释：
    #
    #```python
    #filegroup(
    #    name = "clang_tidy_config",
    #    srcs = [".clang-tidy"],
    #    visibility = ["//visibility:public"],
    #)
    #```
    #
    #- `name`: 定义目标的名称。
    #- `srcs`: 包含目标的源文件。
    #- `visibility`: 控制目标的可见性。`["//visibility:public"]` 表示该目标对所有包都是可见的。
    visibility = ["//visibility:public"],
)

# These two definitions exist to help reduce Envoy upstream core code depending on extensions.
# To avoid visibility problems, see notes in source/extensions/extensions_build_config.bzl
#
# TODO(#9953) //test/config_test:__pkg__ should probably be split up and removed.
# TODO(#9953) the config fuzz tests should be moved somewhere local and //test/config_test and //test/server removed.
# `package_group` 指令用于定义一组包，这些包可以在其他地方引用，以控制可见性或访问权限。在你的代码中，`package_group` 定义了一组包，这些包可以在其他地方使用，例如在 `visibility` 属性中，以控制哪些包可以访问某个目标。
#
#例如，以下代码定义了一个名为 `extension_config` 的包组，其中包��了一些特定的包路径：
#
#```python
#package_group(
#    name = "extension_config",
#    packages = [
#        "//source/exe",
#        "//source/extensions/...",
#        "//test/config_test",
#        "//test/extensions/...",
#        "//test/server",
#        "//test/server/config_validation",
#        "//test/tools/...",
#        "//tools/extensions/...",
#    ],
#)
#```
#
#这个包组可以在其他目标的 `visibility` 属性中使用，以控制这些目标对哪些包可见。
package_group(
    name = "extension_config",
    packages = [
        "//source/exe",
        "//source/extensions/...",
        "//test/config_test",
        "//test/extensions/...",
        "//test/server",
        "//test/server/config_validation",
        "//test/tools/...",
        "//tools/extensions/...",
    ],
)

package_group(
    name = "extension_library",
    packages = [
        "//source/extensions/...",
        "//test/extensions/...",
    ],
)

package_group(
    name = "contrib_library",
    packages = [
        "//contrib/...",
    ],
)

package_group(
    name = "examples_library",
    packages = [
        "//examples/...",
    ],
)

package_group(
    name = "mobile_library",
    packages = [
        "//mobile/...",
    ],
)
