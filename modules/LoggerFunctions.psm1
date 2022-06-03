Function Write-Log {
    Param(
        [String] $logMessage,
        [String] $logFile
    )
    $timeStampFormat = "MM/dd/yyyy HH:mm"
    $timeStamp = Get-Date -Format $timeStampFormat

    $finalMessage = "$($timeStamp) - $($logMessage)"
    Add-Content -Path $logFile -Value $finalMessage
}

Function Log-Info {
    Param(
        [String] $logMessage,
        [String] $logFile
    )
    $message = "INFO - $($logMessage)"
    Write-Log -logMessage $message -logFile $logFile
}

Export-ModuleMember -Function Write-Log, Log-Info
