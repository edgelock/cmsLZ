//Peer from prd to hub
param vNetName string = 'vnet-eus2-hub-cms'
param remoteVNetName string = 'vnet-eus2-dev-cms'
param remoteVNetID string = '/subscriptions/9b3da0ac-e975-4e7c-88bf-3fc4c25cfba2/resourceGroups/rg-eus2-dev-cms/providers/Microsoft.Network/virtualNetworks/vnet-eus2-dev-data'
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
