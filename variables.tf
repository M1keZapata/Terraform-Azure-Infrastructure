variable "environment" {
    description = "The deployment environment (e.g. dev, acc, prd)"
    type = string
}

variable "location" {
    description = "The Azure region to deploy the resources to"
    type = string
}

variable "location_short" {
    description = "The short name of the Azure region (e.g. eastus)"
    type = string
}