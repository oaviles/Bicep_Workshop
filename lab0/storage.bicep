// main.bicep

var sku = 'Standard_LRS'
var kind = 'StorageV2'

@description('The name of the storage account')
param storageName string

@description('The location of the storage account')
param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageName
  location: location
  sku: {
    name: sku
  }
  kind: kind
}

output storageAccountId string = storageAccount.properties.primaryEndpoints.blob
