var prefix = 'dev'
// var storageName = '${prefix}oastorage'

var storageName = '${prefix}${uniqueString(resourceGroup().id)}'

var regions = [
  'eastus'
  'westus'
]

resource storageAccount1 'Microsoft.Storage/storageAccounts@2021-04-01' = if(prefix == 'dev') {
  name: storageName
  location: first(regions)
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    environment: 'development'
  }
}

resource storageAccount2 'Microsoft.Storage/storageAccounts@2021-04-01' = if(prefix == 'prod') {
  name: storageName
  location: first(regions)
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    environment: 'production'
  }
}
