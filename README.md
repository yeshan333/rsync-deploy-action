# rsync deploy action

Synchronize files to the remote server using the rsync and SSH private key.

## Inputs

### `ssh_login_username`

**Required** SSH login username.

### `remote_server_ip`

**Required** remote server ip.

### `ssh_port`

**Required** remote server SSH port, default 22.

### `ssh_private_key`

**Required** login user SSH private key.

### `source_path`

**Required** the source storage path of the synchronous files.

### `destination_path`

**Required** the destination storage path of the synchronous files.

### `ssh_args`

ssh args. see more `ssh -h`.

### `rsync_args`

rsync args. see more `rsync -h`.

## Outputs

### `start_time`

Start time of synchronization.

### `end_time`

End time of synchronization.

## Example usage