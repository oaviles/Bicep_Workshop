@description('The Azure region into which the resources should be deployed.')
param location string

@description('The name of the App Service app.')
param appServiceAppName string = 'toy-${uniqueString(resourceGroup().id)}'

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'S1'

@description('Indicates whether a CDN should be deployed.')
param deployCdn bool = true

module app 'modules/app.bicep' = {
    name: 'toy-launch-app'
    params: {
        location: location
        appServiceAppName: appServiceAppName
        appServicePlanName: appServicePlanName
        appServicePlanSkuName: appServicePlanSkuName
    }
}

module cdn 'modules/cdn.bicep' = {
    name: 'toy-launch-cdn'
    params: {
        httpsOnly: true
        originHostName: app.outputs.appServiceAppHostName
    }
}


var appServicePlanName = 'toy-product-launch-plan'

@description('The host name to use to access the website.')
output websiteHostName string = deployCdn ? cdn.outputs.endpointHostName : app.outputs.appServiceAppHostName
