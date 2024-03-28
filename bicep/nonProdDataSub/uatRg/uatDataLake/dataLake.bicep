param location string = resourceGroup().location
param region string = 'eus2'
param environment string = 'uat'
param suffix string = 'cms'
param storageAccountName string = 'adl${region}${environment}med'
 
resource flowlogStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'

  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    isHnsEnabled: true
    allowBlobPublicAccess: false
  }
}
