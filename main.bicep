// main.bicep
module vnetconfig 'resource/vnetconfig.bicep' = {
  name: 'vnetconfig'
}
// module subnetconfig 'resource/subnetsConfig.bicep' = {
//   name: 'subnetconfig'
// }
module vnetModule 'modules/vnet.bicep' = {
  name: 'vnetModule'
  params: {
    location: vnetconfig.outputs.location
    vnetName: vnetconfig.outputs.vnetName
    vnetAddressPrefix: vnetconfig.outputs.vnetAddressPrefix
  }
}
// module subnetModule 'modules/subnet.bicep' = {
//   name: 'subnetModule'
//   params: {
//     subnetinfo: subnetconfig.outputs.subnetinfo
//     vnetName: vnetconfig.outputs.vnetName
//   }
// }

