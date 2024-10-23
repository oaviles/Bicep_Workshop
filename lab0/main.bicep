var prefix = 'dev'
var storageName = '${prefix}oastorage003'

var regions = [
    'eastus'
    'westus'
    'mexicocentral'
]

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01'=[for (region,i) in regions: {
    name: '${storageName}${i}'
    location: region
    sku: {
        name: 'Standard_LRS'
    }
    kind: 'StorageV2'
}
]
