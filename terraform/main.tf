module "network" {
    source = "./Network"
    name=var.name
    vpc_cidr = var.vpc_cidr
    public_subnet_1_cidr = var.public_subnet_1_cidr
    private_Subnet_1_cidr = var.private_Subnet_1_cidr
    region = var.region
}