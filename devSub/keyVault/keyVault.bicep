param location string = resourceGroup().location
param tenantId string = '9c8d7196-e4cf-4c75-9312-3b2fc26f41e6'

resource prdKeyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  location: location
  name: 'kv-eus2-dev-cms'
  properties: {
    sku: {
      family: 'A'
      name: 'premium'
    }
    tenantId: tenantId
    publicNetworkAccess: 'Disabled'
    enableRbacAuthorization: true
  }
}
