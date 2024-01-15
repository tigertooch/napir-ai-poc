// resource/vnet_config.bicep

param location string = 'Japan East'
param vnetName string = 'myVNet'
param subnetName string = 'mySubnet'
param vnetAddressPrefix string = '172.16.0.0/24'
param subnetAddressPrefix string = '172.16.0.0/28'

output location string = location
output vnetName string = vnetName
output subnetName string = subnetName
output vnetAddressPrefix string = vnetAddressPrefix
output subnetAddressPrefix string = subnetAddressPrefix
