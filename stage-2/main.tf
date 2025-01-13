terraform {
  required_providers {
    virtualbox = {
      source  = "danielchristian/virtualbox"
      version = "2.0.0"  # Adjust version as needed
    }
  }
}

provider "virtualbox" {
  # other configuration (remove version constraint from here)
}

resource "virtualbox_vm" "app_vm" {
  name   = "yolo-app-vm"
  image  = "ubuntu-20.04"
  cpu    = 2
  memory = 2048
  network_adapter {
    type = "bridged"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Provisioning VM with Ansible playbook'",
      "ansible-playbook -i 127.0.0.1, -u vagrant --private-key=${var.private_key_path} /home/hamsa/yolo/playbook.yml"
    ]
  }
}

