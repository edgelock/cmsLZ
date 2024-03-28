param location string = resourceGroup().location
param region string = 'eus2'
param environment string = 'prd'
param suffix string = 'data'
param storageAccountName string = 'st${region}${environment}raw${suffix}'



param accs array = [
  'st${region}${environment}raw${suffix}'
  'st${region}${environment}rawdbwcat'
]

resource flowlogStorageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = [for acc in accs: {
  name: acc
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
  }
}]

