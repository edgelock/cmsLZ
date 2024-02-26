//Peer from dev to hub
param vNetName string = 'dev-use2-net-vnet01'
param remoteVNetName string = 'hub-use2-net-vnet01'
param remoteVNetID string = '/subscriptions/ccac80e3-7745-4704-b3d9-b4e013715469/resourceGroups/hubuse2rg/providers/Microsoft.Network/virtualNetworks/hub-use2-net-vnet01'
param allowGatewayTransit bool = false
param useRemoteGateways bool = true
param allowForwardedTraffic bool = true
param allowVirtualNetworkAccess bool = true

resource vnetPeeringResource 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-08-01' = {
  name: '${vNetName}/${vNetName}-to-${remoteVNetName}'

  properties: {
    remoteVirtualNetwork: {
      id: remoteVNetID
    }
    allowGatewayTransit: allowGatewayTransit
    useRemoteGateways: useRemoteGateways
    allowForwardedTraffic: allowForwardedTraffic
    allowVirtualNetworkAccess: allowVirtualNetworkAccess
  }
}

output id string = vnetPeeringResource.id
