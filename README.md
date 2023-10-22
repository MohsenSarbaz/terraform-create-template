 TERRAFORM CREATE TEMPLATE FROM EXISTING RESOURCES

## Overview

This code allows you to create a virtual machine using Terraform with the vCenter provider. The virtual machine is built based on a template cloned from SUSE Enterprise SP15, which I created in vCenter. With this Terraform configuration, you can easily deploy a virtual machine in your vCenter environment, leveraging the power of infrastructure as code.

## Prerequisites

Before you begin, ensure you have the following installed:

-Terraform v1.5.5: Make sure you have Terraform installed on your system. You can download it from the official Terraform website(https://www.terraform.io/downloads.html) and follow the installation instructions.

-vSphere Provider v2.4.2: This Terraform configuration uses the vSphere provider to interact with your vCenter environment. Ensure you have vSphere provider version 2.4.2 or later installed. You can find more information and installation instructions in the Terraform vSphere provider documentation (https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs).


## Getting Started

1. Clone the repository:
  MohsenSarbaz/terraform-create-template
2. Navigate to the project directory:
   
   cd terraform-create-template

3. Modify files to set your configuration options.
   ( "terraform.tfvars",
   "var.auto.tfvars",
   "variables.tf"(Optional) )
    
5. Run Terraform commands to deploy the VM:
   
   terraform init
   terraform apply
   
## Contributing

If you have any questions, feel free to reach out to me via email at mohsen.sarbaz7@gmail.com. Your contributions, feedback, and suggestions are highly appreciated.
