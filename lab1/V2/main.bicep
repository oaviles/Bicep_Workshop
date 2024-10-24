targetScope='subscription'

param resourceGroupName string = 'lab0'
param location string = 'eastus2'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}
