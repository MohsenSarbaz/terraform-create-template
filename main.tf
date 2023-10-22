provider "vsphere" {
  user           = var.username
  password       = var.password
  vsphere_server = var.vcenter
  allow_unverified_ssl = var.vsphere-unverified-ssl
}

data "vsphere_datacenter" "datacenter" {
 name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "vsan" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vmnet" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


###parent folder
#####Child modern folder
#####Child SO folder
resource "vsphere_folder" "parent" {
      path = var.parent_folder
      type = "vm"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

####Child modern folder

resource "vsphere_folder" "modern" {
      path = "${vsphere_folder.parent.path}/${var.folder1}"
      type = "vm"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


#####Explain template

data "vsphere_virtual_machine" "source_template" {
  name          = "SUSE-TMPLT-MAIN"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

#####Define Source

resource "vsphere_virtual_machine" "vm-zag4" {
  name                       = "suse-tmplte-run-command"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  folder                     = resource.vsphere_folder.modern.path
  datastore_id               = data.vsphere_datastore.vsan.id
  num_cpus                   = var.cpu
  memory                     = var.memory
  guest_id                   = var.guest_id
  wait_for_guest_net_timeout = 0
  network_interface {
        adapter_type = "vmxnet3"
    network_id = data.vsphere_network.vmnet.id
  }
    disk {
    label = "${var.name}-disk"
        #size  = var.disk_size
    size             = data.vsphere_virtual_machine.source_template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.source_template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.source_template.disks.0.thin_provisioned
  }

    clone {
    template_uuid = data.vsphere_virtual_machine.source_template.id
    customize {
      linux_options {
        host_name = "SUSE"
        domain    = ""
      }
      network_interface {
                ipv4_address = "YOUR-IP-ADDRESS"
        ipv4_netmask = 24
                }
                }
    }
  }
