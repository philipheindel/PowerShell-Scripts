Import-Module -Name C:\Users\Philip\git\PowerShell-Scripts\modules\LoggerFunctions.psm1 -Force

$log = "C:\Users\Philip\git\PowerShell-Scripts\modules\out.log"

Log-Info -logMessage "This is a test info log" -logFile $log