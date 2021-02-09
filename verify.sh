#!/bin/bash

username=`head -1 $1`
password=`tail -1 $1`

if [[ -z $username || -z $password ]]; then
    echo "Empty username or password"
    exit 1
fi

users=`cat /etc/openvpn/auth/users.pass`
for user in $users; do
    if [[ "$user" = "$username:$password" ]]; then
        exit 0
    fi
done

echo "User $username not found"
exit 1
