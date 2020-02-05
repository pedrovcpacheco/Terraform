# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "name"
  tenant_name = "projeto"
  password    = var.senha
  auth_url    = var.auth_url
  version     = "~> 1.25"
}
