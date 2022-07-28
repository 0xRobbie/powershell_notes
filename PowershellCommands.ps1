Get-Command
Get-Help
Get-Member

Get-Command -Noun File*
Get-Command -Verb Get -Noun File*
Get-Help -Name 'name-of-command'
Update-Help -UICulture en-US -Verbose
Get-Help -Name Get-FileHash
Get-Help Get-FileHash -Examples

Get-Process -Name 'name-of-process' | Get-Member
Get-Command -ParameterType Process

Get-Process
Get-Process -Name 'selected-process-name' | Get-Member
Get-Command -ParameterType Process
Get-Process WhatsApp | Format-List -Property *
Get-Process WhatsApp | Get-Member -Name C*
Get-Process WhatsApp | Select-Object -Property Id, Name, CPU
Get-Process | Sort-Object -Descending -Property Name
Get-Process | Sort-Object -Descending -Property Name, CPU
Get-Process 'WhatsApp' | Sort-Object -Property @{Expression = "Name"; Descending = $True}, @{Expression = "CPU"; Descending = $False}
Get-Process | Where-Object CPU -gt 2 | Sort-Object CPU -Descending | Select-Object -First 3

Get-Process | Select-Object Name | Where-Object Name -eq 'WhatsApp'     # Bad Instruction
Get-Process | Where-Object Name -eq WhatsApp | Select-Object Name       # God Instruction
Get-Process -Name WhatsApp | Select-Object Name                         # Better Instruction

Get-Process 'WhatsApp' | Select-Object Name, CPU | Get-Member
Get-Process 'WhatsApp' | Format-Table Name,CPU | Get-Member

Get-Process 'WhatsApp' | Format-Table Name,CPU | Select-Object Name, CPU    # Bad Instruction
Get-Process 'WhatsApp' | Select-Object Name, CPU                            # Better Instruction

Format-Table
Format-List

New-Item HelloWorld.ps1
code HelloWorld.ps1
Write-Output 'Hello World!'
. ./HelloWorld.ps1


$name = Read-Host -Prompt "Please enter your name"
Write-Output "Congratulations $name! You have written your first code with PowerShell!"

Get-Help -Name 'Write-Output' -Full

$date = Read-Host "What is today's date"
$name = Read-Host "Please enter your name"
Write-Output "Today's date is $date."
Write-Output "Today is the day $name began their PowerShell programming journey."

pwsh
$Profile | Select-Object *

New-Item `
  -ItemType "file" `
  -Value 'Write-Host "Hello <replace with your name>, welcome back" -foregroundcolor Green ' `
  -Path $Profile.CurrentUserCurrentHost -Force

  Param(
    [string]$Path = './app',
    [string]$DestinationPath = './'
  )
  
  $date = Get-Date -format "yyyy-MM-dd"
  Compress-Archive -Path './app' -CompressionLevel 'Fastest' -DestinationPath "./backup-$date"
  Write-Host "Created backup at $('./backup-' + $date + '.zip')"


  Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)
If (-Not (Test-Path $Path)) 
{
  Throw "The source directory $Path does not exist, please specify an existing directory"
}
$date = Get-Date -format "yyyy-MM-dd"
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
If (-Not (Test-Path $DestinationFile)) 
{
  Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
  Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')"
} Else {
  Write-Error "Today's backup already exists"
}