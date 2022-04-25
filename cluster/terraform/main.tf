terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
      }
  }
}

provider "proxmox" {
  pm_api_url = "https://pve:8006/api2/json"
  pm_user = "root@pam"
  # pm_password = ""
  # pm_api_token_id = "marc#pam!e8800db8-c329-11ec-9d64-0242ac120002"
  # pm_api_token_secret = "a8c0ea11-b0aa-440c-9998-b1752ebd212a"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "k8s-at-home" {
  count = 1
  name = "k8s-vm-${count.index + 1}"
  target_node = var.proxmox_host
  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    size = "10G"
    type = "virtio"
    storage = "local_lvm"
    iothread = 1
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 ="ip=10.98.1.9${count.index + 1}/24,gw=10.98.1.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}