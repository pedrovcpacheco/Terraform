# Create an instance
resource "openstack_compute_instance_v2" "name" {
  name            = "name"
  image_id        = "491c1e84-926f-478b-b341-782a8005b912"
  flavor_id       = "83dc0161-5459-40ac-9e38-331212b0c524"
  key_pair        = var.key_pair
  security_groups = ["default"]
  network {
    name = "network_private_portalsemiarido"
  }
 }

