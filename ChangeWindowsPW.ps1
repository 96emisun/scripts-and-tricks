# Prompt for the current password
$currentPassword = Read-Host -Prompt "Enter your current password"

# Prompt for the new password
$newPassword = Read-Host -Prompt "Enter your new password" -AsSecureString

# Prompt for the new password to be confirmed
$confirmPassword = Read-Host -Prompt "Confirm your new password" -AsSecureString

# Compare the two new password inputs to verify they match
if ($newPassword -eq $confirmPassword)
{
    # Set the new password for the current user
    $user = [Security.Principal.WindowsIdentity]::GetCurrent()
    $user.WindowsIdentity.SetPassword($newPassword)

    # Display a message indicating that the password was changed successfully
    Write-Host "Your password has been changed successfully."
}
else
{
    # Display an error message indicating that the passwords do not match
    Write-Host "Error: The new password and the confirmed password do not match. The password was not changed."
}
