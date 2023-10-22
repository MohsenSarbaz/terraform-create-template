variable "username" {
  type        = string
  description = "VMware vSphere user name"
  sensitive   = true
        }

variable "password" {
  type        = string
  description = "VMware vSphere password"
  sensitive   = true
        }

variable "vcenter" {
  type        = string
  description = "VMWare vCenter server FQDN / IP"
  sensitive   = true
        }

variable "vsphere-unverified-ssl" {
  type        = string
  description = "Is the VMware vCenter using a self signed certificate (true/false)"
}

variable "datacenter" {
  type        = string
  description = "VMWare vSphere datacenter"
        }

variable "vsphere_cluster" {
  type        = string
  description = "VMWare vSphere cluster"
        }

variable "vsphere_datastore" {
  type        = string
  description = "Datastore used for the vSphere virtual machines"
        }

variable "vsphere_network" {
  type        = string
  description = "Network used for the vSphere virtual machines"
        }

variable "parent_folder" {
  type        = string
  description = "Path for Parent directory"
        }

variable "folder1" {
  type        = string
  description = "Path for sub-directory1"
        }

variable "folder2" {
  type        = string
  description = "Path for sub-directory2"
        }

variable "name" {
  type        = string
  description = "The name of the vSphere virtual machines a of the machine"
        }

variable "cpu" {
  type = number
  description = "Number of vCPU for the vSphere virtual machines"
  default     = 2
        }

variable "memory" {
  type = number
  description = "Amount of RAM for the vSphere virtual machines (example: 2048)"
        }

variable "guest_id" {
  type        = string
  description = "The ID of virtual machines operating system"
        }

variable "disk_size" {
  type = number
  description = "The size for the virtual disk in GB."
        }

variable "vm-domain" {
  type        = string
  description = "Linux virtual machine domain name for the machine. This, along with host_name, make up the FQDN of the virtual machine"
  default     = ""
}

#variable "template" {
#       default = ""
#       }

#variable "template" {
#       default = ""
#       }

#variable "template" {
#       default = ""
#       }

