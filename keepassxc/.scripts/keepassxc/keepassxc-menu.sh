#!/usr/bin/bash

DATABASE="${HOME}/Nextcloud/KeePass/Passwords.kdbx"

password=$(bemenu -x indicator -p "KeepassXC Passphrase" < /dev/null)

echo "${password}" | keepassxc-cli clip -q "${DATABASE}" "$(echo "${password}" | keepassxc-cli ls -Rq "${DATABASE}" | bemenu -p "KeepassXC Database" | xargs)"
