﻿#ScriptRoot
if ($PSVersionTable.PSVersion.Major -gt 2) {
$ScriptRoot = $PSScriptRoot
}
else {
$ScriptRoot = split-path -parent $MyInvocation.MyCommand.Definition
}



Install-Module -Name AzureAD

Get-Module AzureAD
Connect-AzureAD



$NewGroups = Import-Csv -Path "$ScriptRoot/ExampleFiles/CreateNewGroups.csv" -Delimiter ";"



#$NewGroups

$i =0
while ($i -lt $NewGroups.length){

    Write-Host -ForegroundColor Yellow " "
    Write-Host -ForegroundColor Yellow " "
    Write-Host -ForegroundColor Yellow " "
    Write-Host -ForegroundColor Yellow "Next Group:"
    


    #$NewGroups[$i]



    $GroupCreated = New-AzureADGroup -DisplayName $NewGroups[$i].GroupDisplayName -MailEnabled $false -MailNickName $NewGroups[$i].GroupDisplayName -SecurityEnabled $true

    $GroupCreated
    
    $i++;
}