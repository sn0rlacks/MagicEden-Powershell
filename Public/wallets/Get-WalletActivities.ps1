<#
.SYNOPSIS
    Get activities of a wallet.
.PARAMETER WalletAddress
    Mint address of the token
.PARAMETER Offset
    The number of items to skip, default 0
.PARAMETER Limit
    The numbers of items to return, default 100, max 500
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-WalletActivities {
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

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/wallets/$WalletAddress/activities?offset=$Offset&limit=$Limit"}
        "Devnet" {$api = "$DevnetAPI/wallets/$WalletAddress/activities?offset=$Offset&limit=$Limit"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}