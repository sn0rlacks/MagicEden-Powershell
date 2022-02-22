<#
.SYNOPSIS
    Get token metadata by mint address
.PARAMETER MintAddress
    Mint address of the token
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-TokenMetadata {
    param(
        [Parameter(Mandatory=$true)]
        [String]
        $MintAddress,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/tokens/$MintAddress"}
        "Devnet" {$api = "$DevnetAPI/tokens/$MintAddress"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}