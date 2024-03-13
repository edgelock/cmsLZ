param location string = resourceGroup().location
param tenantId string = '2fb36de5-296a-43c7-b5d2-ae73931f0aa3'
param region string = 'eus2'
param environment string = 'hub'
param suffix string = 'cms'
resource qause2netappsn01rt 'Microsoft.Network/routeTables@2022-09-01' = {
  name: 'rt-${region}-${environment}-${suffix}'
  location: location
  properties: {
    routes: [
      {
        name: 'defaultRoute'
        properties: {
          nextHopType: 'VirtualAppliance'
          addressPrefix: '0.0.0.0/0'
          nextHopIpAddress: '10.2.8.68'
        }
      }
      {
        name: 'ToHubVnet'
        properties: {
          nextHopType: 'VirtualAppliance' 
          addressPrefix: '10.2.8.0/24'
          nextHopIpAddress: '10.2.8.68'
        }
      }
      {
        name: 'ToVnet'
        properties: {
          nextHopType: 'VirtualAppliance'
          addressPrefix: '10.2.11.0/24'
          nextHopIpAddress: '10.2.8.68'
        }
      }
      {
        name: 'ToSelf'
        properties: {
          nextHopType: 'VirtualAppliance'
          addressPrefix: '10.2.11.64/26'
          nextHopIpAddress: '10.2.8.68'
        }
      }
    ]
  }
}
