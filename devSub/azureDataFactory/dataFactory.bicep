param location string = resourceGroup().location

param dataFactoryName string = 'adf-eus2-dev-cms'

resource dataFactory 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
}
