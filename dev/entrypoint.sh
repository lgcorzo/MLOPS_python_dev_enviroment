#!/bin/bash

# enable conda for this shell
. /opt/conda/etc/profile.d/conda.sh

# init conda
conda init
# activate the environment
conda activate code_develoment_env

# Now start the Angular development server
ng serve --host 0.0.0.0

# exec the cmd/command in this process, making it pid 1
exec "$@"

