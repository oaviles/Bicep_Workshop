var prefix = 'dev'
// var storageName = '${prefix}oastorage'

var storageName = '${prefix}${uniqueString(resourceGroup().id)}'

var regions = [
  'eastus'
  'westus'
]

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageName
  location: first(regions)
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
