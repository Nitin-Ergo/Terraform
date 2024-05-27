// --------------------------------------------Connectivity Subscription Budgets  -----------------------------------------------
resource "azurerm_consumption_budget_subscription" "AVD_Sub_Budget" {
  provider        = azurerm.connectivity-sub
  name            = var.Hub_Sub_Budget_Name
  subscription_id = "/subscriptions/${var.Connectivity_Sub_Id}"

  amount     = 2500
  time_grain = "Monthly"

  time_period {
    start_date = "2023-12-01T00:00:00Z"
    end_date   = "2055-07-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "EqualTo"
    contact_emails = [var.Hub_Sub_Budget_Email_Receiver]
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    contact_emails = [var.Hub_Sub_Budget_Email_Receiver]
  }
}

// --------------------------------------------Management Subscription Budgets  -----------------------------------------------

resource "azurerm_consumption_budget_subscription" "MGMT_Sub_Budget" {
  provider        = azurerm.management-sub
  name            = var.MGMT_Sub_Budget_Name
  subscription_id = "/subscriptions/${var.MGMT_Sub_Id}"

  amount     = 2500
  time_grain = "Monthly"

  time_period {
    start_date = "2023-12-01T00:00:00Z"
    end_date   = "2055-07-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "EqualTo"
    contact_emails = [var.MGMT_Sub_Budget_Email_Receiver]
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    contact_emails = [var.MGMT_Sub_Budget_Email_Receiver]
  }
}


// --------------------------------------------Curator Staging Subscription Budgets  -----------------------------------------------

resource "azurerm_consumption_budget_subscription" "Cura_Staging_Sub_Budget" {
  provider        = azurerm.cura-staging-sub
  name            = var.Cura_Staging_Sub_Budget_Name
  subscription_id = "/subscriptions/${var.Cura_Staging_Sub_Id}"

  amount     = 2500
  time_grain = "Monthly"

  time_period {
    start_date = "2023-12-01T00:00:00Z"
    end_date   = "2055-07-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "EqualTo"
    contact_emails = [var.Cura_Staging_Sub_Budget_Email_Receiver]
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    contact_emails = [var.Cura_Staging_Sub_Budget_Email_Receiver]
  }
}


// --------------------------------------------Curator Prod Subscription Budgets  -----------------------------------------------

resource "azurerm_consumption_budget_subscription" "Cura_Prod_Sub_Budget" {
  provider        = azurerm.cura-prod-sub
  name            = var.Cura_Prod_Sub_Budget_Name
  subscription_id = "/subscriptions/${var.Cura_Prod_Sub_Id}"

  amount     = 2500
  time_grain = "Monthly"

  time_period {
    start_date = "2023-12-01T00:00:00Z"
    end_date   = "2055-07-01T00:00:00Z"
  }

  notification {
    enabled        = true
    threshold      = 75.0
    operator       = "EqualTo"
    contact_emails = [var.Cura_Prod_Sub_Budget_Email_Receiver]
    contact_roles  = ["Owner"]
  }

  notification {
    enabled        = true
    threshold      = 90.0
    operator       = "EqualTo"
    contact_emails = [var.Cura_Prod_Sub_Budget_Email_Receiver]
  }
}