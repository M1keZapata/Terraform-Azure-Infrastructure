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
  name     = "terraform-azure-${var.environment}-${var.location_short}"
  location = var.location
  tags = {
    Environment = var.environment
    Project     = "Terraform Azure"
  }
}

resource "azurerm_virtual_network" "terraform-azure-vnet" {
  name                = "terraform-azure-${var.environment}-${var.location_short}"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.terraform-azure-rg.name
}
  