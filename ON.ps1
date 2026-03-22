[Byte[]] $powerOn = 0xA0, 0x01, 0x01, 0xA2
[Byte[]] $powerOff = 0xA0, 0x01, 0x00, 0xA1
$fluxcap = new-Object System.IO.Ports.SerialPort COM3,9600,None,8,one
$fluxcap.Open()
$fluxcap.Write($powerOn, 0, $powerOn.Count)
$fluxcap.Close()