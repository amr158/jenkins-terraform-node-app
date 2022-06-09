cd terraform
bastion_ip=$(terraform output --raw bastion1-ip)
private_ip=$(terraform output --raw private-ip)
cat << EOF > ~/.ssh/config
Host application
    HostName ${private_ip}
    ProxyCommand ssh -W %h:%p bastion
    user  ubuntu
    IdentityFile ~/.ssh/private_key.pem

Host bastion
    HostName ${bastion_ip}
    User ubuntu
    IdentityFile ~/.ssh/private_key.pem
EOF