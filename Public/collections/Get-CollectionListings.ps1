<#
.SYNOPSIS
    Get listings of a collection
.PARAMETER Symbol
    (Required) collection symbol
.PARAMETER Offset
    The number of items to skip, default 0
.PARAMETER Limit
    The numbers of items to return, default 20, max 20
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-CollectionListings {
    param(
        [Parameter(Mandatory=$false)]
        [string]
        $Symbol,

        [Parameter(Mandatory=$false)]
        [Int16]
        $Offset = 0,

        [Parameter(Mandatory=$false)]
        [Int16]
        $Limit = 20,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/collections/$Symbol/listings?offset=$Offset&limit=$Limit"}
        "Devnet" {$api = "$DevnetAPI/collections/$Symbol/listings?offset=$Offset&limit=$Limit"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}