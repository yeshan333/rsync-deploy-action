#!/bin/sh -l

# $1: ssh_login_username
# $2: remote_server_ip
# $3: ssh_port
# $4: ssh_private_key
# $5: source_path
# $6: destination_path
# $7: ssh_args
# $8: rsync_args

set -euo pipefail

SSH_PRIVATE_KEY_FILE = './id_rsa'

echo "Saving private key......"

printf "%s" "$4" > $SSH_PRIVATE_KEY_FILE

echo "Done"

chmod 600 $SSH_PRIVATE_KEY_FILE

SSH_COMMAND = "ssh -p $3 -i $SSH_PRIVATE_KEY_FILE $7"

start_time=$(date)

echo "Start time of synchronization -> ::set-output name=end_time::$end_time"

rsync -e "$SSH_COMMAND" $8 -av $5 $1@$2:$6

end_time=$(date)

echo "End time of synchronization -> ::set-output name=end_time::$end_time"