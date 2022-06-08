resource "tls_private_key" "instance" {
  algorithm = "RSA"
}

resource "aws_key_pair" "instance" {
  key_name   = "${var.name}-amr-keypair"
  public_key = tls_private_key.instance.public_key_openssh
  tags = {
    Name = "${var.name}-test-keypair"
  }
}

resource "local_file" "private_key" {
  depends_on = [
    tls_private_key.instance,
  ]
  content  = tls_private_key.instance.private_key_pem
  filename = "key-pair.pem"

}