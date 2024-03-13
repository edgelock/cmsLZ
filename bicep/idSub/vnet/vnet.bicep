param location string = resourceGroup().location
param region string = 'eus2'
param environment string = 'id'
param suffix string = 'cms'
var subnets = [
  {
    name: 'snet-${region}-${environment}-ad'
    subnetPrefix: '10.5.32.0/25'
  }
]


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'vnet-${region}-${environment}-nw'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.5.32.0/24'
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
