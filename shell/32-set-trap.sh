#!/bin/bash

set -euo pipefail

trap 'echo "There is an error $LINENO and the command used $BASH_COMMAND"' ERR

echo "Set and trap command"
pwd
ls -la

mkdirksbfin
echo "Learning shell script"
