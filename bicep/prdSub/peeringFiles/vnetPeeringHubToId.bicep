//Peer from prd to hub
param vNetName string = 'vnet-eus2-hub-cms'
param remoteVNetName string = 'vnet-eus2-id-nw'
param remoteVNetID string = '/subscriptions/a09a8713-400d-40cb-bcb3-65f2251e91da/resourceGroups/rg-eus2-id-nw/providers/Microsoft.Network/virtualNetworks/vnet-eus2-id-nw'
param allowGatewayTransit bool = true
param useRemoteGateways bool = false
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
