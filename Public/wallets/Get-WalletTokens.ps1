<#
.SYNOPSIS
    Get tokens owned by a wallet.
.PARAMETER WalletAddress
    Mint address of the token
.PARAMETER Offset
    The number of items to skip, default 0
.PARAMETER Limit
    The numbers of items to return, default 100, max 500
.PARAMETER ListedOnly
    Whether to only return listed tokens
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-WalletTokens {
    param(
        [Parameter(Mandatory=$true)]
        [String]
        $WalletAddress,

        [Parameter(Mandatory=$false)]
        [Int16]
        $Offset = 0,

        [Parameter(Mandatory=$false)]
        [Int16]
        $Limit = 100,

        [Parameter(Mandatory=$false)]
        [switch]
        $ListedOnly,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/wallets/$WalletAddress/tokens?offset=$Offset&limit=$Limit&listedOnly=$ListedOnly"}
        "Devnet" {$api = "$DevnetAPI/wallets/$WalletAddress/tokens?offset=$Offset&limit=$Limit&listedOnly=$ListedOnly"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}