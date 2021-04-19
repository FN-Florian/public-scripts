#ScriptRoot
if ($PSVersionTable.PSVersion.Major -gt 2) {
$ScriptRoot = $PSScriptRoot
}
else {
$ScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
}



Install-Module -Name AzureAD

Get-Module AzureAD
Connect-AzureAD



$UserResetList = Import-Csv -Path "$ScriptRoot/ExampleFiles/UserPasswordResetList.csv" -Delimiter ";"


$UserResetList


$i =0
while ($i -lt $UserResetList.length){
 
    $password = ConvertTo-SecureString $UserResetList[$i].Password -AsPlainText -Force

    Set-AzureADUserPassword -ObjectId $UserResetList[$i].ObjectID -Password $password
    

    Write-Host -ForegroundColor Yellow "SetPassword for "$UserResetList[$i].ObjectID

    $i++;
}
