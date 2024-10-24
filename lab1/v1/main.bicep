targetScope='subscription'

var prefix = 'dev-'
var resourceGroupName = '${prefix}lab0'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: 'eastus2'
}
