# k8s-at-home
k8s-at-home

## ToDo

### Proxmox
- [ ] Reinstall Proxmox
- [ ] 2 Partitions: Proxmox System
- [ ] Configure Proxmox NFS Storage for Images
### Terraform
- [ ] Choose OS for K3S Nodes
- [ ] Provisioning 5 VM on Proxmox with TF
### K3S
- [ ] Create Ansible Playbook for deploying a running K3S Cluster
- [ ]  

## Useful Links
[Provisioning VMs with Terraform on Proxmox](https://vectops.com/2020/05/provision-proxmox-vms-with-terraform-quick-and-easy/)

# Proxmox
- proxmox: https://192.168.1.111:8006/
- api token: e8800db8-c329-11ec-9d64-0242ac120002 / a8c0ea11-b0aa-440c-9998-b1752ebd212a

# Terraform

```bash
cd ./cluster/terraform && terraform init
cd ./cluster/terraform && terraform plan
```


## Creating a cloud-init VM template

On the pve host:

1. apt install cloud-init
2. Create a template VM (in this case Ubuntu 20.04):

```bash
wget http://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
export VM_ID="9000"
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --sockets 1 --cores 2 --vcpu 2  -hotplug network,disk,cpu,memory --agent 1 --name cloud-init-focal --ostype l26
qm importdisk $VM_ID focal-server-cloudimg-amd64.img local-lvm
qm set $VM_ID --scsihw virtio-scsi-pci --virtio0 local-lvm:vm-$VM_ID-disk-0
qm set $VM_ID --ide2 local-lvm:cloudinit
qm set $VM_ID --boot c --bootdisk virtio0
qm set $VM_ID --serial0 socket
qm template $VM_ID
rm focal-server-cloudimg-amd64.img
```


