
// modules/vnet.bicep
param location string
param vnetName string
param subnetName string
param vnetAddressPrefix string
param subnetAddressPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2023-06-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
}

output vnetId string = vnet.id
