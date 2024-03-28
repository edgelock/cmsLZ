//Peer from prd to hub
param vNetName string = 'vnet-eus2-hub-cms'
param remoteVNetName string = 'vnet-eus2-prd-dbw'
param remoteVNetID string = '/subscriptions/459e2a30-14c0-4bc9-8865-1d2dbc69bcff/resourceGroups/rg-eus2-prd-dbw/providers/Microsoft.Network/virtualNetworks/vnet-eus2-prd-dbw'
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
