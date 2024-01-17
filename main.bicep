// main.bicep
module vnetconfig 'resource/vnetconfig.bicep' = {
  name: 'vnetconfig'
}
module vnetModule 'modules/vnetModule.bicep' = {
  name: 'vnetModule'
  params: {
    nsgName: vnetconfig.outputs.nsgName
    location: vnetconfig.outputs.location
    vnetName: vnetconfig.outputs.vnetName
    vnetAddressPrefix: vnetconfig.outputs.vnetAddressPrefix
    subnetinfo: vnetconfig.outputs.subnetinfo
    arrayRulesOutput:vnetconfig.outputs.arrayRulesOutput
  }
}



