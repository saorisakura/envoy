load("@com_google_protobuf//bazel:system_python.bzl", "system_python")
load("@envoy_toolshed//:packages.bzl", "load_packages")
load("@python3_11//:defs.bzl", "interpreter")
load("@rules_python//python:pip.bzl", "pip_parse")

def envoy_python_dependencies():
    # TODO(phlax): rename base_pip3 -> pip3 and remove this
    load_packages()
    #`pip_parse` 指令用于解析和安装 Python 包。它从指定的 `requirements_lock` 文件中读取依赖项，并使用指定的 Python 解释器安装这些依赖项。
    pip_parse(
        name = "base_pip3",
        python_interpreter_target = interpreter,
        requirements_lock = "@envoy//tools/base:requirements.txt",
        extra_pip_args = ["--require-hashes"],
    )

    pip_parse(
        name = "dev_pip3",
        python_interpreter_target = interpreter,
        requirements_lock = "@envoy//tools/dev:requirements.txt",
        extra_pip_args = ["--require-hashes"],
    )

    pip_parse(
        name = "fuzzing_pip3",
        python_interpreter_target = interpreter,
        requirements_lock = "@rules_fuzzing//fuzzing:requirements.txt",
        extra_pip_args = ["--require-hashes"],
    )

    # `system_python` 指令用于配置系统 Python 解释器的相关设置。它指定了一个名为 `system_python` 的目标，并设置了最低 Python 版本要求。
          #
          #```python
          #system_python(
          #    name = "system_python",
          #    minimum_python_version = "3.7",
          #)
          #```
    system_python(
        name = "system_python",
        minimum_python_version = "3.7",
    )
