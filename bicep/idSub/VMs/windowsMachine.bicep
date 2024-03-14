param location string = resourceGroup().location
param region string = 'eus2'
param environment string = 'id'
param suffix string = 'cms'
param num string = '02'
param networkInterfaceName string = 'nic-${region}-${environment}-${suffix}${num}'
param enableAcceleratedNetworking bool = false
param subnetName string = 'snet-${region}-${environment}-ad'
param virtualNetworkId string = '/subscriptions/a09a8713-400d-40cb-bcb3-65f2251e91da/resourceGroups/rg-eus2-id-nw/providers/Microsoft.Network/virtualNetworks/vnet-eus2-id-nw'
param virtualMachineName string = 'vm-${region}-${environment}-${suffix}'
param virtualMachineComputerName string ='vm${region}${environment}-${suffix}'
param virtualMachineRG string = 'hubuse2rg'
param osDiskType string = 'Standard_LRS'
param osDiskDeleteOption string = 'Delete'
param virtualMachineSize string = 'Standard_D2s_v5'
param nicDeleteOption string = 'Delete'
param adminUsername string = 'cmsadmin'


@secure()
param adminPassword string = 'Pc!C0mpl!@nc3'
param patchMode string = 'AutomaticByPlatform'
param enableHotpatching bool = false

var vnetId = virtualNetworkId
var vnetName = last(split(vnetId, '/'))
var subnetRef = '${vnetId}/subnets/${subnetName}'

resource networkInterface 'Microsoft.Network/networkInterfaces@2021-08-01' = {
  name: networkInterfaceName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetRef
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
    enableAcceleratedNetworking: enableAcceleratedNetworking
  }
  dependsOn: []
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: virtualMachineName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: virtualMachineSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'fromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
        deleteOption: osDiskDeleteOption
      }
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2016-datacenter-gensecond'
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
          properties: {
            deleteOption: nicDeleteOption
          }
        }
      ]
    }
    osProfile: {
      computerName: virtualMachineComputerName
      adminUsername: adminUsername
      adminPassword: adminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: true
        provisionVMAgent: true
        patchSettings: {
          enableHotpatching: enableHotpatching
          patchMode: patchMode
        }
      }
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
      }
    }
  }
}

output adminUsername string = adminUsername

