variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}
variable private_key_path {
  description = "Path to privat key"
}
variable VM_zone {
  description = "Defaul zone for VM"
  default     = "ru-central1-a"
}
variable instances_count {
  description = "Default instance value"
  default     = 1
}
variable "storage_access_key" {
  description = "storage_access_key"
}
variable storage_secret_key {
  description = "storage_secret_key"
}
