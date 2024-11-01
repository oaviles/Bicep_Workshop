module openAIModule 'azureopenai.bicep' = {
  name: 'openAIModule'
  params: {
     deploymentName: 'oadeployment01'
     format: 'OpenAI'
     location: resourceGroup().location
     modelName: 'gpt-35-turbo-16k'
    openAIServiceName: 'oaiservice${uniqueString(resourceGroup().id)}'
     scaleType: 'Standard'
     skuName: 'S0'
     version: '0613'
  }
}
