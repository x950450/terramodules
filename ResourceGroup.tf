resource "azurerm_resource_group" "RG-Group-01" {
  name     = var.rg1-name
  location = var.location
}

resource "azurerm_storage_account" "storageacc46336578" {
  name                     = "storageacc46336578"
  resource_group_name      = "${azurerm_resource_group.RG-Group-01.name}"
  location                 = "${azurerm_resource_group.RG-Group-01.location}"
  account_tier             = var.accounttier
  account_replication_type = var.replicationtype

  tags = {
    environment = "staging"
  }



}
/*
resource "azurerm_storage_account" "storageacc463366" {
  name                     = "storageacc463366"
  resource_group_name      = "${azurerm_resource_group.RG-Group-01.name}"
  location                 = "${azurerm_resource_group.RG-Group-01.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }

depends_on          = [azurerm_storage_account.storageacc463365]

}
*/




terraform {
  backend "azurerm" {
    resource_group_name   = "Terraform001"
    storage_account_name  = "terraformstracc007"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}