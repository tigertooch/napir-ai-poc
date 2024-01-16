// modules/vnet.bicep

param location string
param vnetName string
param vnetAddressPrefix string


resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}
output vnetId string = vnet.id
