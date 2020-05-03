resource "null_resource" "remote-exec" {   

count = 1
  
connection {
   type     = "ssh"
   user     = "${var.user}"
   private_key = "${file(var.ssh_key_private)}"
   host     =  aws_eip.ip[0].public_ip
   timeout = "30m"

   }

provisioner "file" {
    source      = "Ansible-roles"
    destination = "$PWD/Ansible-roles"
}

provisioner "remote-exec" {
  inline = [
    "echo sleeping 45s to make sure server has been booted",
    "sleep 45",
    "sudo apt-get install software-properties-common",
    "sudo apt-add-repository ppa:ansible/ansible -y",
    "sudo apt-get update",
    "sleep 30",
    "apt-get update",
    "sudo apt-get install ansible -y",
  ]
   }

provisioner "remote-exec" {
  inline = [
    "sleep 30",
    "sudo ansible-playbook  $PWD/Ansible-roles/ansible-services.yml",
  ]
   }
}


