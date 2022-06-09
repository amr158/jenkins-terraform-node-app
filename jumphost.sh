cat << EOF > ~/.ssh/config
Host application
    HostName ${private_ip}
    ProxyCommand ssh -W %h:%p ${bastion_ip}
    user  ubuntu
    IdentityFile ~/.ssh/private_key.pem

Host bastion
    HostName ${bastion_ip}
    User ubuntu
    IdentityFile ~/.ssh/private_key.pem
EOF