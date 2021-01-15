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

links: https://github.com/yeshan333/github-actions-test-repo

```yml
name: rsync-deploy-action tester

on:
  push:
    branches: [main]

jobs:
  hello_world_rsync_deploy:
    runs-on: ubuntu-latest
    name: A job to test rsync-deploy-action
    steps:
      - name: Checkout repository
        uses: actions/checkout@main
      - name: Modify files permissions
        run: |
          chmod 777 -R ./sync_files
          ls -l
      - name: Tester
        uses: yeshan333/rsync-deploy-action@main
        id: rsync-deploy-action
        with:
          ssh_login_username: ${{ secrets.SSH_LOGIN_USERNAME }}
          remote_server_ip: ${{ secrets.REMOTE_SERVER_IP }}
          ssh_port: ${{ secrets.SSH_PORT }}
          ssh_private_key: ${{ secrets.SSH_PRIVATE_KEY }}
          source_path: ./sync_files/*
          destination_path: ~/shan333.cn
```