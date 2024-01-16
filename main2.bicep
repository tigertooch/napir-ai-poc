// main.bicep

module vnetconfig 'resource/vnetconfig.bicep' = {
  name: 'vnetconfig'
}
module subnetconfig 'resource/subnetsConfig.bicep' = {
  name: 'subnetconfig'
}
module subnetModule 'modules/subnet.bicep' = {
  name: 'subnetModule'
  params: {
    subnetinfo: subnetconfig.outputs.subnetinfo
    vnetName: vnetconfig.outputs.vnetName
  }
}
