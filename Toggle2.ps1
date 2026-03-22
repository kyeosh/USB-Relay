[Byte[]] $powerOn = 0xA0, 0x01, 0x01, 0xA2
[Byte[]] $powerOff = 0xA0, 0x01, 0x00, 0xA1
$fluxcap = new-Object System.IO.Ports.SerialPort COM3,9600,None,8,one
$statefile = "C:\Users\Playa\fluxcap\fluxstate.txt"

if (Test-Path $statefile) {
    $currentState = Get-Content $statefile
} else {
    $currentState = "0"
}

try {
    $fluxcap.Open()

    if ($currentState -eq "0") {
        Write-Host "Sending Power ON command"
        $fluxcap.Write($powerOn, 0, $powerOn.Count)
        $nextState = "1"
    } else {
        Write-Host "Sending Power OFF command"
	$fluxcap.Write($powerOff, 0, $powerOff.Count)
	$nextState = "0"
    }
    Set-Content $statefile $nextState

    $fluxcap.Close()
}
finally {
    if ($fluxcap.IsOpen) {
        $fluxcap.Close()
    }
}