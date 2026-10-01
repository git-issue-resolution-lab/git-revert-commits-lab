# azure provider
provider "azurerm" {
  features {}
}

# creating azurerm_resource_group
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "East US"
}

# creating storage_account
resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
