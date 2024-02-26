param location string = resourceGroup().location

@description('The name of the SQL logical server.')
param serverName string = 'sql-eus2-dev-cms'

@description('The name of the SQL Database.')
param sqlDBName string = 'sql-db01-eus2-dev-cms'

@description('The administrator username of the SQL logical server.')
param administratorLogin string = 'cmssqladmin'

@description('The administrator password of the SQL logical server.')
@secure()
param administratorLoginPassword string = 'Pc!C0mpl!@nc3'

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}
