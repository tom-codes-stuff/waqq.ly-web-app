provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "waqqly-group" {
  name     = "waqqly-app"
  location = "UK South"
}

resource "azurerm_container_registry" "acr" {
  name                = "waqqlyapp"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  location            = azurerm_resource_group.waqqly-group.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_service_plan" "waqqly-app-service-plan" {
  name                = "waqqly-app"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  location            = azurerm_resource_group.waqqly-group.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_service_plan" "waqqly-api-service-plan" {
  name                = "waqqly-api"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  location            = azurerm_resource_group.waqqly-group.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "waqqly-app" {
  name                = "waqqly-app-service"
  location            = azurerm_resource_group.waqqly-group.location
  resource_group_name = azurerm_resource_group.waqqly-group.name
  service_plan_id = azurerm_service_plan.waqqly-app-service-plan.id

  site_config {
    application_stack {
      docker_image_name = "waqqly-app"
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
      docker_registry_username = azurerm_container_registry.acr.admin_username
      docker_registry_password = azurerm_container_registry.acr.admin_password
    }
  }

  app_settings = {
    "DOCKER_ENABLE_CI" = true
    "WEBSITES_ENABLE_APP_SERVICE" = false
    "WEBSITES_PORT" = 3000
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_container_registry_webhook" "waqqly-app-webhook" {
  name                = "waqqly-app"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  registry_name       = azurerm_container_registry.acr.name
  location            = azurerm_resource_group.waqqly-group.location

  service_uri = "https://${azurerm_linux_web_app.waqqly-app.site_credential.0.name}:${azurerm_linux_web_app.waqqly-app.site_credential.0.password}@${azurerm_linux_web_app.waqqly-app.name}.scm.azurewebsites.net/api/registry/webhook"
  status      = "enabled"
  scope       = "waqqly-app:latest"
  actions     = ["push"]
}

resource "azurerm_linux_web_app" "waqqly-api" {
  name                = "waqqly-api-service"
  location            = azurerm_resource_group.waqqly-group.location
  resource_group_name = azurerm_resource_group.waqqly-group.name
  service_plan_id = azurerm_service_plan.waqqly-api-service-plan.id

  site_config {
    application_stack {
      docker_image_name = "waqqly-api"
      docker_registry_url = "https://${azurerm_container_registry.acr.login_server}"
      docker_registry_username = azurerm_container_registry.acr.admin_username
      docker_registry_password = azurerm_container_registry.acr.admin_password
    }
  }

  app_settings = {
    "DOCKER_ENABLE_CI" = true
    "WEBSITES_ENABLE_APP_SERVICE" = false
    "WEBSITES_PORT" = 3000
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_container_registry_webhook" "waqqly-api-webhook" {
  name                = "waqqly-api"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  registry_name       = azurerm_container_registry.acr.name
  location            = azurerm_resource_group.waqqly-group.location

  service_uri = "https://${azurerm_linux_web_app.waqqly-api.site_credential.0.name}:${azurerm_linux_web_app.waqqly-api.site_credential.0.password}@${azurerm_linux_web_app.waqqly-api.name}.scm.azurewebsites.net/api/registry/webhook"
  status      = "enabled"
  scope       = "waggly-api:latest"
  actions     = ["push"]
}

resource "azurerm_cosmosdb_account" "db" {
  name                = "waqqly-dbv1"
  location            = azurerm_resource_group.waqqly-group.location
  resource_group_name = azurerm_resource_group.waqqly-group.name
  offer_type          = "Standard"
  kind                = "MongoDB"
  enable_free_tier = true

  consistency_policy {
    consistency_level       = "Strong"
  }

  geo_location {
    location          = "uksouth"
    failover_priority = 0
}
}

resource "azurerm_cosmosdb_mongo_database" "waqqly-db" {
  name                = "waqqly-db"
  resource_group_name = azurerm_resource_group.waqqly-group.name
  account_name        = azurerm_cosmosdb_account.db.name
  throughput          = 400
}

resource "azurerm_cosmosdb_mongo_collection" "walker" {
  name                = "walkers"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_mongo_database.waqqly-db.name

  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}

resource "azurerm_cosmosdb_mongo_collection" "dogs" {
  name                = "dogs"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_mongo_database.waqqly-db.name

  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}