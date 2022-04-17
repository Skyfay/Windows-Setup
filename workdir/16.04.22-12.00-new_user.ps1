function new_user {
    $user_name = Read-Host "Wie soll der neue User heissen?"
    if ($user_name -eq "skip") {
        echo "Die unbenennung wurde ausgesetzt!"
        Start-Sleep -s 2
        cls
        }
        else {
            $user_pw_yn = Read-Host "Soll der neue Benutzer ein Passwort bekommen? (Y/J) fuer Ja, oder (N) für Nein: "
            if ($user_pw_yn -eq "Y" -Or $user_pw_yn -eq "y" -Or $user_pw_yn -eq "j" -Or $user_pw_yn -eq "J") {
            $user_pw = Read-Host -AsSecureString "Was für ein Passwort soll der User bekommen?"
            New-LocalUser $user_name -Password $user_pw -AccountNeverExpires -PasswordNeverExpires -UserMayNotChangePassword
            cls
            if ($error.Count -eq 0) {
                echo "Der Account wurde Erfolgreich erstellt"
                Start-Sleep -s 2
                $user_try_again = Read-Host "Moechtest du noch einen Benutzer erstellen? (Y/J) fuer Ja, oder (N) für Nein:"
                if ($user_try_again -eq "Y" -Or $user_try_agai -eq "y" -Or $user_try_agai -eq "j" -Or $user_try_agai -eq "J") {
                    cls
                    new-user
                }
                else {
                    cls
                    echo "Alles klar, es wird kein weiterer Benutzer erstellt."
                }
            } #if
            else {
                echo "Der Account konnte nicht erstellt werden. Gibt es diesen Benutzer bereits?"
                Start-Sleep -s 3
                $user_try_again = Read-Host "Moechtest du es noch einmal versuchen? (Y/J) fuer Ja, oder (N) für Nein:"
                if ($user_try_again -eq "Y" -Or $user_try_agai -eq "y" -Or $user_try_agai -eq "j" -Or $user_try_agai -eq "J") {
                    cls
                    new-user
                }
                else {
                    cls
                    echo "Alles klar, es wurde kein Benutzer erstellt."
                }
            } #else
            } #if
            else {
                New-LocalUser $user_name -NoPassword -AccountNeverExpires -PasswordNeverExpires
                cls
                if ($error.Count -eq 0) {
                echo "Der Account wurde Erfolgreich erstellt"
                Start-Sleep -s 2
                $user_try_again = Read-Host "Moechtest du noch einen Benutzer erstellen? (Y/J) fuer Ja, oder (N) für Nein:"
                if ($user_try_again -eq "Y" -Or $user_try_agai -eq "y" -Or $user_try_agai -eq "j" -Or $user_try_agai -eq "J") {
                    cls
                    new-user
                }
                else {
                    cls
                    echo "Alles klar, es wird kein weiterer Benutzer erstellt."
                }
            } #if
            else {
                echo "Der Account konnte nicht erstellt werden. Gibt es diesen Benutzer bereits?"
                Start-Sleep -s 3
                $user_try_again = Read-Host "Moechtest du es noch einmal versuchen? (Y/J) fuer Ja, oder (N) für Nein:"
                if ($user_try_again -eq "Y" -Or $user_try_agai -eq "y" -Or $user_try_agai -eq "j" -Or $user_try_agai -eq "J") {
                    cls
                    new-user
                } #if
                else {
                    cls
                    echo "Alles klar, es wurde kein Benutzer erstellt."
                }
            } 
        } #else
    
    } #else
    
} #function
cls
new_user
