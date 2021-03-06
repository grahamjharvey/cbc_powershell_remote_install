$installer = "installer_vista_win7_win8-64-3.7.0.1253.msi"
$computers = Get-Content -Path Computers.txt
foreach ($pc in $computers) {
    Copy-Item -Path $installer -Destination "\\$pc\c$\Windows\Temp" -Force -Recurse
    Invoke-Command -ComputerName $pc -ScriptBlock {Start-Process c:\windows\system32\msiexec.exe -ArgumentList '/q /i c:\windows\temp\installer_vista_win7_win8-64-3.7.0.1253.msi /L* c:\windows\temp\log.txt COMPANY_CODE=<INSERT YOUR COMPANY CODE HERE> CLI_USERS=<INSERT WINDOWS SID HERE>' -wait}
    Remove-Item -Path "\\$pc\c$\Windows\Temp\installer_vista_win7_win8-64-3.7.0.1253.msi" -Force
}
