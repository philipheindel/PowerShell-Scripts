Add-Type -assembly System.Windows.Forms

Import-Module -Name C:\Users\Philip\git\PowerShell-Scripts\modules\GUIFunctions.psm1

$mainForm = New-Object System.Windows.Forms.Form

$newButton = New-Component -type "Button" -text "Test Button" -x 20 -y 100 -w 150 -h 50 -parent $mainForm
$newLabel = New-Component -type "label" -text "LabeL!!!" -parent $mainForm

$mainForm.FormBorderStyle = 2

$mainForm.ShowDialog()
