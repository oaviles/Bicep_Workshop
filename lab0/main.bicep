var prefix = 'dev'
@minLength(4)
//@maxLength(12)
// var storageName '${prefix}oastorage00600023'
param storageName string //= '${prefix}oastorage00600023'



var regions = [
    'eastus'
    'westus'
    'mexicocentral'
]

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01'=[for (region,i) in regions: {
    name: '${storageName}${i}'
    location: first(regions)
    sku: {
        name: 'Standard_LRS'
    }
    kind: 'StorageV2'
}
]
