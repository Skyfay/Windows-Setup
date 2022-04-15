# creator: Skyfay
# Last edit: 15.04.2022 12:43

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

#function guided-setup {

# Begruessung
function begruessung-guide {
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
}

# Start - Seriennummer ausgabe
function serialnumber-guide {
echo "Beginnen wir einmal mit der Seriennummer, welche du dir aufschreiben solltest."
Start-Sleep -s 2
echo "`t"
serialnumber
}

# Hostname unbenennen
function hostrename-guide {
cls
Start-Sleep -s 1
echo "Als naechstest wollen wir den Hostname unbenennen"
Start-Sleep -s 2
echo "`t"
hostrename
}

#} # end


## Guided Setup New ##
function guided-setup-new {
begruessung-guide

serialnumber-guide
New-Item -Path 'C:\skyfay.txt' -ItemType File
Add-Content C:\skyfay.txt "Task-02"

hostrename-guide
Clear-Content C:\skyfay.txt 
Add-Content C:\skyfay.txt "Task-03"
}

## Guided Setup Resume ##
function guided-setup-resume {
switch (Get-Content C:\skyfay.txt) {
    
    "Task-02" {
        hostrename-guide
    }
    "Task-03" {
        echo "Task xy"
        echo "Task zz"
        echo "Task pp"
        Start-Sleep -s 10
    }

} #swithc
} #function

## Guided Setup Main ##

function guided-setup-main {

$database_txt = "C:\skyfay.txt"

switch (Test-Path -Path $database_txt -PathType Leaf) {

    "True" {
        cls
        #echo "Ich habe weiter gemacht, wo ich aufgehört habe"
        #Start-Sleep -s 10
        guided-setup-resume
    }
    "False" {
        cls
        #echo "Ich beginne von neuem"
        #Start-Sleep -s 10
        guided-setup-new
    }
    Default {
        cls
        echo "Es ist ein Fehler aufgetreten. Versuchen Sie es erneut"
        Start-Sleep -s 10
    }

} #swtich
} # end





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
    switch ($ssnumber) {
        1 {serialnumber}
        2 {hostrename}
        Default {Bitte gib eine Nummer zwischen 1-2 ein!}
    }#switch
} #while
} #function

################
## Main Code ##
################

echo "Willkommen beim Skyfay Windows Script"
Start-Sleep -s 2
while ($true) {
$test_alreadyused = Test-Path -Path C:\skyfay.txt -PathType Leaf
if ($test_alreadyused -eq "true") {
    cls
    $resume = Read-Host "Möchtest du beim Setup Script fortfahren? Dann schreibe (Y) für Ja, oder (N) für Nein:"
    if ($resume -eq "Y" -Or $resume -eq "y") {
        Start-Sleep -s 1
        guided-setup-main
    } #if
    else {
        Remove-Item C:\skyfay.txt
    } #else
} #if
else {
echo "`t"
echo "Was moechtest du starten?"
Start-Sleep -s 1
echo "`t"
echo "(1) Gefuehrtes Setup Script"
echo "(2) Einzelne Windows Konfigurationen"
Start-Sleep -s 1
echo "`t"
$wichone = Read-Host "Bitte gebe die gewünschte Zahl ein"

switch ($wichone) {
    1 {
        Start-Sleep -s 1
        guided-setup-main
    }
    2 {
        Start-Sleep -s 1
        single-setup
    }
    Default {
        cls
        echo "Diese Eingabe hat nicht funktioniert. Bitte verwende einen existierenden Wert!"
    }
} #switch
} #else alreadyused
} #while
