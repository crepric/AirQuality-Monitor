# This file is part of Air Quality Monitor.
#
# Air Quality Monitor is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Air Quality Monitor is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Net Failover Manager.  If not, see <https://www.gnu.org/licenses/>.

load("@rules_python//python:defs.bzl", "py_binary")
load("//bazel_helpers:ipython.bzl", "ipython")
load("@mypy_integration//:mypy.bzl", "mypy_test")
load("@my_deps//:requirements.bzl", "requirement")

py_binary(
    name = "aqm_main",
    srcs = ["aqm_main.py"],
    python_version = "PY3",
    data = [
        ":html_templates",
        ":static_resources",
    ],
    deps = [
        ":aqm_controller_lib",
        ":aqm_config_manager_lib",
        ":aqm_data_manager_lib",
        ":webservice_lib",
        "@com_github_abseil_abseil_py//absl:app",
        "@com_github_abseil_abseil_py//absl/flags",
        "@com_github_abseil_abseil_py//absl/logging",
        "@rules_python//python/runfiles",
    ],
)

filegroup(
    name = "html_templates",
    srcs = glob([
        "web/templates/*.html",
    ]),
)

filegroup(
    name = "static_resources",
    srcs = glob([
        "web/resources/js/*",
        "web/resources/css/*",
    ]),
)

py_library(
    name = "aqm_data_manager_lib",
    srcs = ["aqm_data_manager.py"],
    deps = [
        "@com_github_abseil_abseil_py//absl/logging",
        requirement("redistimeseries"),
    ]
)

py_library(
    name = "aqm_config_manager_lib",
    srcs = ["aqm_config_manager.py"],
    deps = [
        "@com_github_abseil_abseil_py//absl/logging",
    ]
)

py_library(
    name = "aqm_controller_lib",
    srcs = ["aqm_controller.py"],
    deps = [
        requirement("retry"),
        "@com_github_abseil_abseil_py//absl/logging",
        "@crepric_pygatt//pygatt:pygatt_lib",
    ]
)

py_library(
    name = "webservice_lib",
    srcs = ["webservice.py"],
    deps = [
        "@com_github_abseil_abseil_py//absl/logging",
        requirement("Flask"),
    ]
)

ipython(
    name = "shell",
    deps = [
        ":aqm_data_manager_lib",
        ":aqm_config_manager_lib",
        ":aqm_controller_lib"
    ],
)

mypy_test(
    name = "aqm_main_mypy",
    deps = [":aqm_main"],
)
