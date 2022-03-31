# creator: Skyfay
# Last edit: 31.03.2022

cls

################
## Funktionen ##
################


# Seriennummer ermitteln

function serialnumber {
    Write-Host "Die Seriennummer lautet:"
    wmic bios get serialnumber | Select -Index 2
    Start-Sleep -s 2
    echo "`t"
    Read-Host -Prompt "Um fortzufahren ENTER druecken"
    cls
}

# Hostname ändern

function hostrename {
    $newhostname = Read-Host "Wie lautet der neue Hostname?"
    if ($newhostname -eq "skip") {
        echo "Die unbenennung wurde ausgesetzt!"
        Start-Sleep -s 2
        cls
    }
    else {
        Rename-Computer -NewName $newhostname
        if ($error.Count -eq 0) {
            cls
            echo "Der Hostname wurde erfolgreich unbenannt!"
            Start-Sleep -s 2
        }
        else {
            cls
            echo "Es ist ein Fehler aufgetreten. Hast du das Script als Administrator ausgeführt?"
            Start-Sleep -s 5
        }
    }
    cls

}


########################
## Main Code Function ##
########################

## Guided Setup ##

function guided-setup {

# Begruessung

cls
echo "Willkommen beim Pc einrichtungs Setup :)"
Start-Sleep -s 3
echo "`t"
echo "Bitte beantworte die Fragen korrekt, da sonst am Ende Fehler entstehen koennen!"
Start-Sleep -s 5
echo "`t"
echo "Viel Spass mit dem Setup, Good Luck!"
Start-Sleep -s 3
cls
echo "Wenn du als eingabe 'skip' schreibst, wird diese Aufgabe uebersprungen"
Start-Sleep -s 4
cls
Start-Sleep -s 1

# Start - Seriennummer ausgabe

echo "Beginnen wir einmal mit der Seriennummer, welche du dir aufschreiben solltest."
Start-Sleep -s 2
echo "`t"
serialnumber

# Hostname unbenennen

cls
Start-Sleep -s 1
echo "Als naechstest wollen wir den Hostname unbenennen"
Start-Sleep -s 2
echo "`t"
hostrename


}

## Single Setup ##

function single-setup {
    
    cls
    echo "Willkommen beim Single Setup Modus :)"
    Start-Sleep -s 2
    echo "`t"
    while ($true) {
    echo "Hier sind die moeglichen Setups:"
    Start-Sleep -s 1
    echo "`t"
    echo "(1) Seriennummer anzeigen lassen"
    echo "(2) Hostname unbenennen"
    echo "`t"
    $ssnumber = Read-Host "Welche Aufgabe möchtest du Starten?"
    cls
    if ($ssnumber -eq 1) {
        serialnumber
    }
    if ($ssnumber -eq 2) {
        hostrename
    }
} #while
} #function

################
## Main Code ##
################

echo "Willkommen beim Skyfay Windows Script"
Start-Sleep -s 2
echo "`t"
while ($true) {
echo "Was moechtest du starten?"
Start-Sleep -s 1
echo "`t"
echo "(1) Gefuehrtes Setup Script"
echo "(2) Einzelne Windows Konfigurationen"
Start-Sleep -s 1
echo "`t"
$wichone = Read-Host "Bitte gebe die gewünschte Zahl ein"

if ($wichone -eq 1) {
    Start-Sleep -s 1
    guided-setup
} #if
if ($wichone -eq 2) {
    Start-Sleep -s 1
    single-setup
} #if
else {
    cls
    echo "Diese Eingabe hat nicht funktioniert. Bitte verwende einen existierenden Wert!"
    echo "`t"
} #else
} #while