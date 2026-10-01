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

# creating virtual_network
resource "azurerm_virtual_network" "example" {
  name                = "my-vnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

# creating subnet
resource "azurerm_subnet" "example" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}
