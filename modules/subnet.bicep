// modules/subnet.bicep

param subnetinfo object
param vnetName string


resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' existing = {
  name: vnetName
}
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = [for item in items(subnetinfo): {
  name: item.value.subnetName
  parent: vnet
  properties: {
    addressPrefix: item.value.subnetAddressPrefix
  }
}]



