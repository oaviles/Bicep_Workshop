param location string = resourceGroup().location
param openAiServiceName string = 'openaiservice02'
param skuName string = 'S0'
param deploymentName string = 'oadeployment01'
param modelName string = 'gpt-35-turbo-16k'
param format string = 'OpenAI'
param scaleType string = 'Standard'
param version string = '0613'

resource openAiService 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: openAiServiceName
  location: location
  kind: 'OpenAI'
  sku: {
    name: skuName
  }
  properties: {
   publicNetworkAccess: 'Enabled'
  }
}

resource openAiDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAiService
  name: deploymentName
  sku: {
    capacity: 119
    name: scaleType
  }
  properties: {
    model: {
      format: format
      name: modelName
      version: version
    }
  }
}

output openAiServiceId string = openAiService.id
output openAiDeploymentId string = openAiDeployment.id
