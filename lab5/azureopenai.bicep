param location string
param openAIServiceName string
param skuName string
param deploymentName string
param modelName string
param format string
param scaleType string
param version string

var capacity = 62

resource openAiService 'Microsoft.CognitiveServices/accounts@2021-04-30' = {
  name: openAIServiceName
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
    capacity: capacity
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
