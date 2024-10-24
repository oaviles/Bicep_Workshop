//@minLength(3)
//@maxLength(15)
param storageName string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: 'mexicocentral'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageEndpoint string = storageAccount.properties.primaryEndpoints.blob
