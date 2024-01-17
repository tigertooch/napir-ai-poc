// resource/vnet_config.bicep
param nsgName string = 'security_group_for_test'
param location string = 'Japan East'
param vnetName string = 'testVNet'
param vnetAddressPrefix string = '173.168.0.0/24'
param subnetconfig object = {
  nsg1: {
    subnetName: 'testSubnet1'
    subnetAddressPrefix: '173.168.0.0/25'
  }
  nsg2: {
    subnetName: 'testSubnet2'
    subnetAddressPrefix: '173.168.0.128/25'
  }
}
output nsgName string = nsgName
output location string = location
output vnetName string = vnetName
output vnetAddressPrefix string = vnetAddressPrefix
output subnetinfo object=subnetconfig


