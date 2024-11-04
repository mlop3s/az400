$resourceGroupName = "az400"
$location = "westeurope"

az login
    
az group create --name $resourceGroupName --location $location
az deployment group create --resource-group $resourceGroupName --template-file template.json --parameters parameters.json
    