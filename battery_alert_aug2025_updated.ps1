$logPath = "E:\projects\batteryalert\log1.txt"

"Starting script at $(Get-Date)" | Out-File $logPath

# Get battery status
$battery = Get-WmiObject Win32_Battery
$charge = $battery.EstimatedChargeRemaining
$pluggedIn = $battery.BatteryStatus -eq 2

"Battery: $charge%, Plugged in: $pluggedIn" | Out-File $logPath -Append

# If plugged in and charge is above 50%
if ($pluggedIn -and $charge -gt 50) {
    try {
        # Import BurntToast module and send toast with unique identifier
        Import-Module BurntToast -ErrorAction Stop

        New-BurntToastNotification `
            -Text "Battery Alert", "Battery is at $charge% and still plugged in. Consider unplugging." `
            -UniqueIdentifier "BatteryPluggedInWarning"

        "Notification sent at $(Get-Date)" | Out-File $logPath -Append
    } catch {
        "Failed to send toast notification: $_" | Out-File $logPath -Append
    }
} else {
    "No notification sent: PluggedIn = $pluggedIn, Charge = $charge%" | Out-File $logPath -Append
}

"Ending script at $(Get-Date)" | Out-File $logPath -Append
