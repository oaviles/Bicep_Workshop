param sites_oalogicapp002_name string = 'Yout Logic App Name'
param serverfarms_ASP_OAZone_b82b_externalid string = 'Your App Service Resource ID'

param appSettings object = {
  FUNCTIONS_EXTENSION_VERSION: '~4'
  FUNCTIONS_WORKER_RUNTIME: 'dotnet'
  APP_KIND: 'workflowApp'
  AzureFunctionsJobHost__extensionBundle__id: 'Microsoft.Azure.Functions.ExtensionBundle'
  AzureFunctionsJobHost__extensionBundle__version: '[1.*, 2.0.0)'
  AzureWebJobsStorage: ''
  WEBSITE_CONTENTAZUREFILECONNECTIONSTRING: ''
  WEBSITE_CONTENTSHARE: ''
  WEBSITE_NODE_DEFAULT_VERSION: '~18'
}

resource sites_oalogicapp002_name_resource 'Microsoft.Web/sites@2023-12-01' = {
  name: sites_oalogicapp002_name
  location: resourceGroup().location
  kind: 'functionapp,workflowapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_oalogicapp002_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_oalogicapp002_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
    ]

    serverFarmId: serverfarms_ASP_OAZone_b82b_externalid
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false

    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    vnetBackupRestoreEnabled: false
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_oalogicapp002_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_oalogicapp002_name_resource
  name: 'ftp'
  properties: {
    allow: false
  }
}

resource sites_oalogicapp002_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2023-12-01' = {
  parent: sites_oalogicapp002_name_resource
  name: 'scm'
  properties: {
    allow: false
  }
}

resource sites_oalogicapp002_name_web 'Microsoft.Web/sites/config@2023-12-01' = {
  parent: sites_oalogicapp002_name_resource
  name: 'web'
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: 'REDACTED'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    cors: {
      supportCredentials: false
    }
    localMySqlEnabled: false
    managedServiceIdentityId: 71338
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 1
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: true
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_oalogicapp002_name_sites_oalogicapp002_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2023-12-01' = {
  parent: sites_oalogicapp002_name_resource
  name: '${sites_oalogicapp002_name}.azurewebsites.net'
  properties: {
    siteName: sites_oalogicapp002_name
    hostNameType: 'Verified'
  }
}

resource appSettingsConfig 'Microsoft.Web/sites/config@2022-03-01' = {
  parent: sites_oalogicapp002_name_resource
  name: 'appsettings'
  properties: appSettings
}
