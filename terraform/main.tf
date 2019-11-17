
resource "vsphere_virtual_machine" "vm1" {
  name         = "nidhogg"
  datastore_id = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = 1
  memory           = 1024
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "nidhogg"
        domain    = "i-401.xyz"
      }

      network_interface {
        ipv4_address = "10.0.0.200"
        ipv4_netmask = 24
      }

      ipv4_gateway = "10.0.0.1"

    }
  }
}


resource "vsphere_virtual_machine" "vm2" {
  name         = "nginx"
  datastore_id = "${data.vsphere_datastore.datastore.id}"

  num_cpus         = 1
  memory           = 1024
  guest_id         = "${data.vsphere_virtual_machine.template.guest_id}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "nginx"
        domain    = "i-401.xyz"
      }

      network_interface {
        ipv4_address = "10.0.0.201"
        ipv4_netmask = 24
      }

      ipv4_gateway = "10.0.0.1"

    }
  }
}

