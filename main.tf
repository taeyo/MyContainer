# 변수 선언
variable arm-prefix {
  default = "taeyo"
}

# 리소스 그룹
resource "azurerm_resource_group" "rg-taeyo-group" {
  name = "${var.arm-prefix}-group"
  location = "japaneast"
}

resource "azurerm_storage_account" "taeyostore" {
  name = "taeyostore"
  location = "japaneast"
  resource_group_name = "${azurerm_resource_group.rke-group.name}"
  account_replication_type = "LRS"
  account_tier = "Standard"
}

resource "azurerm_container_registry" "taeyoegistry" {
  name = "taeyoreg"
  location = "japaneast"
  resource_group_name = "${azurerm_resource_group.rke-group.name}"
  storage_account_id = "${azurerm_storage_account.arkregstore.id}"
}