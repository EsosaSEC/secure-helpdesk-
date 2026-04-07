Import-Module ActiveDirectory

$username = Read-Host "Enter username"
$newPassword = Read-Host "Enter new password" -AsSecureString

Set-ADAccountPassword -Identity $username -Reset -NewPassword $newPassword
Set-ADUser -Identity $username -ChangePasswordAtLogon $true

Write-Host "Password reset successful for $username"
