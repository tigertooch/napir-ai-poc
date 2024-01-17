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

param allowedRules array = [
  {
    name: 'AllowSSH'
    properties: {
      priority: 1000
      access: 'Allow'
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: '22'
      destinationAddressPrefix: '*'
    }
  }
  {
    name: 'AllowHTTP'
    properties: {
      priority: 1010
      access: 'Allow'
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: '80'
      destinationAddressPrefix: '*'
    }
  }
]

param deniedRules array = [
  {
    name: 'DenyFTP'
    properties: {
      priority: 1100
      access: 'Deny'
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: '21'
      destinationAddressPrefix: '*'
    }
  }
  {
    name: 'DenySMTP'
    properties: {
      priority: 1110
      access: 'Deny'
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: '25'
      destinationAddressPrefix: '*'
    }
  }
]

output nsgName string = nsgName
output location string = location
output vnetName string = vnetName
output vnetAddressPrefix string = vnetAddressPrefix
output subnetinfo object=subnetconfig
output arrayRulesOutput array = union(allowedRules, deniedRules)


