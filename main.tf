terraform {

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "adityatfstate001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "sohan"
  location = "Central India"
}

resource "azurerm_storage_account" "stg" {
  name                     = "ramoo21"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg_names
  location = var.rg_location
}



