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

var allowRuleList = [
                      {name: 'AllowSSH',priority: 1000,access: 'Allow',destinationPortRange: '22'}
                      {name: 'AllowHTTP' ,priority: 1010,access: 'Allow',destinationPortRange: '80'}
                    ]
var allowedRules = [
  for rule in allowRuleList: {
    name: rule.name
    properties: {
      priority: rule.priority
      access: rule.access
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: rule.destinationPortRange
      destinationAddressPrefix: '*'
    }
  }
]

var denyRuleList = [
                    {name: 'DenyFTP',priority: 1100,access: 'Deny',destinationPortRange: '21'}
                    {name: 'DenySMTP',priority: 1110,access: 'Deny',destinationPortRange: '25'}
                    ]
var deniedRules = [
  for rule in denyRuleList: {
    name: rule.name
    properties: {
      priority: rule.priority
      access: rule.access
      direction: 'Inbound'
      protocol: 'Tcp'
      sourcePortRange: '*'
      sourceAddressPrefix: '*'
      destinationPortRange: rule.destinationPortRange
      destinationAddressPrefix: '*'
    }
  }
]

output nsgName string = nsgName
output location string = location
output vnetName string = vnetName
output vnetAddressPrefix string = vnetAddressPrefix
output subnetinfo object=subnetconfig
output rulesinfo array = union(allowedRules, deniedRules)






