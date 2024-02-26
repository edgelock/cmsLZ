targetScope = 'subscription'
param  azRegion string = 'eastus2'

param tags object = {}

// Everything in this template is deployed into a single RG.
param rgName string = 'devuse2rg'

//Make our Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: azRegion
  tags: tags
}
