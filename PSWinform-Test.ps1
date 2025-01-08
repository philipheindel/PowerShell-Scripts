Import-Module -Name .\PSWinform.psm1 -Force

$frm = New-Form -Name "Test form" -Width "300"

Show-Form -Form $frm