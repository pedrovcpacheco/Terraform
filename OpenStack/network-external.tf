
# Create Floating IP
resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "external_network"
}

# Associate Floating IP with instance and provision with local-exec/ansible
resource "openstack_compute_floatingip_associate_v2" "floatip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.name.id}"
 }
