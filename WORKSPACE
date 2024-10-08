workspace(name = "envoy")

# `load("//bazel:api_binding.bzl", "envoy_api_binding")` 这个指令的作用是从 `//bazel:api_binding.bzl` 文件中加载名为 `envoy_api_binding` 的符号。
# `load` 语句用于在 Bazel 构建文件中导入其他 `.bzl` 文件中的函数或变量，以便在当前文件中使用。
load("//bazel:api_binding.bzl", "envoy_api_binding")

envoy_api_binding()

load("//bazel:api_repositories.bzl", "envoy_api_dependencies")

envoy_api_dependencies()

load("//bazel:repositories.bzl", "envoy_dependencies")

envoy_dependencies()

load("//bazel:repositories_extra.bzl", "envoy_dependencies_extra")

envoy_dependencies_extra()

load("//bazel:python_dependencies.bzl", "envoy_python_dependencies")

envoy_python_dependencies()

load("//bazel:dependency_imports.bzl", "envoy_dependency_imports")

envoy_dependency_imports()

#Starlark and Python have similar syntax, but they are not completely identical. Here are some key differences:
 #
 #1. **No Variable Mutation**: In Starlark, variables are immutable once assigned. You cannot reassign a variable to a new value.
 #
 #2. **No Classes or Inheritance**: Starlark does not support defining classes or inheritance, which are available in Python.
 #
 #3. **Limited Standard Library**: Starlark has a much smaller standard library compared to Python. It is designed to be a minimal and deterministic language for configuration.
 #
 #4. **No List Comprehensions**: Starlark does not support list comprehensions, which are available in Python.
 #
 #5. **No Exception Handling**: Starlark does not have try-except blocks for exception handling.
 #
 #6. **No Generators or Iterators**: Starlark does not support generators or iterators.
 #
 #7. **No Function Annotations**: Starlark does not support function annotations.
 #
 #8. **No Keyword Arguments**: Starlark functions do not support keyword arguments.
 #
 #Here is an example to illustrate some of these differences:
 #
 #```python
 ## Python code
 #x = 10
 #x = 20  # Reassignment is allowed
 #
 #def add(a, b):
 #    return a + b
 #
 #result = add(a=5, b=10)  # Keyword arguments are allowed
 #
 ## List comprehension
 #squares = [x * x for x in range(10)]
 #```
 #
 #```python
 ## Starlark code
 #x = 10
 ## x = 20  # Reassignment is not allowed
 #
 #def add(a, b):
 #    return a + b
 #
 #result = add(5, 10)  # Keyword arguments are not allowed
 #
 ## List comprehension is not supported
 #squares = []
 #for x in range(10):
 #    squares.append(x * x)
 #```
 #
 #These differences make Starlark more predictable and suitable for configuration purposes, but less flexible than Python for general programming tasks.