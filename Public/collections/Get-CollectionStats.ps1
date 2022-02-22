<#
.SYNOPSIS
    Get stats of a collection
.PARAMETER Symbol
    (Required) collection symbol
.PARAMETER Network
    Network to use. Choices are mainnet and devnet.
#>
function Get-Collections {
    param(
        [Parameter(Mandatory=$false)]
        [string]
        $Symbol,

        [Parameter(Mandatory=$true)]
        [ValidateSet("Devnet", "Mainnet")]
        [String]
        $Network
    )

    switch ($Network) {
        "Mainnet" {$api = "$MainnetAPI/collections/$Symbol/stats"}
        "Devnet" {$api = "$DevnetAPI/collections/$Symbol/stats"}
    }
    try {
        $response = Invoke-RestMethod -Uri $api
        return $response
    } catch {
        $_
    }
}