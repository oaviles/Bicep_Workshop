var prefix = 'dev'
var storageName = 'oastorage'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01'= {
    name: 'oastorage002'
    location: 'mexicocentral'
    sku: {
        name: 'Standard_LRS'
    }
    kind: 'StorageV2'
}
