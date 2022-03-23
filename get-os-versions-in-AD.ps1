Get-ADComputer -Filter { OperatingSystem -Like '*Windows Server*' } -Properties OperatingSystem | Select Name, OperatingSystem | Format-Table -AutoSize