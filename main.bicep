// main.bicep

param location string = 'Japan East'
param vnetName string = 'myVNet'
param subnetName string = 'mySubnet'
param vnetAddressPrefix string = '172.16.0.0/24'
param subnetAddressPrefix string = '172.16.0.0/28'

module vnetModule 'modules/vnet.bicep' = {
  name: 'myVNetModule'
  params: {
    location: location
    vnetName: vnetName
    subnetName: subnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnetAddressPrefix: subnetAddressPrefix
  }
}

output vnetId string = vnetModule.outputs.vnetId
