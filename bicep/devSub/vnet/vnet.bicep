param location string = resourceGroup().location
param tenantId string = '2fb36de5-296a-43c7-b5d2-ae73931f0aa3'
param region string = 'eus2'
param environment string = 'dev'
param suffix string = 'cms'
// var subnets = [
//   {
//     name: 'snet-${region}-${environment}-${suffix}'
//     subnetPrefix: '10.205.255.192/27'
//   }
// ]


resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'vnet-${region}-${environment}-${suffix}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.205.255.0/24'
      ]
    }
    // subnets: [for subnet in subnets: {
    //   name: subnet.name
    //   properties: {
    //     addressPrefix: subnet.subnetPrefix
    //   }
    // }]
  }
}

var nsgs = [
  {
    name: 'nsg-${region}-${environment}-${suffix}'
  }

]

resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = [for nsgs in nsgs: {
  name: nsgs.name
  location: location
  properties: {
    securityRules: []
  }   
}]

