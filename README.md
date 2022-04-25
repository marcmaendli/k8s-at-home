# k8s-at-home
k8s-at-home

## ToDo

### Proxmox
[] Reinstall Proxmox
[] 2 Partitions: Proxmox System
- [] Configure Proxmox NFS Storage for Images
### Terraform
- [] Choose OS for K3S Nodes
- [] Provisioning 5 VM on Proxmox with TF
### K3S
- [] Create Ansible Playbook for deploying a running K3S Cluster
- [] 

## Useful Links
[Provisioning VMs with Terraform on Proxmox](https://vectops.com/2020/05/provision-proxmox-vms-with-terraform-quick-and-easy/)

# Proxmox
proxmox: https://192.168.1.111:8006/
api token: e8800db8-c329-11ec-9d64-0242ac120002 / a8c0ea11-b0aa-440c-9998-b1752ebd212a

# Terraform

```bash
cd ./cluster/terraform && terraform init
cd ./cluster/terraform && terraform plan
```


