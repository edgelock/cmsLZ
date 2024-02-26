param location string = resourceGroup().location


resource devRouteTable 'Microsoft.Network/routeTables@2022-09-01' = {
  name: 'devcaeart01'
  location: location
  properties: {
    routes: [
      {
        name: 'AppGw'
        properties: {
          addressPrefix: '10.140.1.0/24'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.140.0.132'
        }
      }
      {
        name: 'devspoke'
        properties: {
          addressPrefix: '10.140.96.0/21'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.140.0.132'
        }
      }
      {
        name: 'internet'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.140.0.132'
        }
      }
      {
        name: 'Mgmt'
        properties: {
          addressPrefix: '10.140.0.32/27'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.140.0.132'
        }
      }
      {
        name: 'SharedServices'
        properties: {
          addressPrefix: '10.140.2.0/24'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: '10.140.0.132'
        }
      }
    ]
  }
}

output id string = devRouteTable.id
