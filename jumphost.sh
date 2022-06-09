bastion_ip=`terraform output -json bastion1-ip | tr -d '"'`
private_ip=`terraform output -json private-ip | tr -d '"'`

cat << EOF > ~/.ssh/config
Host ${private_ip}
    ProxyCommand ssh -W %h:%p ${bastion_ip}
    user  ubuntu
    IdentityFile ~/.ssh/private_key.pem

Host ${bastion_ip}
  User ubuntu
  IdentityFile ~/.ssh/private_key.pem
EOF