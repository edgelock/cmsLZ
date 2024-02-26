param location string = resourceGroup().location
param vmName string = 'testazvm01'
param networkInterfaceName string = 'nic-${vmName}'
param enableAcceleratedNetworking bool = false
param subnetName string = 'az-res-poc-3cloud-db-vnet01'
param virtualNetworkId string = '/subscriptions/93d50d3f-57cf-419e-94f8-603fa8c3d9c7/resourceGroups/rg-rel-usc-mgmt-01/providers/Microsoft.Network/virtualNetworks/vnet-usc-mgmt-01'
param virtualMachineName string = '${vmName}'
param virtualMachineComputerName string ='${vmName}'
param virtualMachineRG string = 'az-rg-prd-hub'
param osDiskType string = 'Standard_LRS'
param osDiskDeleteOption string = 'Delete'
param virtualMachineSize string = 'Standard_D2s_v3'
param nicDeleteOption string = 'Delete'
param adminUsername string = '${vmName}'

@secure()
param adminPassword string = 'Pc!C0mpl!@nce'
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
    licenseType: 'Windows_Server'
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
        sku: '2022-Datacenter'
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

