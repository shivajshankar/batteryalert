# Battery Alert System

This project contains scripts to monitor and alert on battery status in Windows 10.

## Prerequisites
- Windows 10
- NSSM (Non-Sucking Service Manager)

## Installation

1. Download and install NSSM from [https://nssm.cc/](https://nssm.cc/)

## Scheduling loopRunner.ps1 as a Windows Service

To schedule `loopRunner.ps1` permanently in Windows 10 using NSSM:

1. First, verify if the service is already installed:
   ```powershell
   Get-WmiObject Win32_Service | Where-Object { $_.PathName -like "*nssm*" } | Select-Object Name, DisplayName, PathName
   ```
   Example output:
   ```
   Name                DisplayName              PathName
   ----                -----------              --------
   BatteryMonitor      Battery Charging Monitor D:\softwares\nssm-2.24\win64\nssm.exe
   ```

2. Install the service (run as Administrator):
   ```powershell
   & "D:\softwares\nssm-2.24\win64\nssm.exe" install BatteryMonitor "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "-ExecutionPolicy Bypass -File E:\projects\batteryalert\loopRunner.ps1"
   ```

3. Configure the service (optional):
   ```powershell
   & "D:\softwares\nssm-2.24\win64\nssm.exe" edit BatteryMonitor
   ```

4. Start the service:
   ```powershell
   & "D:\softwares\nssm-2.24\win64\nssm.exe" start BatteryMonitor
   ```

5. To stop the service:
   ```powershell
   & "D:\softwares\nssm-2.24\win64\nssm.exe" stop BatteryMonitor
   ```

## Notes
- Make sure to run PowerShell commands with Administrator privileges
- The service will start automatically with Windows if set to Automatic startup type
- Check Windows Event Viewer for any service-related errors


<img width="443" height="211" alt="image" src="https://github.com/user-attachments/assets/00d2f22f-140d-4f03-8d23-7b1c55a2c826" />

<img width="326" height="177" alt="image" src="https://github.com/user-attachments/assets/0a2f0e5e-0f90-4ee9-90e6-a42dbf1a4991" />



