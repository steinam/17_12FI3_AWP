class Computer{

    [string]$macadresse
    [string]$osname
    [string]$hostname

    Computer()
    {
	    $mac = get-wmiobject -class "Win32_NetworkAdapterConfiguration" | Where {$_.IpEnabled -Match "True"} | Select MacAddress
        #Auswahl der ersten aktiven Macadresse, daher Zugriff auf die nullte Stelle des möglichen Arrays
	    $this.macadresse = $mac[0].MacAddress
	    $this.osname = (Get-WmiObject Win32_OperatingSystem).Name
	    $this.hostname = (Get-WmiObject Win32_OperatingSystem).CSName
    }
}
