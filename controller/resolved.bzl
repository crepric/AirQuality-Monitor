resolved = [
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "air_quality_monitor",
            "path": "."
        },
        "native": "local_repository(name = \"air_quality_monitor\", path = \".\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/crosstool",
            "actual": "@bazel_tools//tools/cpp:toolchain"
        },
        "native": "bind(name = \"android/crosstool\", actual = \"@bazel_tools//tools/cpp:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/d8_jar_import",
            "actual": "@bazel_tools//tools/android:no_android_sdk_repository_error"
        },
        "native": "bind(name = \"android/d8_jar_import\", actual = \"@bazel_tools//tools/android:no_android_sdk_repository_error\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/dx_jar_import",
            "actual": "@bazel_tools//tools/android:no_android_sdk_repository_error"
        },
        "native": "bind(name = \"android/dx_jar_import\", actual = \"@bazel_tools//tools/android:no_android_sdk_repository_error\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android/sdk",
            "actual": "@bazel_tools//tools/android:poison_pill_android_sdk"
        },
        "native": "bind(name = \"android/sdk\", actual = \"@bazel_tools//tools/android:poison_pill_android_sdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_ndk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_ndk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "android_sdk_for_testing",
            "actual": "//:dummy"
        },
        "native": "bind(name = \"android_sdk_for_testing\", actual = \"//:dummy\")"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "bazel_tools",
            "path": "/home/crepric/.cache/bazel/_bazel_crepric/install/81ca4d6a39368c1feae1f1aa49842939/embedded_tools"
        },
        "native": "local_repository(name = \"bazel_tools\", path = __embedded_dir__ + \"/\" + \"embedded_tools\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "cc_toolchain",
            "actual": "@local_config_cc//:toolchain"
        },
        "native": "bind(name = \"cc_toolchain\", actual = \"@local_config_cc//:toolchain\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "databinding_annotation_processor",
            "actual": "@bazel_tools//tools/android:empty"
        },
        "native": "bind(name = \"databinding_annotation_processor\", actual = \"@bazel_tools//tools/android:empty\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "has_androidsdk",
            "actual": "@bazel_tools//tools/android:always_false"
        },
        "native": "bind(name = \"has_androidsdk\", actual = \"@bazel_tools//tools/android:always_false\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'mypy_integration' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:25:1",
        "original_attributes": {
            "name": "mypy_integration",
            "url": "https://github.com/thundergolfer/bazel-mypy-integration/archive/0.1.0.tar.gz",
            "sha256": "511ca642294129b7abebf6afd48aa63e7d91de3ec5fa0689d60d1dc6a94a7d1a",
            "strip_prefix": "bazel-mypy-integration-0.1.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/thundergolfer/bazel-mypy-integration/archive/0.1.0.tar.gz",
                    "urls": [],
                    "sha256": "511ca642294129b7abebf6afd48aa63e7d91de3ec5fa0689d60d1dc6a94a7d1a",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "bazel-mypy-integration-0.1.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "mypy_integration"
                },
                "output_tree_hash": "d0f252967d9780e2421d97bb28510736d228a5f9352a735b9bacb806dea5d241"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'bazel_skylib' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/repositories.bzl:23:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:38:1",
        "original_attributes": {
            "name": "bazel_skylib",
            "urls": [
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
                "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz"
            ],
            "sha256": "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz",
                        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.2/bazel-skylib-1.0.2.tar.gz"
                    ],
                    "sha256": "97e70364e9249702246c0e9444bccdc4b847bed1eb03c5a3ece4f83dfe6abc44",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "bazel_skylib"
                },
                "output_tree_hash": "9d894c3050dd6f85c271d712b7a79dbcc4057c553a9183d7dc791ff208326f9f"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'rules_python' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/repositories.bzl:15:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:38:1",
        "original_attributes": {
            "name": "rules_python",
            "url": "https://github.com/bazelbuild/rules_python/archive/0.1.0.tar.gz",
            "sha256": "48f7e716f4098b85296ad93f5a133baf712968c13fbc2fdf3a6136158fe86eac",
            "strip_prefix": "rules_python-0.1.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/bazelbuild/rules_python/archive/0.1.0.tar.gz",
                    "urls": [],
                    "sha256": "48f7e716f4098b85296ad93f5a133baf712968c13fbc2fdf3a6136158fe86eac",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "rules_python-0.1.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "rules_python"
                },
                "output_tree_hash": "e132d93a577985bb558f5ff52106c3696f0d4dd43f6d126c9013f5a7133e2626"
            }
        ]
    },
    {
        "original_rule_class": "@mypy_integration//:config.bzl%create_config",
        "definition_information": "Call stack for the definition of repository 'mypy_integration_config' which is a create_config (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/config.bzl:23:17):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/config.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:42:1",
        "original_attributes": {
            "name": "mypy_integration_config",
            "config_filepath": "//bazel_helpers:mypy.ini"
        },
        "repositories": [
            {
                "rule_class": "@mypy_integration//:config.bzl%create_config",
                "attributes": {
                    "name": "mypy_integration_config",
                    "config_filepath": "//bazel_helpers:mypy.ini"
                },
                "output_tree_hash": "ef81f70d351ea100193fb89b031d873fcee54e39b9bd5032588db1bf7006cc56"
            }
        ]
    },
    {
        "original_rule_class": "@rules_python//python/pip_install:pip_repository.bzl%pip_repository",
        "definition_information": "Call stack for the definition of repository 'mypy_integration_pip_deps' which is a pip_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip_install/pip_repository.bzl:67:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip.bzl:53:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/py_repositories.bzl:18:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/deps.bzl:18:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:46:1",
        "original_attributes": {
            "name": "mypy_integration_pip_deps",
            "python_interpreter": "python3",
            "requirements": "//bazel_helpers:mypy_version.txt"
        },
        "repositories": [
            {
                "rule_class": "@rules_python//python/pip_install:pip_repository.bzl%pip_repository",
                "attributes": {
                    "name": "mypy_integration_pip_deps",
                    "python_interpreter": "python3",
                    "requirements": "//bazel_helpers:mypy_version.txt"
                },
                "output_tree_hash": "099f011d39141884fc45356c14b108dc1de610357381dfd37588b3e9def7f300"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'pypi__pip' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip_install/repositories.bzl:57:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip.bzl:51:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/py_repositories.bzl:18:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/deps.bzl:18:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:46:1",
        "original_attributes": {
            "name": "pypi__pip",
            "url": "https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06bedf8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl",
            "sha256": "6917c65fc3769ecdc61405d3dfd97afdedd75808d200b2838d7d961cebc0c2c7",
            "type": "zip",
            "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06bedf8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl",
                    "urls": [],
                    "sha256": "6917c65fc3769ecdc61405d3dfd97afdedd75808d200b2838d7d961cebc0c2c7",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "zip",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "pypi__pip"
                },
                "output_tree_hash": "c4494c74cb284bb1681abd54e048c2e0d648a145535243568edea09d8cfcdb0e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'pypi__pkginfo' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip_install/repositories.bzl:57:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip.bzl:51:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/py_repositories.bzl:18:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/deps.bzl:18:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:46:1",
        "original_attributes": {
            "name": "pypi__pkginfo",
            "url": "https://files.pythonhosted.org/packages/e6/d5/451b913307b478c49eb29084916639dc53a88489b993530fed0a66bab8b9/pkginfo-1.5.0.1-py2.py3-none-any.whl",
            "sha256": "a6d9e40ca61ad3ebd0b72fbadd4fba16e4c0e4df0428c041e01e06eb6ee71f32",
            "type": "zip",
            "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://files.pythonhosted.org/packages/e6/d5/451b913307b478c49eb29084916639dc53a88489b993530fed0a66bab8b9/pkginfo-1.5.0.1-py2.py3-none-any.whl",
                    "urls": [],
                    "sha256": "a6d9e40ca61ad3ebd0b72fbadd4fba16e4c0e4df0428c041e01e06eb6ee71f32",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "zip",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "pypi__pkginfo"
                },
                "output_tree_hash": "c84788d1d61f7918e13717315ae350e4a49231b5a7ae6921c612ba745051a41a"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'pypi__setuptools' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip_install/repositories.bzl:57:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip.bzl:51:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/py_repositories.bzl:18:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/deps.bzl:18:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:46:1",
        "original_attributes": {
            "name": "pypi__setuptools",
            "url": "https://files.pythonhosted.org/packages/54/28/c45d8b54c1339f9644b87663945e54a8503cfef59cf0f65b3ff5dd17cf64/setuptools-42.0.2-py2.py3-none-any.whl",
            "sha256": "c8abd0f3574bc23afd2f6fd2c415ba7d9e097c8a99b845473b0d957ba1e2dac6",
            "type": "zip",
            "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://files.pythonhosted.org/packages/54/28/c45d8b54c1339f9644b87663945e54a8503cfef59cf0f65b3ff5dd17cf64/setuptools-42.0.2-py2.py3-none-any.whl",
                    "urls": [],
                    "sha256": "c8abd0f3574bc23afd2f6fd2c415ba7d9e097c8a99b845473b0d957ba1e2dac6",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "zip",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "pypi__setuptools"
                },
                "output_tree_hash": "c2ff4ade8a7495b0a0ca72efddcd837b9b6768724523d3586a71426fff42ce05"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'pypi__wheel' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip_install/repositories.bzl:57:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/rules_python/python/pip.bzl:51:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/py_repositories.bzl:18:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/mypy_integration/repositories/deps.bzl:18:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:46:1",
        "original_attributes": {
            "name": "pypi__wheel",
            "url": "https://files.pythonhosted.org/packages/00/83/b4a77d044e78ad1a45610eb88f745be2fd2c6d658f9798a15e384b7d57c9/wheel-0.33.6-py2.py3-none-any.whl",
            "sha256": "f4da1763d3becf2e2cd92a14a7c920f0f00eca30fdde9ea992c836685b9faf28",
            "type": "zip",
            "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://files.pythonhosted.org/packages/00/83/b4a77d044e78ad1a45610eb88f745be2fd2c6d658f9798a15e384b7d57c9/wheel-0.33.6-py2.py3-none-any.whl",
                    "urls": [],
                    "sha256": "f4da1763d3becf2e2cd92a14a7c920f0f00eca30fdde9ea992c836685b9faf28",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "zip",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "package(default_visibility = [\"//visibility:public\"])\n\nload(\"@rules_python//python:defs.bzl\", \"py_library\")\n\npy_library(\n    name = \"lib\",\n    srcs = glob([\"**/*.py\"]),\n    data = glob([\"**/*\"], exclude=[\"**/*.py\", \"**/* *\", \"BUILD\", \"WORKSPACE\"]),\n    # This makes this directory a top-level in the python import\n    # search path for anything that depends on this.\n    imports = [\".\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "pypi__wheel"
                },
                "output_tree_hash": "47d9520bc5c0542897af868639fad3909888432ba5dba4330d5a195524723915"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_grpc_grpc' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:76:1",
        "original_attributes": {
            "name": "com_github_grpc_grpc",
            "urls": [
                "https://github.com/grpc/grpc/archive/v1.26.0.tar.gz"
            ],
            "sha256": "2fcb7f1ab160d6fd3aaade64520be3e5446fc4c6fa7ba6581afdc4e26094bd81",
            "strip_prefix": "grpc-1.26.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/grpc/grpc/archive/v1.26.0.tar.gz"
                    ],
                    "sha256": "2fcb7f1ab160d6fd3aaade64520be3e5446fc4c6fa7ba6581afdc4e26094bd81",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "grpc-1.26.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_grpc_grpc"
                },
                "output_tree_hash": "b3d6c135abacbfc021646fb6d5c77e600a656ef586d432d232d8aab568b3363f"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "absl-base",
            "actual": "@com_google_absl//absl/base:base"
        },
        "native": "bind(name = \"absl-base\", actual = \"@com_google_absl//absl/base:base\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "absl-time",
            "actual": "@com_google_absl//absl/time:time"
        },
        "native": "bind(name = \"absl-time\", actual = \"@com_google_absl//absl/time:time\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'bazel_toolchains' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:180:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "bazel_toolchains",
            "urls": [
                "https://github.com/bazelbuild/bazel-toolchains/releases/download/1.0.1/bazel-toolchains-1.0.1.tar.gz",
                "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/1.0.1.tar.gz"
            ],
            "sha256": "0b36eef8a66f39c8dbae88e522d5bbbef49d5e66e834a982402c79962281be10",
            "strip_prefix": "bazel-toolchains-1.0.1"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/bazel-toolchains/releases/download/1.0.1/bazel-toolchains-1.0.1.tar.gz",
                        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/1.0.1.tar.gz"
                    ],
                    "sha256": "0b36eef8a66f39c8dbae88e522d5bbbef49d5e66e834a982402c79962281be10",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "bazel-toolchains-1.0.1",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "bazel_toolchains"
                },
                "output_tree_hash": "2a1272c96dd23b4429ec6cdf4cb4397af68434daa80b95055d5f84c35b0b6e4e"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "benchmark",
            "actual": "@com_github_google_benchmark//:benchmark"
        },
        "native": "bind(name = \"benchmark\", actual = \"@com_github_google_benchmark//:benchmark\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'boringssl' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:105:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "boringssl",
            "url": "https://boringssl.googlesource.com/boringssl/+archive/83da28a68f32023fd3b95a8ae94991a07b1f6c62.tar.gz"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://boringssl.googlesource.com/boringssl/+archive/83da28a68f32023fd3b95a8ae94991a07b1f6c62.tar.gz",
                    "urls": [],
                    "sha256": "92c314193066c5fd8419c427d460fc1a79d0c5b6d7a7f16a38a40cbe75bd68c6",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "boringssl"
                },
                "output_tree_hash": "a6711a83b43393cc2cdb50321678f69d3aae4d3655307fd01f065992ac950a67"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'build_bazel_apple_support' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:238:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "build_bazel_apple_support",
            "urls": [
                "https://github.com/bazelbuild/apple_support/releases/download/0.7.1/apple_support.0.7.1.tar.gz"
            ],
            "sha256": "122ebf7fe7d1c8e938af6aeaee0efe788a3a2449ece5a8d6a428cb18d6f88033"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/apple_support/releases/download/0.7.1/apple_support.0.7.1.tar.gz"
                    ],
                    "sha256": "122ebf7fe7d1c8e938af6aeaee0efe788a3a2449ece5a8d6a428cb18d6f88033",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "build_bazel_apple_support"
                },
                "output_tree_hash": "84956d487f064961a7d3fdfcc8ed7b4b6b8d1bce30dbabe464d12a61e18a9381"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'build_bazel_rules_apple' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:230:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "build_bazel_rules_apple",
            "url": "https://github.com/bazelbuild/rules_apple/archive/b869b0d3868d78a1d4ffd866ccb304fb68aa12c3.tar.gz",
            "sha256": "bdc8e66e70b8a75da23b79f1f8c6207356df07d041d96d2189add7ee0780cf4e",
            "strip_prefix": "rules_apple-b869b0d3868d78a1d4ffd866ccb304fb68aa12c3"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/bazelbuild/rules_apple/archive/b869b0d3868d78a1d4ffd866ccb304fb68aa12c3.tar.gz",
                    "urls": [],
                    "sha256": "bdc8e66e70b8a75da23b79f1f8c6207356df07d041d96d2189add7ee0780cf4e",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "rules_apple-b869b0d3868d78a1d4ffd866ccb304fb68aa12c3",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "build_bazel_rules_apple"
                },
                "output_tree_hash": "5fa9f97cf2c14d3391202675af4ff31cc0f4979a4e832d068eaf584da016901c"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "cares",
            "actual": "@com_github_cares_cares//:ares"
        },
        "native": "bind(name = \"cares\", actual = \"@com_github_cares_cares//:ares\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_cares_cares' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:162:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_github_cares_cares",
            "url": "https://github.com/c-ares/c-ares/archive/e982924acee7f7313b4baa4ee5ec000c5e373c30.tar.gz",
            "sha256": "e8c2751ddc70fed9dc6f999acd92e232d5846f009ee1674f8aee81f19b2b915a",
            "strip_prefix": "c-ares-e982924acee7f7313b4baa4ee5ec000c5e373c30",
            "build_file": "@com_github_grpc_grpc//third_party:cares/cares.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/c-ares/c-ares/archive/e982924acee7f7313b4baa4ee5ec000c5e373c30.tar.gz",
                    "urls": [],
                    "sha256": "e8c2751ddc70fed9dc6f999acd92e232d5846f009ee1674f8aee81f19b2b915a",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "c-ares-e982924acee7f7313b4baa4ee5ec000c5e373c30",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_github_grpc_grpc//third_party:cares/cares.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_cares_cares"
                },
                "output_tree_hash": "2568bda9aa978e2d7f7490460e8bd67555ee59285ad195f1e7fa32687c6459d0"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_gflags_gflags' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:146:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_github_gflags_gflags",
            "url": "https://github.com/gflags/gflags/archive/28f50e0fed19872e0fd50dd23ce2ee8cd759338e.tar.gz",
            "sha256": "63ae70ea3e05780f7547d03503a53de3a7d2d83ad1caaa443a31cb20aea28654",
            "strip_prefix": "gflags-28f50e0fed19872e0fd50dd23ce2ee8cd759338e"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/gflags/gflags/archive/28f50e0fed19872e0fd50dd23ce2ee8cd759338e.tar.gz",
                    "urls": [],
                    "sha256": "63ae70ea3e05780f7547d03503a53de3a7d2d83ad1caaa443a31cb20aea28654",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "gflags-28f50e0fed19872e0fd50dd23ce2ee8cd759338e",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_gflags_gflags"
                },
                "output_tree_hash": "28ec9dd147bf86ae1f485569c31a29bc8a916e4b588ec213fda9df8dde32dd80"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_google_benchmark' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:154:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_github_google_benchmark",
            "url": "https://github.com/google/benchmark/archive/090faecb454fbd6e6e17a75ef8146acb037118d4.tar.gz",
            "sha256": "f68aec93154d010324c05bcd8c5cc53468b87af88d87acb5ddcfaa1bba044837",
            "strip_prefix": "benchmark-090faecb454fbd6e6e17a75ef8146acb037118d4"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/google/benchmark/archive/090faecb454fbd6e6e17a75ef8146acb037118d4.tar.gz",
                    "urls": [],
                    "sha256": "f68aec93154d010324c05bcd8c5cc53468b87af88d87acb5ddcfaa1bba044837",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "benchmark-090faecb454fbd6e6e17a75ef8146acb037118d4",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_google_benchmark"
                },
                "output_tree_hash": "ac2fae62e19cc5429cbc706e8fcc20689ba8e20afa2daf758422d05de2fe423b"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_google_googletest' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:130:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_github_google_googletest",
            "url": "https://github.com/google/googletest/archive/c9ccac7cb7345901884aabf5d1a786cfa6e2f397.tar.gz",
            "sha256": "443d383db648ebb8e391382c0ab63263b7091d03197f304390baac10f178a468",
            "strip_prefix": "googletest-c9ccac7cb7345901884aabf5d1a786cfa6e2f397"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/google/googletest/archive/c9ccac7cb7345901884aabf5d1a786cfa6e2f397.tar.gz",
                    "urls": [],
                    "sha256": "443d383db648ebb8e391382c0ab63263b7091d03197f304390baac10f178a468",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "googletest-c9ccac7cb7345901884aabf5d1a786cfa6e2f397",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_google_googletest"
                },
                "output_tree_hash": "17eb08d462e86fca832492264bda5eab614c6c7b80c828820e6cd6889b12142b"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_absl' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:171:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_google_absl",
            "url": "https://github.com/abseil/abseil-cpp/archive/0514227d2547793b23e209809276375e41c76617.tar.gz",
            "sha256": "ce318a8cd0fa4443c6c01d385cd28b2785b8160dd270b945d6b08cccff568ce6",
            "strip_prefix": "abseil-cpp-0514227d2547793b23e209809276375e41c76617"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/abseil/abseil-cpp/archive/0514227d2547793b23e209809276375e41c76617.tar.gz",
                    "urls": [],
                    "sha256": "ce318a8cd0fa4443c6c01d385cd28b2785b8160dd270b945d6b08cccff568ce6",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "abseil-cpp-0514227d2547793b23e209809276375e41c76617",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_absl"
                },
                "output_tree_hash": "d92fed73d769054d53ce88a630e9b09fc3f4187a1718311867956f09eb089323"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_protobuf' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:122:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "com_google_protobuf",
            "url": "https://github.com/google/protobuf/archive/09745575a923640154bcf307fba8aedff47f240a.tar.gz",
            "sha256": "416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758",
            "strip_prefix": "protobuf-09745575a923640154bcf307fba8aedff47f240a"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/google/protobuf/archive/09745575a923640154bcf307fba8aedff47f240a.tar.gz",
                    "urls": [],
                    "sha256": "416212e14481cff8fd4849b1c1c1200a7f34808a54377e22d7447efdf54ad758",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "protobuf-09745575a923640154bcf307fba8aedff47f240a",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_protobuf"
                },
                "output_tree_hash": "8fb661a8a42cf0aca9dcfac12bbbcaa9b63ff4ea52cd2c3c1f5fcae3129ab873"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'cython' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:65:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "cython",
            "urls": [
                "https://github.com/cython/cython/archive/c2b80d87658a8525ce091cbe146cb7eaa29fed5c.tar.gz"
            ],
            "sha256": "d68138a2381afbdd0876c3cb2a22389043fa01c4badede1228ee073032b07a27",
            "strip_prefix": "cython-c2b80d87658a8525ce091cbe146cb7eaa29fed5c",
            "build_file": "@com_github_grpc_grpc//third_party:cython.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/cython/cython/archive/c2b80d87658a8525ce091cbe146cb7eaa29fed5c.tar.gz"
                    ],
                    "sha256": "d68138a2381afbdd0876c3cb2a22389043fa01c4badede1228ee073032b07a27",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "cython-c2b80d87658a8525ce091cbe146cb7eaa29fed5c",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_github_grpc_grpc//third_party:cython.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "cython"
                },
                "output_tree_hash": "fc9bf5ccaa86782cd4e4d283db995de49cf3088d8bab80c25c0a68779073370a"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'enum34' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:25:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "enum34",
            "urls": [
                "https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"
            ],
            "sha256": "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1",
            "strip_prefix": "enum34-1.1.6",
            "build_file": "@com_github_grpc_grpc//third_party:enum34.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"
                    ],
                    "sha256": "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "enum34-1.1.6",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_github_grpc_grpc//third_party:enum34.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "enum34"
                },
                "output_tree_hash": "ce5295dd2bbb643cd68ee593afe07ec84f33cf2a85b0582ab35cb9c6a79f7175"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'envoy_api' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:215:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "envoy_api",
            "url": "https://github.com/envoyproxy/data-plane-api/archive/c83ed7ea9eb5fb3b93d1ad52b59750f1958b8bde.tar.gz",
            "sha256": "9e8cf42abce32c9b0e9e271b0cb62803084cbe5e5b49f5d5c2aef0766f9d69ca",
            "strip_prefix": "data-plane-api-c83ed7ea9eb5fb3b93d1ad52b59750f1958b8bde"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/envoyproxy/data-plane-api/archive/c83ed7ea9eb5fb3b93d1ad52b59750f1958b8bde.tar.gz",
                    "urls": [],
                    "sha256": "9e8cf42abce32c9b0e9e271b0cb62803084cbe5e5b49f5d5c2aef0766f9d69ca",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "data-plane-api-c83ed7ea9eb5fb3b93d1ad52b59750f1958b8bde",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "envoy_api"
                },
                "output_tree_hash": "7b18e057808a2fbf520dbe63b9109239c79c06c8de382f01dba980b4d513689a"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'futures' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:34:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "futures",
            "urls": [
                "https://files.pythonhosted.org/packages/47/04/5fc6c74ad114032cd2c544c575bffc17582295e9cd6a851d6026ab4b2c00/futures-3.3.0.tar.gz"
            ],
            "sha256": "7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794",
            "strip_prefix": "futures-3.3.0",
            "build_file": "@com_github_grpc_grpc//third_party:futures.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://files.pythonhosted.org/packages/47/04/5fc6c74ad114032cd2c544c575bffc17582295e9cd6a851d6026ab4b2c00/futures-3.3.0.tar.gz"
                    ],
                    "sha256": "7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "futures-3.3.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_github_grpc_grpc//third_party:futures.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "futures"
                },
                "output_tree_hash": "83033c8dc633c2e8069cd03a33bf910283cb62e674caa3e4050dfb4048d2fbcd"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "gflags",
            "actual": "@com_github_gflags_gflags//:gflags"
        },
        "native": "bind(name = \"gflags\", actual = \"@com_github_gflags_gflags//:gflags\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "grpc++_codegen_proto",
            "actual": "@com_github_grpc_grpc//:grpc++_codegen_proto"
        },
        "native": "bind(name = \"grpc++_codegen_proto\", actual = \"@com_github_grpc_grpc//:grpc++_codegen_proto\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "grpc_cpp_plugin",
            "actual": "@com_github_grpc_grpc//src/compiler:grpc_cpp_plugin"
        },
        "native": "bind(name = \"grpc_cpp_plugin\", actual = \"@com_github_grpc_grpc//src/compiler:grpc_cpp_plugin\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "gtest",
            "actual": "@com_github_google_googletest//:gtest"
        },
        "native": "bind(name = \"gtest\", actual = \"@com_github_google_googletest//:gtest\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:223:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "io_bazel_rules_go",
            "urls": [
                "https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz"
            ],
            "sha256": "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/rules_go/releases/download/0.18.5/rules_go-0.18.5.tar.gz"
                    ],
                    "sha256": "a82a352bffae6bee4e95f68a8d80a70e87f42c4741e6a448bec11998fcc82329",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "io_bazel_rules_go"
                },
                "output_tree_hash": "dd49a3e8afb3c62b2a4792d37852972d9aad335f9f7cf0d163a920c645474ada"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_python' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:43:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "io_bazel_rules_python",
            "url": "https://github.com/bazelbuild/rules_python/releases/download/0.0.1/rules_python-0.0.1.tar.gz",
            "sha256": "aa96a691d3a8177f3215b14b0edc9641787abaaa30363a080165d06ab65e1161"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/bazelbuild/rules_python/releases/download/0.0.1/rules_python-0.0.1.tar.gz",
                    "urls": [],
                    "sha256": "aa96a691d3a8177f3215b14b0edc9641787abaaa30363a080165d06ab65e1161",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "io_bazel_rules_python"
                },
                "output_tree_hash": "f3c3dd4ea46eab946b247d2f4e537d39b861caf222458e51ba1b7b8eb54ccf07"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'io_opencensus_cpp' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:201:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "io_opencensus_cpp",
            "url": "https://github.com/census-instrumentation/opencensus-cpp/archive/c9a4da319bc669a772928ffc55af4a61be1a1176.tar.gz",
            "sha256": "90d6fafa8b1a2ea613bf662731d3086e1c2ed286f458a95c81744df2dbae41b1",
            "strip_prefix": "opencensus-cpp-c9a4da319bc669a772928ffc55af4a61be1a1176"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/census-instrumentation/opencensus-cpp/archive/c9a4da319bc669a772928ffc55af4a61be1a1176.tar.gz",
                    "urls": [],
                    "sha256": "90d6fafa8b1a2ea613bf662731d3086e1c2ed286f458a95c81744df2dbae41b1",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "opencensus-cpp-c9a4da319bc669a772928ffc55af4a61be1a1176",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "io_opencensus_cpp"
                },
                "output_tree_hash": "01062aa16139d873a154bfd95412d8e23109dfd9c1526eb0ce391b81f3b56e00"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "libssl",
            "actual": "@boringssl//:ssl"
        },
        "native": "bind(name = \"libssl\", actual = \"@boringssl//:ssl\")"
    },
    {
        "original_rule_class": "@com_github_grpc_grpc//third_party/py:python_configure.bzl%python_configure",
        "definition_information": "Call stack for the definition of repository 'local_config_python' which is a python_configure (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/third_party/py/python_configure.bzl:326:20):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:57:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "local_config_python"
        },
        "repositories": [
            {
                "rule_class": "@com_github_grpc_grpc//third_party/py:python_configure.bzl%python_configure",
                "attributes": {
                    "name": "local_config_python"
                },
                "output_tree_hash": "0164779a43ca9503e390443f4d71e7088e232cfed1f3daf4342ce012bbdf7538"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "madler_zlib",
            "actual": "@zlib//:zlib"
        },
        "native": "bind(name = \"madler_zlib\", actual = \"@zlib//:zlib\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "opencensus-stats",
            "actual": "@io_opencensus_cpp//opencensus/stats:stats"
        },
        "native": "bind(name = \"opencensus-stats\", actual = \"@io_opencensus_cpp//opencensus/stats:stats\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "opencensus-stats-test",
            "actual": "@io_opencensus_cpp//opencensus/stats:test_utils"
        },
        "native": "bind(name = \"opencensus-stats-test\", actual = \"@io_opencensus_cpp//opencensus/stats:test_utils\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "opencensus-trace",
            "actual": "@io_opencensus_cpp//opencensus/trace:trace"
        },
        "native": "bind(name = \"opencensus-trace\", actual = \"@io_opencensus_cpp//opencensus/trace:trace\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "protobuf",
            "actual": "@com_google_protobuf//:protobuf"
        },
        "native": "bind(name = \"protobuf\", actual = \"@com_google_protobuf//:protobuf\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "protobuf_clib",
            "actual": "@com_google_protobuf//:protoc_lib"
        },
        "native": "bind(name = \"protobuf_clib\", actual = \"@com_google_protobuf//:protoc_lib\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "protobuf_headers",
            "actual": "@com_google_protobuf//:protobuf_headers"
        },
        "native": "bind(name = \"protobuf_headers\", actual = \"@com_google_protobuf//:protobuf_headers\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "protocol_compiler",
            "actual": "@com_google_protobuf//:protoc"
        },
        "native": "bind(name = \"protocol_compiler\", actual = \"@com_google_protobuf//:protoc\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "python_headers",
            "actual": "@local_config_python//:python_headers"
        },
        "native": "bind(name = \"python_headers\", actual = \"@local_config_python//:python_headers\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'rules_cc' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:138:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "rules_cc",
            "url": "https://github.com/bazelbuild/rules_cc/archive/624b5d59dfb45672d4239422fa1e3de1822ee110.tar.gz",
            "sha256": "35f2fb4ea0b3e61ad64a369de284e4fbbdcdba71836a5555abb5e194cf119509",
            "strip_prefix": "rules_cc-624b5d59dfb45672d4239422fa1e3de1822ee110"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/bazelbuild/rules_cc/archive/624b5d59dfb45672d4239422fa1e3de1822ee110.tar.gz",
                    "urls": [],
                    "sha256": "35f2fb4ea0b3e61ad64a369de284e4fbbdcdba71836a5555abb5e194cf119509",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "rules_cc-624b5d59dfb45672d4239422fa1e3de1822ee110",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "rules_cc"
                },
                "output_tree_hash": "99086a548379288782c1de4c13a11c1228735dc1b62fa18780691ed4728919af"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "six",
            "actual": "@six_archive//:six"
        },
        "native": "bind(name = \"six\", actual = \"@six_archive//:six\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'six_archive' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:16:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:246:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "six_archive",
            "urls": [
                "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
            ],
            "sha256": "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73",
            "strip_prefix": "six-1.12.0",
            "build_file": "@com_github_grpc_grpc//third_party:six.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"
                    ],
                    "sha256": "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "six-1.12.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_github_grpc_grpc//third_party:six.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "six_archive"
                },
                "output_tree_hash": "6086a51af6b5b9233a04fa37853a98c12c7d0c29d1d9a6032122a9ad694dfabe"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'upb' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:208:9\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:90:1",
        "original_attributes": {
            "name": "upb",
            "url": "https://github.com/protocolbuffers/upb/archive/9effcbcb27f0a665f9f345030188c0b291e32482.tar.gz",
            "sha256": "61d0417abd60e65ed589c9deee7c124fe76a4106831f6ad39464e1525cef1454",
            "strip_prefix": "upb-9effcbcb27f0a665f9f345030188c0b291e32482"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://github.com/protocolbuffers/upb/archive/9effcbcb27f0a665f9f345030188c0b291e32482.tar.gz",
                    "urls": [],
                    "sha256": "61d0417abd60e65ed589c9deee7c124fe76a4106831f6ad39464e1525cef1454",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "upb-9effcbcb27f0a665f9f345030188c0b291e32482",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "upb"
                },
                "output_tree_hash": "a72ebe29af1555e3c503692a295ffb206967e4db87e1f8470eea28c1ea13f90e"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "upb_lib",
            "actual": "@upb//:upb"
        },
        "native": "bind(name = \"upb_lib\", actual = \"@upb//:upb\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "zlib",
            "actual": "@net_zlib//:zlib"
        },
        "native": "bind(name = \"zlib\", actual = \"@net_zlib//:zlib\")"
    },
    {
        "original_rule_class": "@upb//bazel:repository_defs.bzl%bazel_version_repository",
        "definition_information": "Call stack for the definition of repository 'bazel_version' which is a bazel_version_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/upb/bazel/repository_defs.bzl:12:28):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/upb/bazel/workspace_deps.bzl:7:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:31:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "bazel_version"
        },
        "repositories": [
            {
                "rule_class": "@upb//bazel:repository_defs.bzl%bazel_version_repository",
                "attributes": {
                    "name": "bazel_version"
                },
                "output_tree_hash": "41ebba7da3b6d95da5cafef1a3ad316d4a1b23ff05450f96174c0a2d94d0d6f7"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'build_bazel_rules_swift' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/build_bazel_rules_apple/apple/repositories.bzl:84:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/build_bazel_rules_apple/apple/repositories.bzl:117:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:38:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "build_bazel_rules_swift",
            "urls": [
                "https://github.com/bazelbuild/rules_swift/releases/download/0.12.1/rules_swift.0.12.1.tar.gz"
            ],
            "sha256": "18cd4df4e410b0439a4935f9ca035bd979993d42372ba79e7f2d4fafe9596ef0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/bazelbuild/rules_swift/releases/download/0.12.1/rules_swift.0.12.1.tar.gz"
                    ],
                    "sha256": "18cd4df4e410b0439a4935f9ca035bd979993d42372ba79e7f2d4fafe9596ef0",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "build_bazel_rules_swift"
                },
                "output_tree_hash": "466c94af4eca25d657eec5ee0343ad4520c015bc3d4c89dabad0cc6a51eff147"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_envoyproxy_protoc_gen_validate' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:10:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_envoyproxy_protoc_gen_validate",
            "urls": [
                "https://github.com/envoyproxy/protoc-gen-validate/archive/fd7de029969b7c0ef8b754660b997399b6fd812a.tar.gz"
            ],
            "sha256": "55c6ad4a1b405938524ab55b18349c824d3fc6eaef580e1ef2a9dfe39f737b9e",
            "strip_prefix": "protoc-gen-validate-fd7de029969b7c0ef8b754660b997399b6fd812a"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/envoyproxy/protoc-gen-validate/archive/fd7de029969b7c0ef8b754660b997399b6fd812a.tar.gz"
                    ],
                    "sha256": "55c6ad4a1b405938524ab55b18349c824d3fc6eaef580e1ef2a9dfe39f737b9e",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "protoc-gen-validate-fd7de029969b7c0ef8b754660b997399b6fd812a",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_envoyproxy_protoc_gen_validate"
                },
                "output_tree_hash": "540c7c6f9df41d211163bd7ab9a8ae430e4f5dff1a85765641c5da0e6592d5b8"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_abseil_abseil_py' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:127:1",
        "original_attributes": {
            "name": "com_github_abseil_abseil_py",
            "urls": [
                "https://github.com/abseil/abseil-py/archive/pypi-v0.9.0.tar.gz"
            ],
            "sha256": "603febc9b95a8f2979a7bdb77d2f5e4d9b30d4e0d59579f88eba67d4e4cc5462",
            "strip_prefix": "abseil-py-pypi-v0.9.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/abseil/abseil-py/archive/pypi-v0.9.0.tar.gz"
                    ],
                    "sha256": "603febc9b95a8f2979a7bdb77d2f5e4d9b30d4e0d59579f88eba67d4e4cc5462",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "abseil-py-pypi-v0.9.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_abseil_abseil_py"
                },
                "output_tree_hash": "c0e27e313afe22032d4d967b2ef71f3660619996fd9944e1588d66b6acee7655"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_cncf_udpa' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:18:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_cncf_udpa",
            "urls": [
                "https://github.com/cncf/udpa/archive/015fc86d90f4045a56f831bcdfa560bc455450e2.tar.gz"
            ],
            "sha256": "2f2b4bdb718250531f3ed9c2010272f04bbca92af70348714fd3687e86acc1f7",
            "strip_prefix": "udpa-015fc86d90f4045a56f831bcdfa560bc455450e2"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/cncf/udpa/archive/015fc86d90f4045a56f831bcdfa560bc455450e2.tar.gz"
                    ],
                    "sha256": "2f2b4bdb718250531f3ed9c2010272f04bbca92af70348714fd3687e86acc1f7",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "udpa-015fc86d90f4045a56f831bcdfa560bc455450e2",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_cncf_udpa"
                },
                "output_tree_hash": "cf69a2c7baebc9d64d9f2ff36d1dc614281f029254e970a014f8372bce19bb78"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_glog_glog' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:108:1",
        "original_attributes": {
            "name": "com_github_glog_glog",
            "urls": [
                "https://github.com/google/glog/archive/v0.4.0.tar.gz"
            ],
            "sha256": "f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c",
            "strip_prefix": "glog-0.4.0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/google/glog/archive/v0.4.0.tar.gz"
                    ],
                    "sha256": "f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "glog-0.4.0",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_github_glog_glog"
                },
                "output_tree_hash": "f03ef68eaf290bc7c5a0bec9552a75b27285441c13d0472e9aa1985649c7b5c6"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_gogo_protobuf' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:114:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_gogo_protobuf",
            "remote": "https://github.com/gogo/protobuf",
            "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
            "shallow_since": "1550471403 +0200",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/gogo/protobuf",
                    "commit": "ba06b47c162d49f2af050fb4c75bcbc86a159d5c",
                    "shallow_since": "1550471403 +0200",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_gogo_protobuf-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "com_github_gogo_protobuf"
                },
                "output_tree_hash": "ad98c6f044e92b8b96f1328663de333ad868936a4aefc484e0590d35dc5b6e8c"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_glog' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:205:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_golang_glog",
            "remote": "https://github.com/golang/glog",
            "commit": "23def4e6c14b4da8ac2ed8007337bc5eb5007998",
            "shallow_since": "1453852388 +1100",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_golang_glog-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/golang/glog",
                    "commit": "23def4e6c14b4da8ac2ed8007337bc5eb5007998",
                    "shallow_since": "1453852388 +1100",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_golang_glog-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "com_github_golang_glog"
                },
                "output_tree_hash": "7eda041577d96c36f700dc8613f2aab0cdd5c811226acee1da491d1ee970cb8b"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_golang_protobuf' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:54:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_golang_protobuf",
            "remote": "https://github.com/golang/protobuf",
            "commit": "c823c79ea1570fb5ff454033735a8e68575d1d0f",
            "shallow_since": "1549405252 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/golang/protobuf",
                    "commit": "c823c79ea1570fb5ff454033735a8e68575d1d0f",
                    "shallow_since": "1549405252 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-gazelle.patch",
                        "@io_bazel_rules_go//third_party:com_github_golang_protobuf-extras.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "com_github_golang_protobuf"
                },
                "output_tree_hash": "17d610419e010992e40c13e41173894e972cc0cbd6ccc3a840dc176f67f8f451"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_kevinburke_go_bindata' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:215:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_kevinburke_go_bindata",
            "remote": "https://github.com/kevinburke/go-bindata",
            "commit": "53d73b98acf3bd9f56d7f9136ed8e1be64756e1d",
            "shallow_since": "1545009224 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_kevinburke_go_bindata-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/kevinburke/go-bindata",
                    "commit": "53d73b98acf3bd9f56d7f9136ed8e1be64756e1d",
                    "shallow_since": "1545009224 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_kevinburke_go_bindata-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "com_github_kevinburke_go_bindata"
                },
                "output_tree_hash": "e8fd15ff263a3c7806ee60824d956ee27d3e038397f134a9f91c602ed0384262"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'com_github_mwitkow_go_proto_validators' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:103:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_mwitkow_go_proto_validators",
            "remote": "https://github.com/mwitkow/go-proto-validators",
            "commit": "1f388280e944c97cc59c75d8c84a704097d1f1d6",
            "shallow_since": "1549963709 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/mwitkow/go-proto-validators",
                    "commit": "1f388280e944c97cc59c75d8c84a704097d1f1d6",
                    "shallow_since": "1549963709 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:com_github_mwitkow_go_proto_validators-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "com_github_mwitkow_go_proto_validators"
                },
                "output_tree_hash": "7a5296db2c61c4f29640be92187eee52d3bca563b79e388295e4ed0f3653a58d"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_github_openzipkin_zipkinapi' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:37:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_github_openzipkin_zipkinapi",
            "urls": [
                "https://github.com/openzipkin/zipkin-api/archive/0.2.2.tar.gz"
            ],
            "sha256": "688c4fe170821dd589f36ec45aaadc03a618a40283bc1f97da8fa11686fc816b",
            "strip_prefix": "zipkin-api-0.2.2",
            "build_file_content": "\n\nload(\"@envoy_api//bazel:api_build_system.bzl\", \"api_cc_py_proto_library\")\nload(\"@io_bazel_rules_go//proto:def.bzl\", \"go_proto_library\")\n\napi_cc_py_proto_library(\n    name = \"zipkin\",\n    srcs = [\n        \"zipkin-jsonv2.proto\",\n        \"zipkin.proto\",\n    ],\n    visibility = [\"//visibility:public\"],\n)\n\ngo_proto_library(\n    name = \"zipkin_go_proto\",\n    proto = \":zipkin\",\n    visibility = [\"//visibility:public\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/openzipkin/zipkin-api/archive/0.2.2.tar.gz"
                    ],
                    "sha256": "688c4fe170821dd589f36ec45aaadc03a618a40283bc1f97da8fa11686fc816b",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zipkin-api-0.2.2",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "\n\nload(\"@envoy_api//bazel:api_build_system.bzl\", \"api_cc_py_proto_library\")\nload(\"@io_bazel_rules_go//proto:def.bzl\", \"go_proto_library\")\n\napi_cc_py_proto_library(\n    name = \"zipkin\",\n    srcs = [\n        \"zipkin-jsonv2.proto\",\n        \"zipkin.proto\",\n    ],\n    visibility = [\"//visibility:public\"],\n)\n\ngo_proto_library(\n    name = \"zipkin_go_proto\",\n    proto = \":zipkin\",\n    visibility = [\"//visibility:public\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "com_github_openzipkin_zipkinapi"
                },
                "output_tree_hash": "0ab7ad10231ba5a8109ea709eafc09582477eb7862da6e9222ac7611b24e3255"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'com_google_googleapis' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:14:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "com_google_googleapis",
            "urls": [
                "https://github.com/googleapis/googleapis/archive/be480e391cc88a75cf2a81960ef79c80d5012068.tar.gz"
            ],
            "sha256": "c1969e5b72eab6d9b6cfcff748e45ba57294aeea1d96fd04cd081995de0605c2",
            "strip_prefix": "googleapis-be480e391cc88a75cf2a81960ef79c80d5012068"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/googleapis/googleapis/archive/be480e391cc88a75cf2a81960ef79c80d5012068.tar.gz"
                    ],
                    "sha256": "c1969e5b72eab6d9b6cfcff748e45ba57294aeea1d96fd04cd081995de0605c2",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "googleapis-be480e391cc88a75cf2a81960ef79c80d5012068",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "com_google_googleapis"
                },
                "output_tree_hash": "95591a44c077c6e129de16c23acd1172d70cc80eb3ab3a1748417eb5c348a916"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'crepric_pygatt' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:136:1",
        "original_attributes": {
            "name": "crepric_pygatt",
            "remote": "https://github.com/crepric/pygatt.git",
            "branch": "master"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/crepric/pygatt.git",
                    "commit": "e800d6f3562e1844e27885073c1d4c7a3a7c9e3a",
                    "shallow_since": "1613985762 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "crepric_pygatt"
                },
                "output_tree_hash": "ed3bad40fe01082e41ef5c1f6fe02df171aaf335cc8b95e0ab790122c278dc3a"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "glog",
            "actual": "@com_github_glog_glog//:glog"
        },
        "native": "bind(name = \"glog\", actual = \"@com_github_glog_glog//:glog\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'go_googleapis' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:188:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "go_googleapis",
            "remote": "https://github.com/googleapis/googleapis",
            "commit": "41d72d444fbe445f4da89e13be02078734fb7875",
            "shallow_since": "1551404057 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
            ],
            "patch_args": [
                "-E",
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/googleapis/googleapis",
                    "commit": "41d72d444fbe445f4da89e13be02078734fb7875",
                    "shallow_since": "1551404057 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:go_googleapis-deletebuild.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-directives.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-gazelle.patch",
                        "@io_bazel_rules_go//third_party:go_googleapis-fix.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-E",
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "go_googleapis"
                },
                "output_tree_hash": "c2c13316fddd42222a3f95f790ee76f3a8f4fc9a05a43c5ff3cc805175aa2dcb"
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
        "definition_information": "Call stack for the definition of repository 'go_sdk' which is a _go_download_sdk (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/sdk.bzl:53:20):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/sdk.bzl:65:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/toolchain/toolchains.bzl:379:13\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:36:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "go_sdk",
            "sdks": {
                "darwin_amd64": [
                    "go1.12.5.darwin-amd64.tar.gz",
                    "566d0b407f7d4aa5a1315988b562bbe4e9422a93ce2fbf27a664cddcb9a3e617"
                ],
                "freebsd_386": [
                    "go1.12.5.freebsd-386.tar.gz",
                    "b842330ad695bac9ea57d0a9d3aafaaf34921ec85702bccc2067f448e868332b"
                ],
                "freebsd_amd64": [
                    "go1.12.5.freebsd-amd64.tar.gz",
                    "082acae7f5d2c780521f95fd177a08aacaccc0e38042d4ef981f7d7211a27b8a"
                ],
                "linux_386": [
                    "go1.12.5.linux-386.tar.gz",
                    "146605e13bf337ff3aacd941a816c5d97a8fef8b5817e07fcec4540632085980"
                ],
                "linux_amd64": [
                    "go1.12.5.linux-amd64.tar.gz",
                    "aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf"
                ],
                "linux_arm64": [
                    "go1.12.5.linux-arm64.tar.gz",
                    "ff09f34935cd189a4912f3f308ec83e4683c309304144eae9cf60ebc552e7cd8"
                ],
                "linux_arm": [
                    "go1.12.5.linux-armv6l.tar.gz",
                    "311f5e76c7cec1ec752474a61d837e474b8e750b8e3eed267911ab57c0e5da9a"
                ],
                "linux_ppc64le": [
                    "go1.12.5.linux-ppc64le.tar.gz",
                    "e88b2a2098bc79ad33912d1d27bc3282a7f3231b6f4672f306465bf46ff784ca"
                ],
                "linux_s390x": [
                    "go1.12.5.linux-s390x.tar.gz",
                    "168d297ec910cb446d1aea878baeb85f1387209f9eb55dde68bddcd4c006dcbb"
                ],
                "windows_386": [
                    "go1.12.5.windows-386.zip",
                    "9b8cfd668c182d39f2039bbb290cd062de438c7cc48ab3f4d9a326fce3538a03"
                ],
                "windows_amd64": [
                    "go1.12.5.windows-amd64.zip",
                    "ccb694279aab39fe0e70629261f13b0307ee40d2d5e1138ed94738023ab04baa"
                ]
            }
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:sdk.bzl%_go_download_sdk",
                "attributes": {
                    "name": "go_sdk",
                    "sdks": {
                        "darwin_amd64": [
                            "go1.12.5.darwin-amd64.tar.gz",
                            "566d0b407f7d4aa5a1315988b562bbe4e9422a93ce2fbf27a664cddcb9a3e617"
                        ],
                        "freebsd_386": [
                            "go1.12.5.freebsd-386.tar.gz",
                            "b842330ad695bac9ea57d0a9d3aafaaf34921ec85702bccc2067f448e868332b"
                        ],
                        "freebsd_amd64": [
                            "go1.12.5.freebsd-amd64.tar.gz",
                            "082acae7f5d2c780521f95fd177a08aacaccc0e38042d4ef981f7d7211a27b8a"
                        ],
                        "linux_386": [
                            "go1.12.5.linux-386.tar.gz",
                            "146605e13bf337ff3aacd941a816c5d97a8fef8b5817e07fcec4540632085980"
                        ],
                        "linux_amd64": [
                            "go1.12.5.linux-amd64.tar.gz",
                            "aea86e3c73495f205929cfebba0d63f1382c8ac59be081b6351681415f4063cf"
                        ],
                        "linux_arm64": [
                            "go1.12.5.linux-arm64.tar.gz",
                            "ff09f34935cd189a4912f3f308ec83e4683c309304144eae9cf60ebc552e7cd8"
                        ],
                        "linux_arm": [
                            "go1.12.5.linux-armv6l.tar.gz",
                            "311f5e76c7cec1ec752474a61d837e474b8e750b8e3eed267911ab57c0e5da9a"
                        ],
                        "linux_ppc64le": [
                            "go1.12.5.linux-ppc64le.tar.gz",
                            "e88b2a2098bc79ad33912d1d27bc3282a7f3231b6f4672f306465bf46ff784ca"
                        ],
                        "linux_s390x": [
                            "go1.12.5.linux-s390x.tar.gz",
                            "168d297ec910cb446d1aea878baeb85f1387209f9eb55dde68bddcd4c006dcbb"
                        ],
                        "windows_386": [
                            "go1.12.5.windows-386.zip",
                            "9b8cfd668c182d39f2039bbb290cd062de438c7cc48ab3f4d9a326fce3538a03"
                        ],
                        "windows_amd64": [
                            "go1.12.5.windows-amd64.zip",
                            "ccb694279aab39fe0e70629261f13b0307ee40d2d5e1138ed94738023ab04baa"
                        ]
                    }
                },
                "output_tree_hash": "eef001942e6caa1c000d955af39f3f1eb7eeacfa7bad9f5fef87c9377a1239fe"
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
        "definition_information": "Call stack for the definition of repository 'gogo_special_proto' which is a gogo_special_proto (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/proto/gogo.bzl:34:22):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:125:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "gogo_special_proto"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//proto:gogo.bzl%gogo_special_proto",
                "attributes": {
                    "name": "gogo_special_proto"
                },
                "output_tree_hash": "f352a36f8c81aa0ab46e41070dd0d0e3a7165247b30fcc13e56d6edab7986410"
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_go_compat' which is a _go_rules_compat (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:33:20):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/compat/compat_repo.bzl:55:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:32:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "io_bazel_rules_go_compat",
            "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:compat/compat_repo.bzl%_go_rules_compat",
                "attributes": {
                    "name": "io_bazel_rules_go_compat",
                    "impl": "@io_bazel_rules_go//go/private:compat/v25.bzl"
                },
                "output_tree_hash": "e4cc1f8a56348e70afa41035703ad4cfde6b60392ddfc346193b0ea9ad06ecd1"
            }
        ]
    },
    {
        "original_rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
        "definition_information": "Call stack for the definition of repository 'io_bazel_rules_nogo' which is a go_register_nogo (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/nogo.bzl:33:20):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:229:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "io_bazel_rules_nogo",
            "nogo": "@io_bazel_rules_go//:default_nogo"
        },
        "repositories": [
            {
                "rule_class": "@io_bazel_rules_go//go/private:nogo.bzl%go_register_nogo",
                "attributes": {
                    "name": "io_bazel_rules_nogo",
                    "nogo": "@io_bazel_rules_go//:default_nogo"
                },
                "output_tree_hash": "3934c1fa667e35c1bdda975bca7059807ede9fc322e1daa480ab77939375185b"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'kafka_source' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:32:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "kafka_source",
            "urls": [
                "https://github.com/apache/kafka/archive/2.2.0-rc2.zip"
            ],
            "sha256": "ae7a1696c0a0302b43c5b21e515c37e6ecd365941f68a510a7e442eebddf39a1",
            "strip_prefix": "kafka-2.2.0-rc2/clients/src/main/resources/common/message",
            "build_file_content": "\n\nfilegroup(\n    name = \"request_protocol_files\",\n    srcs = glob([\n        \"*Request.json\",\n    ]),\n    visibility = [\"//visibility:public\"],\n)\n\nfilegroup(\n    name = \"response_protocol_files\",\n    srcs = glob([\n        \"*Response.json\",\n    ]),\n    visibility = [\"//visibility:public\"],\n)\n\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/apache/kafka/archive/2.2.0-rc2.zip"
                    ],
                    "sha256": "ae7a1696c0a0302b43c5b21e515c37e6ecd365941f68a510a7e442eebddf39a1",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "kafka-2.2.0-rc2/clients/src/main/resources/common/message",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "\n\nfilegroup(\n    name = \"request_protocol_files\",\n    srcs = glob([\n        \"*Request.json\",\n    ]),\n    visibility = [\"//visibility:public\"],\n)\n\nfilegroup(\n    name = \"response_protocol_files\",\n    srcs = glob([\n        \"*Response.json\",\n    ]),\n    visibility = [\"//visibility:public\"],\n)\n\n",
                    "workspace_file_content": "",
                    "name": "kafka_source"
                },
                "output_tree_hash": "99ff35ca07efcc711e2411bba189e10d147e5c0bb465c367a2f807dd183c2ecc"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'net_zlib' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:95:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "net_zlib",
            "urls": [
                "https://zlib.net/zlib-1.2.11.tar.gz"
            ],
            "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
            "strip_prefix": "zlib-1.2.11",
            "build_file": "@com_google_protobuf//:third_party/zlib.BUILD"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://zlib.net/zlib-1.2.11.tar.gz"
                    ],
                    "sha256": "c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zlib-1.2.11",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@com_google_protobuf//:third_party/zlib.BUILD",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "net_zlib"
                },
                "output_tree_hash": "e8aa65217c32cf01026b62e021d95b030c98cb13bc9e64b647d18bed07e24ba5"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'opencensus_proto' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:28:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "opencensus_proto",
            "urls": [
                "https://github.com/census-instrumentation/opencensus-proto/archive/5cec5ea58c3efa81fa808f2bd38ce182da9ee731.tar.gz"
            ],
            "sha256": "faeb93f293ff715b0cb530d273901c0e2e99277b9ed1c0a0326bca9ec5774ad2",
            "strip_prefix": "opencensus-proto-5cec5ea58c3efa81fa808f2bd38ce182da9ee731/src"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/census-instrumentation/opencensus-proto/archive/5cec5ea58c3efa81fa808f2bd38ce182da9ee731.tar.gz"
                    ],
                    "sha256": "faeb93f293ff715b0cb530d273901c0e2e99277b9ed1c0a0326bca9ec5774ad2",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "opencensus-proto-5cec5ea58c3efa81fa808f2bd38ce182da9ee731/src",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "opencensus_proto"
                },
                "output_tree_hash": "c8c386d9c0b0dbd738cc1c5cb9ea5518e07c70749afa8bdcaa1c00c24312e493"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_google_genproto' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:177:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_google_genproto",
            "remote": "https://github.com/google/go-genproto",
            "commit": "4f5b463f9597cbe0dd13a6a2cd4f85e788d27508",
            "shallow_since": "1551303189 -0700",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/google/go-genproto",
                    "commit": "4f5b463f9597cbe0dd13a6a2cd4f85e788d27508",
                    "shallow_since": "1551303189 -0700",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_google_genproto-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_google_genproto"
                },
                "output_tree_hash": "b3bba82b52637caa08288eaf3e032e3cbd144298f0deef5041d67b758f41df3c"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_google_grpc' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:163:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_google_grpc",
            "remote": "https://github.com/grpc/grpc-go",
            "commit": "2fdaae294f38ed9a121193c51ec99fecd3b13eb7",
            "shallow_since": "1551206709 -0800",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_google_grpc-gazelle.patch",
                "@io_bazel_rules_go//third_party:org_golang_google_grpc-crosscompile.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://github.com/grpc/grpc-go",
                    "commit": "2fdaae294f38ed9a121193c51ec99fecd3b13eb7",
                    "shallow_since": "1551206709 -0800",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_google_grpc-gazelle.patch",
                        "@io_bazel_rules_go//third_party:org_golang_google_grpc-crosscompile.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_google_grpc"
                },
                "output_tree_hash": "909700c0ea8bb33ce759c7b39be881001271ee3e53d9055cc3be077133eccf10"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_net' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:131:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_x_net",
            "remote": "https://go.googlesource.com/net",
            "commit": "16b79f2e4e95ea23b2bf9903c9809ff7b013ce85",
            "shallow_since": "1551482021 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_net-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://go.googlesource.com/net",
                    "commit": "16b79f2e4e95ea23b2bf9903c9809ff7b013ce85",
                    "shallow_since": "1551482021 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_net-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_x_net"
                },
                "output_tree_hash": "36b3b8e2f1951b727d5715782c8184f5c33798a7715a4436283a0a024a02bc70"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_sys' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:152:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_x_sys",
            "remote": "https://go.googlesource.com/sys",
            "commit": "d455e41777fca6e8a5a79e34a14b8368bc11d9ba",
            "shallow_since": "1551616002 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_sys-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://go.googlesource.com/sys",
                    "commit": "d455e41777fca6e8a5a79e34a14b8368bc11d9ba",
                    "shallow_since": "1551616002 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_sys-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_x_sys"
                },
                "output_tree_hash": "f1786abbb0018ca092cbd42fb48bf651e608d02d722ebb455caa428061d86f1e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_text' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:142:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_x_text",
            "remote": "https://go.googlesource.com/text",
            "commit": "f21a4dfb5e38f5895301dc265a8def02365cc3d0",
            "shallow_since": "1513256923 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_text-gazelle.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://go.googlesource.com/text",
                    "commit": "f21a4dfb5e38f5895301dc265a8def02365cc3d0",
                    "shallow_since": "1513256923 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_text-gazelle.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_x_text"
                },
                "output_tree_hash": "f6681ddbb201ad58669c67fd61c89cf75cab90cc272e3ae1255a732e8f13644d"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
        "definition_information": "Call stack for the definition of repository 'org_golang_x_tools' which is a git_repository (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/git.bzl:195:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:237:9\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/io_bazel_rules_go/go/private/repositories.bzl:38:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:35:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "org_golang_x_tools",
            "remote": "https://go.googlesource.com/tools",
            "commit": "589c23e65e65055d47b9ad4a99723bc389136265",
            "shallow_since": "1551386336 +0000",
            "patches": [
                "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
            ],
            "patch_args": [
                "-p1"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:git.bzl%git_repository",
                "attributes": {
                    "remote": "https://go.googlesource.com/tools",
                    "commit": "589c23e65e65055d47b9ad4a99723bc389136265",
                    "shallow_since": "1551386336 +0000",
                    "init_submodules": False,
                    "verbose": False,
                    "strip_prefix": "",
                    "patches": [
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-gazelle.patch",
                        "@io_bazel_rules_go//third_party:org_golang_x_tools-extras.patch"
                    ],
                    "patch_tool": "",
                    "patch_args": [
                        "-p1"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "name": "org_golang_x_tools"
                },
                "output_tree_hash": "951b90969912f32963ae9348341ad1f017bc0ef387105d802e839ac110a056eb"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'prometheus_metrics_model' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/envoy_http_archive.bzl:17:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/envoy_api/bazel/repositories.bzl:23:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:33:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "prometheus_metrics_model",
            "urls": [
                "https://github.com/prometheus/client_model/archive/99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c.tar.gz"
            ],
            "sha256": "783bdaf8ee0464b35ec0c8704871e1e72afa0005c3f3587f65d9d6694bf3911b",
            "strip_prefix": "client_model-99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c",
            "build_file_content": "\nload(\"@envoy_api//bazel:api_build_system.bzl\", \"api_cc_py_proto_library\")\nload(\"@io_bazel_rules_go//proto:def.bzl\", \"go_proto_library\")\n\napi_cc_py_proto_library(\n    name = \"client_model\",\n    srcs = [\n        \"metrics.proto\",\n    ],\n    visibility = [\"//visibility:public\"],\n)\n\ngo_proto_library(\n    name = \"client_model_go_proto\",\n    importpath = \"github.com/prometheus/client_model/go\",\n    proto = \":client_model\",\n    visibility = [\"//visibility:public\"],\n)\n"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://github.com/prometheus/client_model/archive/99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c.tar.gz"
                    ],
                    "sha256": "783bdaf8ee0464b35ec0c8704871e1e72afa0005c3f3587f65d9d6694bf3911b",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "client_model-99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "\nload(\"@envoy_api//bazel:api_build_system.bzl\", \"api_cc_py_proto_library\")\nload(\"@io_bazel_rules_go//proto:def.bzl\", \"go_proto_library\")\n\napi_cc_py_proto_library(\n    name = \"client_model\",\n    srcs = [\n        \"metrics.proto\",\n    ],\n    visibility = [\"//visibility:public\"],\n)\n\ngo_proto_library(\n    name = \"client_model_go_proto\",\n    importpath = \"github.com/prometheus/client_model/go\",\n    proto = \":client_model\",\n    visibility = [\"//visibility:public\"],\n)\n",
                    "workspace_file_content": "",
                    "name": "prometheus_metrics_model"
                },
                "output_tree_hash": "56bddf92d081a14aab375f400c87ef6da72f504379b254aba47dd1e93c7add67"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
        "definition_information": "Call stack for the definition of repository 'xctestrunner' which is a http_file (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:383:13):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/build_bazel_rules_apple/apple/repositories.bzl:84:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/build_bazel_rules_apple/apple/repositories.bzl:127:5\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/com_github_grpc_grpc/bazel/grpc_extra_deps.bzl:38:5\n - /home/crepric/AirQuality-Monitor/controller/WORKSPACE:95:1",
        "original_attributes": {
            "name": "xctestrunner",
            "executable": True,
            "sha256": "7c088842ebd4f47297a167e3f3df77eab54a8651f6b6d87e2c275a9e6c8adfe5",
            "urls": [
                "https://github.com/google/xctestrunner/releases/download/0.2.9/ios_test_runner.par"
            ]
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_file",
                "attributes": {
                    "executable": True,
                    "downloaded_file_path": "downloaded",
                    "sha256": "7c088842ebd4f47297a167e3f3df77eab54a8651f6b6d87e2c275a9e6c8adfe5",
                    "canonical_id": "",
                    "urls": [
                        "https://github.com/google/xctestrunner/releases/download/0.2.9/ios_test_runner.par"
                    ],
                    "netrc": "",
                    "name": "xctestrunner"
                },
                "output_tree_hash": "21f095d3745e8a9c24c034f3cc369fdf1d7473630cf8be8a1dbfef1eb2a3d097"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_coverage_tools' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /DEFAULT.WORKSPACE.SUFFIX:11:1",
        "original_attributes": {
            "name": "remote_coverage_tools",
            "urls": [
                "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v2.1.zip"
            ],
            "sha256": "96ac6bc9b9fbc67b532bcae562da1642409791e6a4b8e522f04946ee5cc3ff8e"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_coverage_output_generator/releases/coverage_output_generator-v2.1.zip"
                    ],
                    "sha256": "96ac6bc9b9fbc67b532bcae562da1642409791e6a4b8e522f04946ee5cc3ff8e",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_coverage_tools"
                },
                "output_tree_hash": "a021aeb7dfe67e7a2bb584ae6cfaaff48068b302c3b972d0d5a2cb068640531b"
            }
        ]
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "bootclasspath",
            "actual": "@local_jdk//:bootclasspath"
        },
        "native": "bind(name = \"bootclasspath\", actual = \"@local_jdk//:bootclasspath\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extclasspath",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extclasspath\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "extdir",
            "actual": "@local_jdk//:extdir"
        },
        "native": "bind(name = \"extdir\", actual = \"@local_jdk//:extdir\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jar",
            "actual": "@local_jdk//:jar"
        },
        "native": "bind(name = \"jar\", actual = \"@local_jdk//:jar\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "java",
            "actual": "@local_jdk//:java"
        },
        "native": "bind(name = \"java\", actual = \"@local_jdk//:java\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "javac",
            "actual": "@local_jdk//:javac"
        },
        "native": "bind(name = \"javac\", actual = \"@local_jdk//:javac\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jdk-default",
            "actual": "@local_jdk//:jdk"
        },
        "native": "bind(name = \"jdk-default\", actual = \"@local_jdk//:jdk\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_header",
            "actual": "@local_jdk//:jni_header"
        },
        "native": "bind(name = \"jni_header\", actual = \"@local_jdk//:jni_header\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-darwin",
            "actual": "@local_jdk//:jni_md_header-darwin"
        },
        "native": "bind(name = \"jni_md_header-darwin\", actual = \"@local_jdk//:jni_md_header-darwin\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-freebsd",
            "actual": "@local_jdk//:jni_md_header-freebsd"
        },
        "native": "bind(name = \"jni_md_header-freebsd\", actual = \"@local_jdk//:jni_md_header-freebsd\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-linux",
            "actual": "@local_jdk//:jni_md_header-linux"
        },
        "native": "bind(name = \"jni_md_header-linux\", actual = \"@local_jdk//:jni_md_header-linux\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jni_md_header-openbsd",
            "actual": "@local_jdk//:jni_md_header-openbsd"
        },
        "native": "bind(name = \"jni_md_header-openbsd\", actual = \"@local_jdk//:jni_md_header-openbsd\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "bind",
        "original_attributes": {
            "name": "jre-default",
            "actual": "@local_jdk//:jre"
        },
        "native": "bind(name = \"jre-default\", actual = \"@local_jdk//:jre\")"
    },
    {
        "original_rule_class": "new_local_repository",
        "original_attributes": {
            "name": "local_jdk",
            "path": "/usr/lib/jvm/java-11-openjdk-armhf",
            "build_file": "/home/crepric/.cache/bazel/_bazel_crepric/install/81ca4d6a39368c1feae1f1aa49842939/jdk.BUILD"
        },
        "native": "new_local_repository(name = \"local_jdk\", path = \"/usr/lib/jvm/java-11-openjdk-armhf\", build_file = __embedded_dir__ + \"/\" + \"jdk.BUILD\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_darwin' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:305:1",
        "original_attributes": {
            "name": "remote_java_tools_darwin",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_darwin-v7.0.zip",
                "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_darwin-v7.0.zip"
            ],
            "sha256": "373a4226906ae9ba908550da16e133c4cd1f01b8973af82b9a2eb6903cb4d645"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_darwin-v7.0.zip",
                        "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_darwin-v7.0.zip"
                    ],
                    "sha256": "373a4226906ae9ba908550da16e133c4cd1f01b8973af82b9a2eb6903cb4d645",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_darwin"
                },
                "output_tree_hash": "6a1274bb378cd31f3c01309fe031e1167eded56f10a1663e33319b1d09eb2697"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_linux' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:283:1",
        "original_attributes": {
            "name": "remote_java_tools_linux",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_linux-v7.0.zip",
                "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_linux-v7.0.zip"
            ],
            "sha256": "3ff465e82954a70f49982610dd63f6f651beaa83c707dd637870b0e41cdcd2f0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_linux-v7.0.zip",
                        "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_linux-v7.0.zip"
                    ],
                    "sha256": "3ff465e82954a70f49982610dd63f6f651beaa83c707dd637870b0e41cdcd2f0",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_linux"
                },
                "output_tree_hash": "078d6939f452c18f7e157e36ced2fc741f87bb41459d15d2141cb1e543227a71"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remote_java_tools_windows' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:294:1",
        "original_attributes": {
            "name": "remote_java_tools_windows",
            "urls": [
                "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_windows-v7.0.zip",
                "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_windows-v7.0.zip"
            ],
            "sha256": "11d90a147919e74d11870cdd58c4ee5de3062c08d11b16aa72d3f3bbfa9497a0"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/bazel_java_tools/releases/javac11/v7.0/java_tools_javac11_windows-v7.0.zip",
                        "https://github.com/bazelbuild/java_tools/releases/download/javac11-v7.0/java_tools_javac11_windows-v7.0.zip"
                    ],
                    "sha256": "11d90a147919e74d11870cdd58c4ee5de3062c08d11b16aa72d3f3bbfa9497a0",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remote_java_tools_windows"
                },
                "output_tree_hash": "e19aaaf567a4ba900cd3fc1ae86e150f3328ee255d799e9d8705394fcd09de36"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:183:1",
        "original_attributes": {
            "name": "remotejdk10_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "57fad3602e74c79587901d6966d3b54ef32cb811829a2552163185d5064fe9b5",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux"
                },
                "output_tree_hash": "b714a0289904226bbe7719bdca945c8f26fdf78e63773b6fe960249e912f7044"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_linux_aarch64' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:221:1",
        "original_attributes": {
            "name": "remotejdk10_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
            ],
            "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
            "strip_prefix": "jdk10-server-release-1804",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk10-server-release-1804.tar.xz"
                    ],
                    "sha256": "b7098b7aaf6ee1ffd4a2d0371a0be26c5a5c87f6aebbe46fe9a92c90583a84be",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "jdk10-server-release-1804",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_linux_aarch64"
                },
                "output_tree_hash": "869e1b005aeb6cecb1ff8e2292ef31ddfce995db7e9883a1f6f8be14801acf47"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_macos' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:195:1",
        "original_attributes": {
            "name": "remotejdk10_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "e669c9a897413d855b550b4e39d79614392e6fb96f494e8ef99a34297d9d85d3",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_macos"
                },
                "output_tree_hash": "fc0d5838a0ed6e018a6a22b33dd011a8941e65990a6be3d2362dffda8733d40e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk10_win' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:207:1",
        "original_attributes": {
            "name": "remotejdk10_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
            ],
            "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
            "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu10.2+3-jdk10.0.1/zulu10.2+3-jdk10.0.1-win_x64-allmodules.zip"
                    ],
                    "sha256": "c39e7700a8d41794d60985df5a20352435196e78ecbc6a2b30df7be8637bffd5",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu10.2+3-jdk10.0.1-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk10_win"
                },
                "output_tree_hash": "756c25322349559a735471501683cbe713dc2f8b8f8309d22d5c14f5318e4bd0"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_linux' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:235:1",
        "original_attributes": {
            "name": "remotejdk11_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
            ],
            "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-linux_x64.tar.gz"
                    ],
                    "sha256": "232b1c3511f0d26e92582b7c3cc363be7ac633e371854ca2f2e9f2b50eb72a75",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-linux_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_linux"
                },
                "output_tree_hash": "09b1584f92b66c75bf10c76c016c158925bed0453f77456ca78d056a71cd605e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_linux_aarch64' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:247:1",
        "original_attributes": {
            "name": "remotejdk11_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.31.15-ca-jdk11.0.3/zulu11.31.15-ca-jdk11.0.3-linux_aarch64.tar.gz"
            ],
            "sha256": "3b0d91611b1bdc4d409afcf9eab4f0e7f4ae09f88fc01bd9f2b48954882ae69b",
            "strip_prefix": "zulu11.31.15-ca-jdk11.0.3-linux_aarch64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.31.15-ca-jdk11.0.3/zulu11.31.15-ca-jdk11.0.3-linux_aarch64.tar.gz"
                    ],
                    "sha256": "3b0d91611b1bdc4d409afcf9eab4f0e7f4ae09f88fc01bd9f2b48954882ae69b",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.31.15-ca-jdk11.0.3-linux_aarch64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_linux_aarch64"
                },
                "output_tree_hash": "3229e1f66676f7029a1da630943c34cffa199fa13639c9a9cd88d6cb31fe135a"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_macos' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:259:1",
        "original_attributes": {
            "name": "remotejdk11_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
            ],
            "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-macosx_x64.tar.gz"
                    ],
                    "sha256": "1edf366ee821e5db8e348152fcb337b28dfd6bf0f97943c270dcc6747cedb6cb",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-macosx_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_macos"
                },
                "output_tree_hash": "609e6c7e3ef398bdb58f9266169bb12dafc585fef591317b545c08070bf56ca1"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk11_win' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:271:1",
        "original_attributes": {
            "name": "remotejdk11_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
            ],
            "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
            "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu11.2.3-jdk11.0.1/zulu11.2.3-jdk11.0.1-win_x64.zip"
                    ],
                    "sha256": "8e1e2b8347de6746f3fd1538840dd643201533ab113abc4ed93678e342d28aa3",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu11.2.3-jdk11.0.1-win_x64",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk11_win"
                },
                "output_tree_hash": "90ff0b507bbec499e9bbc867f6456a2901e73cacb1003a90adbad810a49ba412"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:131:1",
        "original_attributes": {
            "name": "remotejdk_linux",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
            ],
            "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules.tar.gz"
                    ],
                    "sha256": "f27cb933de4f9e7fe9a703486cf44c84bc8e9f138be0c270c9e5716a32367e87",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-linux_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux"
                },
                "output_tree_hash": "f0797dd509408aec532df0d8f93d4beb15166267fc4f254cc6e1cec7e75334a7"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_linux_aarch64' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:169:1",
        "original_attributes": {
            "name": "remotejdk_linux_aarch64",
            "urls": [
                "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
            ],
            "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
            "strip_prefix": "jdk9-server-release-1708",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz",
                        "http://openjdk.linaro.org/releases/jdk9-server-release-1708.tar.xz"
                    ],
                    "sha256": "72e7843902b0395e2d30e1e9ad2a5f05f36a4bc62529828bcbc698d54aec6022",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "jdk9-server-release-1708",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_linux_aarch64"
                },
                "output_tree_hash": "ecfef58ce3c153032fae0dec5884083464ccb10f8fc7ecd0711da02c0715969e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_macos' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:143:1",
        "original_attributes": {
            "name": "remotejdk_macos",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
            ],
            "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules.tar.gz"
                    ],
                    "sha256": "404e7058ff91f956612f47705efbee8e175a38b505fb1b52d8c1ea98718683de",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-macosx_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_macos"
                },
                "output_tree_hash": "b6328273f948385883454edd5e67c8888a70b93dd3674c8c119e1722167108b0"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'remotejdk_win' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:155:1",
        "original_attributes": {
            "name": "remotejdk_win",
            "urls": [
                "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
            ],
            "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
            "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
            "build_file": "@local_jdk//:BUILD.bazel"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/openjdk/azul-zulu-9.0.7.1-jdk9.0.7/zulu9.0.7.1-jdk9.0.7-win_x64-allmodules.zip"
                    ],
                    "sha256": "e738829017f107e7a7cd5069db979398ec3c3f03ef56122f89ba38e7374f63ed",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "zulu9.0.7.1-jdk9.0.7-win_x64-allmodules",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file": "@local_jdk//:BUILD.bazel",
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "remotejdk_win"
                },
                "output_tree_hash": "f1855394faac6e484817b7a7da4745e7bbfca775f18ee2fdc9ef6e65f6cac907"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'rules_java' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:315:1",
        "original_attributes": {
            "name": "rules_java",
            "urls": [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_java/archive/7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip",
                "https://github.com/bazelbuild/rules_java/archive/7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip"
            ],
            "sha256": "bc81f1ba47ef5cc68ad32225c3d0e70b8c6f6077663835438da8d5733f917598",
            "strip_prefix": "rules_java-7cf3cefd652008d0a64a419c34c13bdca6c8f178"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/github.com/bazelbuild/rules_java/archive/7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip",
                        "https://github.com/bazelbuild/rules_java/archive/7cf3cefd652008d0a64a419c34c13bdca6c8f178.zip"
                    ],
                    "sha256": "bc81f1ba47ef5cc68ad32225c3d0e70b8c6f6077663835438da8d5733f917598",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "rules_java-7cf3cefd652008d0a64a419c34c13bdca6c8f178",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "rules_java"
                },
                "output_tree_hash": "00a0f1231dacff0b0cea3886200e0158c67a3600068275da14120f5434f83b5e"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'rules_proto' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/utils.bzl:201:9\n - /DEFAULT.WORKSPACE.SUFFIX:339:1",
        "original_attributes": {
            "name": "rules_proto",
            "urls": [
                "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
                "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz"
            ],
            "sha256": "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
            "strip_prefix": "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "",
                    "urls": [
                        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
                        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz"
                    ],
                    "sha256": "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "rules_proto"
                },
                "output_tree_hash": "4f74a84e9684fc73c48656a9a6c60bdfaed2cabdf5dc7d21da7ae2ee78c7efa3"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
        "definition_information": "Call stack for the definition of repository 'android_tools' which is a http_archive (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/build_defs/repo/http.bzl:296:16):\n - <builtin>\n - /DEFAULT.WORKSPACE.SUFFIX:371:1",
        "original_attributes": {
            "name": "android_tools",
            "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.14.tar.gz",
            "sha256": "a3a951838448483e7af25afd10671b266cc6283104b4a2a427d31cac12cf0912"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/build_defs/repo:http.bzl%http_archive",
                "attributes": {
                    "url": "https://mirror.bazel.build/bazel_android_tools/android_tools_pkg-0.14.tar.gz",
                    "urls": [],
                    "sha256": "a3a951838448483e7af25afd10671b266cc6283104b4a2a427d31cac12cf0912",
                    "netrc": "",
                    "canonical_id": "",
                    "strip_prefix": "",
                    "type": "",
                    "patches": [],
                    "patch_tool": "",
                    "patch_args": [
                        "-p0"
                    ],
                    "patch_cmds": [],
                    "patch_cmds_win": [],
                    "build_file_content": "",
                    "workspace_file_content": "",
                    "name": "android_tools"
                },
                "output_tree_hash": "e826feef6e130955e1f725dcc37700c4f732007f523137dcb84351a57c9e7685"
            }
        ]
    },
    {
        "original_rule_class": "local_config_platform",
        "original_attributes": {
            "name": "local_config_platform"
        },
        "native": "local_config_platform(name = 'local_config_platform')"
    },
    {
        "original_rule_class": "local_repository",
        "original_attributes": {
            "name": "platforms",
            "path": "/home/crepric/.cache/bazel/_bazel_crepric/install/81ca4d6a39368c1feae1f1aa49842939/platforms"
        },
        "native": "local_repository(name = \"platforms\", path = __embedded_dir__ + \"/\" + \"platforms\")"
    },
    {
        "original_rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_xcode' which is a xcode_autoconf (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/osx/xcode_configure.bzl:265:18):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/osx/xcode_configure.bzl:276:5\n - /DEFAULT.WORKSPACE.SUFFIX:414:1",
        "original_attributes": {
            "name": "local_config_xcode",
            "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/osx:xcode_configure.bzl%xcode_autoconf",
                "attributes": {
                    "name": "local_config_xcode",
                    "xcode_locator": "@bazel_tools//tools/osx:xcode_locator.m"
                },
                "output_tree_hash": "ec026961157bb71cf68d1b568815ad68147ed16f318161bc0da40f6f3d7d79fd"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
        "definition_information": "Call stack for the definition of repository 'local_config_sh' which is a sh_config (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/sh/sh_configure.bzl:72:13):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/sh/sh_configure.bzl:83:5\n - /DEFAULT.WORKSPACE.SUFFIX:417:1",
        "original_attributes": {
            "name": "local_config_sh"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/sh:sh_configure.bzl%sh_config",
                "attributes": {
                    "name": "local_config_sh"
                },
                "output_tree_hash": "e36855460b514225eac75f4abe2cb992c5455b7077a9028d213d269d11490744"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
        "definition_information": "Call stack for the definition of repository 'local_config_cc' which is a cc_autoconf (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/cpp/cc_configure.bzl:143:15):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/cpp/cc_configure.bzl:179:5\n - /DEFAULT.WORKSPACE.SUFFIX:421:1",
        "original_attributes": {
            "name": "local_config_cc"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf",
                "attributes": {
                    "name": "local_config_cc"
                },
                "output_tree_hash": "be48e347d7b979cf238a2ac0e6c0f68833c1ebb02c17b12dfb1090de5a150a44"
            }
        ]
    },
    {
        "original_rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
        "definition_information": "Call stack for the definition of repository 'local_config_cc_toolchains' which is a cc_autoconf_toolchains (rule definition at /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/cpp/cc_configure.bzl:79:26):\n - <builtin>\n - /home/crepric/.cache/bazel/_bazel_crepric/5368493a4c40f150adc07b819ac57dcd/external/bazel_tools/tools/cpp/cc_configure.bzl:178:5\n - /DEFAULT.WORKSPACE.SUFFIX:421:1",
        "original_attributes": {
            "name": "local_config_cc_toolchains"
        },
        "repositories": [
            {
                "rule_class": "@bazel_tools//tools/cpp:cc_configure.bzl%cc_autoconf_toolchains",
                "attributes": {
                    "name": "local_config_cc_toolchains"
                },
                "output_tree_hash": "61a9e1a941a26a6303dc7136758e087b1e9b4f3053b0ea141822944fb936c40a"
            }
        ]
    },
    {
        "original_rule_class": "register_toolchains",
        "original_attributes": {
            "name": "//external/register_toolchains",
            "*args": [
                "@go_sdk//:go_android_386",
                "@go_sdk//:go_android_amd64",
                "@go_sdk//:go_android_arm",
                "@go_sdk//:go_android_arm64",
                "@go_sdk//:go_darwin_386",
                "@go_sdk//:go_darwin_amd64",
                "@go_sdk//:go_darwin_arm",
                "@go_sdk//:go_darwin_arm64",
                "@go_sdk//:go_dragonfly_amd64",
                "@go_sdk//:go_freebsd_386",
                "@go_sdk//:go_freebsd_amd64",
                "@go_sdk//:go_freebsd_arm",
                "@go_sdk//:go_linux_386",
                "@go_sdk//:go_linux_amd64",
                "@go_sdk//:go_linux_arm",
                "@go_sdk//:go_linux_arm64",
                "@go_sdk//:go_linux_mips",
                "@go_sdk//:go_linux_mips64",
                "@go_sdk//:go_linux_mips64le",
                "@go_sdk//:go_linux_mipsle",
                "@go_sdk//:go_linux_ppc64",
                "@go_sdk//:go_linux_ppc64le",
                "@go_sdk//:go_linux_s390x",
                "@go_sdk//:go_nacl_386",
                "@go_sdk//:go_nacl_amd64p32",
                "@go_sdk//:go_nacl_arm",
                "@go_sdk//:go_netbsd_386",
                "@go_sdk//:go_netbsd_amd64",
                "@go_sdk//:go_netbsd_arm",
                "@go_sdk//:go_openbsd_386",
                "@go_sdk//:go_openbsd_amd64",
                "@go_sdk//:go_openbsd_arm",
                "@go_sdk//:go_plan9_386",
                "@go_sdk//:go_plan9_amd64",
                "@go_sdk//:go_plan9_arm",
                "@go_sdk//:go_solaris_amd64",
                "@go_sdk//:go_windows_386",
                "@go_sdk//:go_windows_amd64",
                "@go_sdk//:go_js_wasm",
                "@bazel_tools//tools/jdk:all",
                "@bazel_tools//tools/python:autodetecting_toolchain",
                "@local_config_sh//:local_sh_toolchain",
                "@local_config_cc_toolchains//:all"
            ]
        },
        "native": "register_toolchains(\"@go_sdk//:go_android_386\", \"@go_sdk//:go_android_amd64\", \"@go_sdk//:go_android_arm\", \"@go_sdk//:go_android_arm64\", \"@go_sdk//:go_darwin_386\", \"@go_sdk//:go_darwin_amd64\", \"@go_sdk//:go_darwin_arm\", \"@go_sdk//:go_darwin_arm64\", \"@go_sdk//:go_dragonfly_amd64\", \"@go_sdk//:go_freebsd_386\", \"@go_sdk//:go_freebsd_amd64\", \"@go_sdk//:go_freebsd_arm\", \"@go_sdk//:go_linux_386\", \"@go_sdk//:go_linux_amd64\", \"@go_sdk//:go_linux_arm\", \"@go_sdk//:go_linux_arm64\", \"@go_sdk//:go_linux_mips\", \"@go_sdk//:go_linux_mips64\", \"@go_sdk//:go_linux_mips64le\", \"@go_sdk//:go_linux_mipsle\", \"@go_sdk//:go_linux_ppc64\", \"@go_sdk//:go_linux_ppc64le\", \"@go_sdk//:go_linux_s390x\", \"@go_sdk//:go_nacl_386\", \"@go_sdk//:go_nacl_amd64p32\", \"@go_sdk//:go_nacl_arm\", \"@go_sdk//:go_netbsd_386\", \"@go_sdk//:go_netbsd_amd64\", \"@go_sdk//:go_netbsd_arm\", \"@go_sdk//:go_openbsd_386\", \"@go_sdk//:go_openbsd_amd64\", \"@go_sdk//:go_openbsd_arm\", \"@go_sdk//:go_plan9_386\", \"@go_sdk//:go_plan9_amd64\", \"@go_sdk//:go_plan9_arm\", \"@go_sdk//:go_solaris_amd64\", \"@go_sdk//:go_windows_386\", \"@go_sdk//:go_windows_amd64\", \"@go_sdk//:go_js_wasm\", \"@bazel_tools//tools/jdk:all\", \"@bazel_tools//tools/python:autodetecting_toolchain\", \"@local_config_sh//:local_sh_toolchain\", \"@local_config_cc_toolchains//:all\")"
    },
    {
        "original_rule_class": "register_execution_platforms",
        "original_attributes": {
            "name": "//external/register_execution_platforms",
            "*args": []
        },
        "native": "register_execution_platforms()"
    }
]