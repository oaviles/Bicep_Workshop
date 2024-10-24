var prefix = 'dev'
var storageName = 'oastorage'

var regions = [
  'eastus'
  'westus'
]

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = [for (region,i) in regions: {
  name: '${storageName}${i}'
  location: region
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]
