@description('The Azure region into which the resources should be deployed.')
param location string

@description('The name of the App Service app.')
param storageName string = '{uniqueString(resourceGroup().id)}'

module storageAccount 'storage.bicep' = {
  name: 'storageAccount'
  params: {
    storageName: storageName
        location: location
  }
}
