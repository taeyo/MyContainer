# 변수 선언
variable arm-prefix {
  default = "taeyo"
}

# 리소스 그룹
resource "azurerm_resource_group" "rg-taeyo-group" {
  name = "${var.arm-prefix}-group"
  location = "japaneast"
}