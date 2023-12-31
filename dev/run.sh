#!/bin/bash

echo "init conda..."
# enable conda for this shell
. /opt/conda/etc/profile.d/conda.sh
# init conda
conda init

# Now start the Angular development server
# ng new frontend
# cd frontend
# ng add @angular/material @angular/cdk
# ng serve --host 0.0.0.0

# exec the cmd/command in this process, making it pid 1
exec "$@"

