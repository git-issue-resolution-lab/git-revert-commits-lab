# azure provider
provider "azurerm" {
  features {}
}

# creating azurerm_resource_group
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "East US"
}
