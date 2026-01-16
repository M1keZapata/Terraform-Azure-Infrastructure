terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
}

resource "azurerm_resource_group" "terraform-azure-rg" {
  name     = "terraform-azure-resources"
  location = "East US"
  tags = {
    Environment = "Dev"
    Project     = "Terraform Azure"
  }
}

resource "azurerm_virtual_network" "terraform-azure-vnet" {
  name                = "terraform-azure-network"
  location            = azurerm_resource_group.terraform-azure-rg.location
  resource_group_name = azurerm_resource_group.terraform-azure-rg.name
}
  