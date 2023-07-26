Import-Module -Name C:\Users\Philip\git\PowerShell-Scripts\modules\PSWinform.psm1 -Force

$TestForm = Initialize-Form -Text "Form Text" -Name "Form Name" -Width 400 -Height 400
$TestButtonClick = {
    Write-Host "Clicked from scriptblock variable"
}
$TestButton = Initialize-Button -Form $TestForm -Name "ButtonText" -Text "BtnText" -Width 70 -Height 20 -Xpos 55 -Ypos 55 -Click $TestButtonClick

Show-Form -Form $TestForm
