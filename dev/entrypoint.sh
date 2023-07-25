#!/bin/bash

# enable conda for this shell
. /opt/conda/etc/profile.d/conda.sh

# init conda
conda init
# activate the environment
conda activate code_develoment_env

# exec the cmd/command in this process, making it pid 1
exec "$@"

