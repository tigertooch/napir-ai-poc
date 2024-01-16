// resource/vnet_config.bicep

param location string = 'Japan East'
param vnetName string = 'testVNet'
param vnetAddressPrefix string = '173.168.0.0/24'

output location string = location
output vnetName string = vnetName
output vnetAddressPrefix string = vnetAddressPrefix
