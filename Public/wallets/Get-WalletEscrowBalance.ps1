<#
.SYNOPSIS
    Get escrow balance for a wallet.
.PARAMETER WalletAddress
    Mint address of the token
.PARAMETER Offset
    The number of items to skip, default 0
.PARAMETER Limit
    The numbers of items to return, default 100, max 500
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-WalletEscrowBalance {
    param(
        [Parameter(Mandatory=$true)]
        [String]
        $WalletAddress,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/wallets/$WalletAddress/offers_made?offset=$Offset&limit=$Limit&listedOnly=$ListedOnly"}
        "Devnet" {$api = "$DevnetAPI/wallets/$WalletAddress/offers_made?offset=$Offset&limit=$Limit&listedOnly=$ListedOnly"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}