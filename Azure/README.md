# Azure MineCoin

Use Azure VM scale set to mine coins.

## Note

- The Azure user account subscription MUST BE `Pay-As-You-Go`, that means `Offer ID` MUST BE `MS-AZR-0003P`. If you account is upgraded from `Free Tier`, then you cannot create spot VMs, so you must create a `Pay-As-You-Go` subscription.

- You need to increase service limit quotas, that means you need to open some support tickets to increase Compute-VM (cores-vCPUs) subscription limit.

```
Resource Manager, EASTUS, NCSv3 Series / 24
Resource Manager, EASTUS2, NCSv3 Series / 24
Resource Manager, SOUTHCENTRALUS, NCSv3 Series / 24
Resource Manager, WESTUS2, NCSv3 Series / 24
Resource Manager, WESTUS, NCSv3 Series / 24

Resource Manager, EASTUS, Spot / 24
Resource Manager, EASTUS2, Spot / 24
Resource Manager, SOUTHCENTRALUS, Spot / 24
Resource Manager, WESTUS, Spot / 24
Resource Manager, WESTUS2, Spot / 24
```