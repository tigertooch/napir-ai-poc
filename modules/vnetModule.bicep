// modules/vnet.bicep

param location string
param vnetName string
param vnetAddressPrefix string
param subnetinfo object
param nsgName string


resource nsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
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
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  dependsOn:[nsg]
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = [for item in items(subnetinfo): {
  name: item.value.subnetName
  parent:vnet
  properties: {
    addressPrefix: item.value.subnetAddressPrefix
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}]


output vnetId string = vnet.id
