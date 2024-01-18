// modules/vnetModule.bicep

param location string
param vnetName string
param vnetAddressPrefix string
param subnetinfo object
param nsgName string
param rulesinfo array

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: rulesinfo
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
