$logFile = "E:\projects\batteryalert\log2.txt"
$scriptPath = "E:\projects\batteryalert\battery_alert_aug2025_updated.ps1"

while ($true) {
    # Overwrite log.txt at the beginning of each loop
    "Starting battery check at $(Get-Date)" | Out-File $logFile

    & $scriptPath

    # Append the end message
    "Finished battery check at $(Get-Date)" | Out-File $logFile -Append

    Start-Sleep -Seconds 1800  # 30 minutes
}
