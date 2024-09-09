resource "yandex_vpc_network" "network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "${var.network_name}-subnet"
  network_id     = yandex_vpc_network.network.id
  zone           = var.zone
  v4_cidr_blocks = var.v4_cidr_blocks
}