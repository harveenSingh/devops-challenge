output "ec2_instance_name" {
    value = module.ecomp-server.instance.tags
}

output "ec2_public_ip" {
    value = module.ecomp-server.instance.public_ip
}
