# Waqq.ly Web Application Prototype

## Information

This repository contains the prototype application for the Waqq.ly application. The application consists of two main components, a user interface and a API. Additionally, Infrastructure as Code (IaC) and continuous integration has been configured allowing for the application to be deployed quickly.

## Deployment

This section details how to deploy the Waqq.ly application to a Azure environment.

### Prerequisites

- Azure CLI - can be installed at [Azure](https://learn.microsoft.com/en-us/cli/azure/)
- Terraform - can be installed at [Terraform](https://developer.hashicorp.com/terraform/install)
- Podman - required for building images locally (optional) [Podman](https://podman.io/docs/installation)

### Deployment Steps

#### Deploying the Infrastructure

The initial step in deploying the Waqq.ly application is to deploy the infrastructure which will host the application. The infrastructure consists of **12** resources.

1. Navigate to the `deployment` directory within this repository.
2. Run `terraform init` - this will initial Terraform within this directory.
3. Run `az login` - this will authenticate the Terminal session with your Azure account.
4. Run `terraform plan` - this confirms how the infrastructure will deployed and establish we have connectivity to the correct Azure account.
5. Once the Terraform Plan has been reviewed, it can be deployed with `terraform apply`.
6. After the Terraform Apply has succeeded, Terraform should provide an output like `Apply complete! Resources: 12 added, 0 changed, 0 destroyed.` - indicating all 12 resources have been deployed successfully.
7. Finally, the infrastructure can be viewed by accessing the Azure management console.

#### Deploying the Application

Now with the infrastructure deployed, the application can be deployed to it.

There are two ways the application can be deployed, manually with Podman (Optional) or automatically with Github Actions. Continuous integration has been configured with Github Actions and will build a new container image for the UI and API upon changes made to this repository.

##### Configuring Github Actions

The pipeline code for both 'Actions' exists within the `.github` directory, there are two 'Actions' for the two applications (UI & API).

First permission need to be granted for Github Actions to access the container registry on Azure. This can be done by running the following commands:

1. `groupId=$(az group show --name waqqly-app --query id --output tsv)` - this returns the ID of the resource group.
2. `az ad sp create-for-rbac --scope $groupId --role Contributor --json-auth` - this creates a service principle and outputs JSON, ensure this JSON output is saved (it contains content required for the environment variables below).
3. `registryId=$(az acr show --name waqqlyapp --resource-group waqqly-app --query id --output tsv)` - this obtains the ID of the container registry.
4. `az role assignment create --assignee <ClientId> --scope $registryId --role AcrPush` - this updates the service principle with the AcrPush role allowing it to access the container registry. **IMPORTANT - `<ClientId>` must be replaced with the ClientId from the JSON output previously saved**

Environment variables need to be configured to allow Github Actions to securely push to container images to the container registry within Azure and to ensure the applications have the relevant secrets.

These environment variables can be configured by accessing the Github UI and navigating to **Settings > Security > Secrets and variables > Actions** within the repository. From here, there is the option to add a **New repository secret**. Select the **New repository secret** button to add the following variables and secrets:

| Variable/Secret         | Purpose                                                                           | Value                                                                                                                                                                                                                                                                                 |
| ----------------------- | --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AZURE_CREDENTIALS`     | Provides Actions with the credentials required to access the container registry.  | This value is the entire JSON output from step 2 above.                                                                                                                                                                                                                               |
| `REGISTRY_LOGIN_SERVER` | Provides Actions with the URL of the registry's login server.                     | This value is `waqqlyapp.azurecr.io`                                                                                                                                                                                                                                                  |
| `REGISTRY_USERNAME`     | Provides Actions with the username of the created service principle               | This value is the `clientId` from the JSON output from step 2.                                                                                                                                                                                                                        |
| `REGISTRY_PASSWORD`     | Provides Actions with the password of the created service principle               | This value is the `clientSecret` from the JSON output from step 2.                                                                                                                                                                                                                    |
| `RESOURCE_GROUP`        | Provides Actions with the resource group where the container registry is located. | This value is `waqqly-app`                                                                                                                                                                                                                                                            |
| `DB_URL`                | Provides the API with the connection URL of the database.                         | This value is retrieved from the CosmosDB console on Azure, under Quick Start, PRIMARY CONNECTION STRING. Or it can be obtained with `az cosmosdb keys list --name waqqly-dbv1 --resource-group waqqly-app --type connection-strings --query 'connectionStrings[0].connectionString'` |

With this configured, whenever a change is made to the `main` branch of the repository, Github Actions will build a new container image for the UI and API. The Web Apps on Azure will automatically update and pull the new images once they are detected.

##### Manual Image Deployment

Although Github Actions should be setup to allow for developers to have the best experience. It is also possible to build the container images locally and deploy them into Azure.

Firstly, Podman needs to be configured. This can be achieved through the following steps:

1. Run `podman machine init` - this creates the virtual machine required by podman.
2. Run `podman machine start` - this starts the podman virtual machine.

Now Podman is ready to be used and the container images can be built. This is done by completing the steps below on each application directory (`waqqly-web` and `waqqly-api`):

Navigate between the two repositories using the same terminal session to avoid having to reauthenticate with Azure.

Podman needs to be authenticated to be able to push images to the container registry, two steps are required to do this:

1. Run `az login` to authenticate with Azure
2. Run `podman login waqqlyapp.azure.io` to authenticate Podman with Azure - this will ask for a username & password, these are found on the container registry in Azure.

`waqqly-web`

2. Run `podman build -t waqqlyapp.azurecr.io/waqqly-app:latest .` - this builds the container image.
3. Run `podman login waqqlyapp.azurecr.io` - this authenticates Podman with the container registry in Azure.
4. Run `podman push waqqlyapp.azurecr.io/waqqly-app:latest` - this pushes the container image to the registry in Azure.

`waqqly-api`

1. Run `DB_CONNECTION=$(az cosmosdb keys list --name waqqly-dbv1 --resource-group waqqly-app --type connection-strings --query 'connectionStrings[0].connectionString' --output tsv)` - this obtains the CosmosDB connection string.
2. Run `podman build -t waqqlyapp.azurecr.io/waqqly-api:latest --build-arg DB_URL=$DB_CONNECTION .` - this builds the container image.
3. Run `podman login waqqlyapp.azurecr.io` - this authenticates Podman with the container registry in Azure.
4. Run `podman push waqqlyapp.azurecr.io/waqqly-api:latest` - this pushes the container image to the registry in Azure.

## Destruction

Once the prototype has come to the end of its lifecycle, the entire environment can be destroyed by running `terraform destroy` from the `deployment` directory. This will 'destroy' all the resources created, reducing the risk of a spike in the cloud bill.
