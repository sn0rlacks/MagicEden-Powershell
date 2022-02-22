<#
.SYNOPSIS
    Get listings for a token / NFT.
.PARAMETER MintAddress
    Mint address of the token / NFT
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-Listing {
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
        "Mainnet" {$api = "$MainnetAPI/tokens/$MintAddress/listings"}
        "Devnet" {$api = "$DevnetAPI/tokens/$MintAddress/listings"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}