# Run: 
#   powershell -ExecutionPolicy Bypass -File test.ps1
# to start the program

Do {

    $Option = Read-Host "a) Create Local User b) Rename Local User c) Remove Local User d) Exit"
    
    if ($Option -eq 'd') {
        Write-Output 'Goodbye.'
        break
    }

    switch ($Option)
    {
        'a' {
                $name = Read-Host 'What is your username?'
                $pass = Read-Host 'What is your password?' -AsSecureString

                New-LocalUser cmdlet -Name $name -Password $pass
                Add-LocalGroupMember cmdlet -Group "Users" -Member $name
                Write-Output 'New user has been added.'
            }
        'b' {
                $currName = Read-host 'What is your username?' 
                $newName = Read-Host 'What is your new username?'

                Rename-LocalUser -Name $currName -NewName $newName
                Write-Output 'Username has been renamed.'
            }
        'c' {
                $name = Read-Host 'What is the username to be deleted?'

                Remove-LocalUser -Name $name
                Write-Output 'Username has been deleted.'
            }

        default{"Invalid option."}
    }

} While ($true)

