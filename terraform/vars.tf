
variable "vsphere_user" {
  description = "vsphere username"
  default     = "administrator@i-401.xyz"
}

variable "vsphere_password" {
  description = "vsphere password"
  default     = "password"
}

variable "vsphere_server" {
  description = "vsphere server"
  default     = "photon-machine.i-401.xyz"
}

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = true
}


data "vsphere_datacenter" "dc" {
  name = "Home"
}

data "vsphere_datastore" "datastore" {
  name          = "Samsung"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


data "vsphere_virtual_machine" "template" {
  name          = "template_ubuntu_linux"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "10.0.0.23/Resources"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
