param location string = resourceGroup().location
param region string = 'eus2'
param environment string = 'dev'
param suffix string = 'dbw'
var subnets = [
  {
    name: 'snet-${region}-${environment}-${suffix}-pe'
    subnetPrefix: '10.5.12.0/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-compute'
    subnetPrefix: '10.5.13.0/27'
  }
  {
    name: 'snet-${region}-${environment}-${suffix}-container'
    subnetPrefix: '10.5.14.0/27'
  }
]


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'vnet-${region}-${environment}-dbw'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.5.12.0/22'
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
