param location string = resourceGroup().location
param tenantId string = '2fb36de5-296a-43c7-b5d2-ae73931f0aa3'
param region string = 'eus2'
param environment string = 'hub'
param suffix string = 'cms'
var subnets = [
  {
    name: 'AzureBastionSubnet'
    subnetPrefix: '10.205.0.128/26'
  }
  {
    name: 'GatewaySubnet'
    subnetPrefix: '10.205.0.0/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-trust'
    subnetPrefix: '10.205.0.1/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-mgmt'
    subnetPrefix: '10.205.0.2/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-untrust'
    subnetPrefix: '10.205.0.3/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-ha'
    subnetPrefix: '10.205.0.4/27'
  }
]


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'vnet-${region}-${environment}-${suffix}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.205.0.0/24'
      ]
    }
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
      }
    }]
  }
}

var nsgs = [
  {
    name: 'az-res-prd-afw-nsg01'
  }

]

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = [for nsgs in nsgs: {
  name: nsgs.name
  location: location
  properties: {
    securityRules: []
  }   
}]
