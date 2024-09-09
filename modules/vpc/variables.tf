variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR blocks for the subnet"
  type        = list(string)
}

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}