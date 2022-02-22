# MagicEden-Powershell
This is a Powershell Core module for interacting with the Magic Eden Marketplace API right from your Windows shell! With ease!

Returns Powershell Objects unfiltered. Meaning this is a base layer action set that can be built on. I will also be building a toolkit for additional jobs as functionality is added

All parameters work as powershell flags. Try it with -Offset -Limit. 

## Install
1. Clone this repo
2. Import Module with `Import-Module .\MagicEden-API.psm1`     

## Example
`Get-TokenMetadata -MintAddress <mint_address> -Network mainnet`
