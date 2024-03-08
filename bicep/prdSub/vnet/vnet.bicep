param location string = resourceGroup().location
param tenantId string = '2fb36de5-296a-43c7-b5d2-ae73931f0aa3'
param region string = 'eus2'
param environment string = 'hub'
param suffix string = 'cms'
var subnets = [
  {
    name: 'AzureBastionSubnet'
    subnetPrefix: '10.5.0.64/26'
  }
  {
    name: 'GatewaySubnet'
    subnetPrefix: '10.5.0.0/26'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-trust'
    subnetPrefix: '10.5.0.208/28'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-mgmt'
    subnetPrefix: '10.5.0.224/28'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-untrust'
    subnetPrefix: '10.5.0.192/28'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-ha'
    subnetPrefix: '10.5.0.240/28'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-pe'
    subnetPrefix: '10.5.1.16/28'
  }
]


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'vnet-${region}-${environment}-${suffix}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.5.0.0/21'
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

// var nsgs = [
//   {
//     name: 'az-res-prd-afw-nsg01'
//   }

// ]

// resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = [for nsgs in nsgs: {
//   name: nsgs.name
//   location: location
//   properties: {
//     securityRules: []
//   }   
// }]
