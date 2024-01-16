param subnetconfig object = {
  nsg1: {
    subnetName: 'subNet1'
    subnetAddressPrefix: '173.168.0.0/25'
  }
  nsg2: {
    subnetName: 'subNet2'
    subnetAddressPrefix: '173.168.0.128/25'
  }
}

output subnetinfo object=subnetconfig


