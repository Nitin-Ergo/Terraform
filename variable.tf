##-----------Location---------------

variable "location" {
  type        = string
  default     = "northeurope"
  description = "Location"
}

##-----------Subscriptions---------------

variable "Connectivity_Sub_Id" {
  type        = string
  default     = "c717dbe1-7d53-4e2a-be6f-4f2906aea2d4"
  description = "Connectivity Subscription ID"
}

variable "AVD_Sub_Id" {
  type        = string
  default     = "3812a3bd-570e-49b6-a281-2536a3fa0318"
  description = "AVD Subscription ID"
}


##-----------AVD Resource Groups---------------

variable "AVD_Network_RG_Name" {
  type        = string
  default     = "rg-avd-prod-networking"
  description = "AVD Network Resource Group"
}