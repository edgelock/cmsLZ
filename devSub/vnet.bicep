// //Logged in to account
// Connect-AzAccount
// // Set Proper Sub
// Set-AzContext b4cce3de-40d0-4810-a7af-62faa3c54d59 
// // Deployment Command:
// New-AzResourceGroupDeployment -ResourceGroupName devcaearg01 -TemplateFile C:\bicepStuff\LifeSpeakLZ\devSub\vnet.bicep -Mode Incremental -verbose

param location string = resourceGroup().location
param devroutetableid string = '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourceGroups/devcaearg01/providers/Microsoft.Network/routeTables/devcaeart01'
param logAnalyticsWorkspaceId string = '/subscriptions/b4cce3de-40d0-4810-a7af-62faa3c54d59/resourcegroups/devcaearg01/providers/microsoft.operationalinsights/workspaces/devcaealaw01'

resource devvnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: 'dev-use2-net-vnet01'
  location: location
  properties: {
    virtualNetworkPeerings: [
      
    ]
    addressSpace: {
      addressPrefixes: [
        '10.2.10.0/24'
      ]
    }
  }
}

resource websn01 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: devvnet
  name: 'dev-use2-net-web-sn01'
  properties: {
    addressPrefix: '10.2.10.0/26'
  }
}

resource dbsn01 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: devvnet
  name: 'dev-use2-net-db-sn01'
  properties: {
    addressPrefix: '10.2.10.64/26'
  }
}

resource appsn01 'Microsoft.Network/virtualNetworks/subnets@2022-09-01' = {
  parent: devvnet
  name: 'dev-use2-net-app-sn01'
  properties: {
    addressPrefix: '10.2.10.128/26'
  }
}



