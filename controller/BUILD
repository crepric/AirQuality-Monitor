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

py_binary(
    name = "aqm_main",
    srcs = ["aqm_main.py",
            "aqm_controller.py"
           ],
    python_version = "PY3",
    data = [
        ":html_templates",
        ":static_resources",
    ],
    deps = [
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
        "web/aresources/css/*",
    ]),
)

