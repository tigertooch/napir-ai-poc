// main.bicep
module vnetConfig 'resource/vnetConfig.bicep' = {
  name: 'vnetConfig'
}
module vnetModule 'modules/vnet.bicep' = {
  name: 'myVNetModule'
  params: {
    location: vnetConfig.outputs.location
    vnetName: vnetConfig.outputs.vnetName
    subnetName: vnetConfig.outputs.subnetName
    vnetAddressPrefix: vnetConfig.outputs.vnetAddressPrefix
    subnetAddressPrefix: vnetConfig.outputs.subnetAddressPrefix
  }
}

output vnetId string = vnetModule.outputs.vnetId
