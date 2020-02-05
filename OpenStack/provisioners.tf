resource "openstack_blockstorage_volume_v2" "vol_name" {
  name = "vol_name"
  size = 1
}
resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.name.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.vol_name.id}"
            
  connection {
   type     = "ssh"
   user     = "${var.user}"
   private_key = "${file(var.ssh_key_private)}"
   host     = "${openstack_networking_floatingip_v2.floatip_1.address}"
   }

provisioner "file" {
    source      = "format.sh"
    destination = "/tmp/format.sh"
}
provisioner "remote-exec" {
  inline = [
    "sudo chmod +x /tmp/format.sh",
    "sudo sh /tmp/format.sh",
  ]
   }
provisioner "local-exec" {
  command =  <<EOT
  sleep 10
  echo ${openstack_networking_floatingip_v2.floatip_1.address} ansible_ssh_private_key_file=${var.ssh_key_private} ansible_user=${var.user} ansible_python_interpreter=auto_legacy_silent >> hosts
  ANSIBLE_HOST_KEY_CHECKING=False sudo ansible-playbook -i hosts ansible-services.yml --limit '${openstack_networking_floatingip_v2.floatip_1.address}'  -vv
  EOT
  }
}

