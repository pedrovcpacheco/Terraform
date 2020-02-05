
output "ip" {
  value = openstack_networking_floatingip_v2.floatip_1.address
}