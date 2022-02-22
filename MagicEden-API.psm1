<#
    .Synopsis
        This is the parent modulescript that connects all the dots
#>
$Script:MainnetAPI = "https://api-mainnet.magiceden.dev/v2"
$Script:DevnetAPI = "https://api-devnet.magiceden.dev/v2"

$Public = @( Get-ChildItem -Path ".\Public\*\*.ps1" -ErrorAction SilentlyContinue )

foreach ($import in $Public) {
    try {
        . $import.FullName
    } catch {
        Write-Error -Message "Failed to import function: $($import.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName