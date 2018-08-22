#!/bin/bash

set -e

green="\x1b[0;32m"
yellow="\x1b[1;33m"
red="\x1b[0;31m"
reset="\x1b[0m"

echo_green() {
	echo -e $green"[+] "$1$reset
}

echo_yellow() {
	echo -e $yellow"[*] "$1$reset
}

echo_red() {
	echo -e $red"[!] "$1$reset
}

printf "> project name: "
read project_name

echo_green "create ${project_name}..."
mkdir $project_name

### make project folder structure ###
cd $project_name
echo_green "create include, src, build, docs, tools, tests..."
mkdir \
	include \
	src \
	build \
	docs \
	tools \
	tests

### make files ###
echo_green "create files CMakeLists.txt, README.md, .gitignore, run script..."
touch "CMakeLists.txt" "README.md" ".gitignore run"

printf "> name of main c file: "
read main_file_name

echo_green "create main file..."
touch src/"${main_file_name}.c"

### write content to files ###

# CMakeLists.txt
echo_green "redefine CMakeLists.txt..."
minimum_cmake_version="2.8.11"
cmake_src="cmake_minimum_required(VERSION ${minimum_cmake_version})\nproject(${project_name})\n\n# global vars\nset(CMAKE_BINARY_DIR \${CMAKE_SOURCE_DIR}/build)\nset(EXECUTABLE_OUTPUT_PATH \${CMAKE_BINARY_DIR})\n\n# attach debugging symbols\n# set(CMAKE_BUILD_TYPE RelWithDebInfo)\n\n# custom\nset(SOURCE_DIR \${CMAKE_SOURCE_DIR}/src)\n\ninclude_directories(\${SOURCE_DIR})\n\nadd_executable(\n
    \t${main_file_name}\n\t\t\${SOURCE_DIR}/${main_file_name}.c\n)"
echo -e $cmake_src > "CMakeLists.txt"

# README.md
echo_green "redefine README.md..."
readme_src="# ${project_name}"
echo -e $readme_src > "README.md"

# gitignore
echo_green "redefine .gitignore..."
gitignore_src="*.swp\nbuild/*\nCMakeCache.txt\nCMakeFiles\nCMakeScripts\nTesting\nMakefile\ncmake_install.cmake\ninstall_manifest.txt\ncompile_commands.json\nCTestTestfile.cmake"
echo -e $gitignore_src > ".gitignore"

# <main>.c
echo_green "redefine main file..."
# main_src="/*\n * main\n */\n\n#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, const char *argv[]) {\n\t//...\n\treturn EXIT_SUCCESS;\n}" -> bug
main_src="// ${main_file_name}.c\n\n#include <stdio.h>\n#include <stdlib.h>\n\nint main(int argc, const char *argv[]) {\n\t// ...\n\n\treturn EXIT_SUCCESS;\n}"
echo -e $main_src > src/"${main_file_name}.c"

# run script
echo_green "redefine run script..."
run_script_src="#!/bin/bash\n\nif [ \$# -eq 0 ]\nthen\n\tclear && cmake . && make && clear && ./build/${main_file_name}\nelse\n\tclear && cmake . && make && clear && \"./build/\${1}\"\nfi\n\nexit 0"
echo -e $run_script_src > "run"
chmod +x run

### done ###
echo_green "done"
exit 0
