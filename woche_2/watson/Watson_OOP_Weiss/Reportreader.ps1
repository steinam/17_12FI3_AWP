cls
#Hauptscript, das die vorhandenen Klassen einbindet, jedoch selbst nicht OOP ist.

#Einbinden der Klassen
.'H:\AWP-11\Dr Watson\Loesung OOP_Weiss\User.ps1'
.'H:\AWP-11\Dr Watson\Loesung OOP_Weiss\Report.ps1'
.'H:\AWP-11\Dr Watson\Loesung OOP_Weiss\Computer.ps1'

#Skriptweit verfuegbare Listen
$Users = [System.Collections.ArrayList]::New()
[Computer]$pc = [Computer]::new();
$Reports = [System.Collections.ArrayList]::New()


#Funktionen, die im Rahmen des nachfolgenden Schleifendurchlaufs aufgerufen werden koennen
function getUsers()
{
	$temp =  Get-ChildItem "C:\Users" | Select-Object Name
    foreach($element in $temp)
    {
        #Neuen Nutzer erzeugen
        [User]$tempUser = [User]::new($element.name)

        #Nutzer des Liste hinzufuegen
        $bool=$Users.add($tempUser)
	}

	
	$daten = sqlLesen "SELECT * FROM user;";

	$tempArray = [System.Collections.ArrayList]::new();
	foreach($row in $daten.Tables[0].Rows){
		$bool = $tempArray.Add($row.ItemArray[1]);
	}
	
	#User mit DB abgleichen
	foreach($user in $Users){
		if(!$tempArray.Contains($user.name)){
			sqlAusfuehren "INSERT INTO user VALUES (null, `'$($user.name)`');"
		}
	}

	<#
    #Eingelesene Nutzer ausgeben
    foreach($User in $Users)
    {
        #Neuen Nutzer erzeugen
        write-host $User.name
	}
	#>
}

function getComputer()
{ 	
    write-host $pc.macadresse
    write-host $pc.osname
	write-host $pc.hostname
	
	#TODO Computer mit DB abgleichen
	$dataSet = sqlLesen "SELECT * FROM computer WHERE mac = `'$($pc.macadresse)`';"

    if($dataSet.Tables[0].Rows.Count -le 0){
        sqlAusfuehren "INSERT INTO computer VALUES (null, `'$($pc.macadresse)`', `'$($pc.osname)`', `'$($pc.hostname)`');"
    }
}


function getReports()
{
    #getUsers

	#Jeweils auf die vorhandenen Nutzer anwenden
	foreach($User in $Users)
	{
		$name= $User.name
        
		$path= "$env:SystemDrive\Users\$name\AppData\Local\Microsoft\Windows\WER\ReportArchive"

		if(Test-Path $path)
		{
			Write-Host "Nutzer $name " -BackgroundColor Green
			getSingleReportData($path)
		}
		
		$path= "$env:SystemDrive\Users\$name\AppData\Local\Microsoft\Windows\WER\ReportQueue"
		if(Test-Path $path)
		{
			getSingleReportData($path)
		}	
		
	}	
}


function getSingleReportData($path)
{
    $werdirectory= Get-ChildItem $path 

	if($werdirectory -ne $null)	
	{
        #Reportdetails je vorhandenen Report ermitteln 
		foreach($directory in $werdirectory)
		{
			$reportid=Select-String -Encoding Unicode -path  "$path\$directory\Report.wer" -AllMatch "ReportIdentifier" | select line 
		 	if ($reportid.Line -ne $null)
			{
				$reportidResult=$reportid.Line.Split("=")
				$reportid=$reportidResult[1]
				
			}
			else 
			{
				Write-Host "ReportId aufgrund Arraystruktur besonders erzeugen"
				$reportidResult=$reportid[1].Line.Split("=")
				$reportid=$reportidResult[1]
			}
			
			#Report-Type: Nicht jeder Report hat einen Report-type, sofern keiner gegeben, wird einer auf der Powershellschicht geschaffen
			#hier 99 fuer Non Critical
			$reporttype=Select-String -Encoding Unicode  -path  "$path\$directory\Report.wer" -AllMatch "ReportType" | select line 
			if ($reporttype.Line -ne $null)
			{
				$reporttypeResult=$reporttype.Line.Split("=")
				$reportType=$reporttypeResult[1]
			}
			else
			{
				$reporttype=99
			}
					
			$eventTime=Select-String -Encoding Unicode  -path  "$path\$directory\Report.wer" -SimpleMatch "EventTime" | select line 
			$eventTimeResult=$eventTime.Line.Split("=")
			$eventTime=$eventTimeResult[1]
			<#
				$time = [datetime]::FromFileTime(<EventTime>);
			#>
					
			$bucketid=Select-String -Encoding Unicode -path "$path\$directory\Report.wer" -SimpleMatch "Response.BucketID" | select line
			$bucketidResult=$bucketid.Line.Split("=")
			$bucketid=$bucketidresult[1]
				
			$AppName=Select-String -Encoding Unicode -path "$path\$directory\Report.wer" -SimpleMatch "AppName" | select line
			$AppNameResult=$AppName.Line.Split("=")
			$AppName=$AppNameresult[1]
			

            #Report erstellen und der Report-Liste hinzufuegen
            [Report]$tempReport = [Report]::new($reportid, $reporttype, $eventTime, $bucketid, $AppName)

            #Nutzer des Liste hinzufuegen
			$bool=$Reports.add($tempReport)
			
			#TODO Report in DB einfuegen
            $dataSet = sqlLesen "SELECT * FROM report WHERE reportID = `'$reportid`';"

            if($dataSet.Tables[0].Rows.Count -le 0){
				$time = [datetime]::FromFileTime($eventTime)
				#TODO
				$tmpUser = $path.Substring(9)
				$tmpUser = $tmpUser.Substring(0, $tmpUser.Length-50);
				$userID = sqlLesen "SELECT userID FROM user WHERE name = `'$tmpUser`';"
				$tmpComputer = sqlLesen "SELECT computerID FROM computer WHERE mac = `'$($pc.macadresse)`';"
                sqlAusfuehren "INSERT INTO report VALUES (`'$reportid`', `'$reportType`', `'$time`', `'$bucketid`', `'$AppName`', $($userID.Tables[0].Rows[0].ItemArray[0]), $($tmpComputer.Tables[0].Rows[0].ItemArray[0]));"
            }

            #Reportdaten ausgeben
            #$tempReport.reportid
		}
	}
}


function getStatistik()
{
    write-host "Implementierung folgt noch"
}

#Hilfsfunktionen
function sqlAusfuehren{
    Param(
        [Parameter(
        Mandatory = $true,
        ParameterSetName = '',
        ValueFromPipeline = $true)]
        [string]$Query
    )

    $MySQLAdminUserName = 'root'
    $MySQLAdminPassword = ''
    $MySQLDatabase = 'drwatson'
    $MySQLHost = '127.0.0.1'
    $ConnectionString = "server=" + $MySQLHost + ";port=3306;uid=" + $MySQLAdminUserName + ";pwd=" + $MySQLAdminPassword + ";database="+$MySQLDatabase

    Try {
        [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
        $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $Connection.ConnectionString = $ConnectionString
        $Connection.Open()

        $Command = New-Object MySql.Data.MySqlClient.MySqlCommand($Query, $Connection)
        $DataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($Command)
        $DataSet = New-Object System.Data.DataSet
        $RecordCount = $dataAdapter.Fill($dataSet, "data")
        $DataSet.Tables[0]
    }

    Catch {
        Write-Host "ERROR : Unable to run query : $query `n$Error[0]"
    }

    Finally {
        $Connection.Close()
    }
}

function sqlLesen{
	Param(
        [Parameter(
        Mandatory = $true,
        ParameterSetName = '',
        ValueFromPipeline = $true)]
        [string]$Query
	)
	
	$MySQLAdminUserName = 'root'
    $MySQLAdminPassword = ''
    $MySQLDatabase = 'drwatson'
    $MySQLHost = '127.0.0.1'
    $ConnectionString = "server=" + $MySQLHost + ";port=3306;uid=" + $MySQLAdminUserName + ";pwd=" + $MySQLAdminPassword + ";database="+$MySQLDatabase

    Try {
        [void][System.Reflection.Assembly]::LoadWithPartialName("MySql.Data")
        $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
        $Connection.ConnectionString = $ConnectionString
        $Connection.Open()

        $Command = New-Object MySql.Data.MySqlClient.MySqlCommand($Query, $Connection)
        $DataAdapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter($Command)
        $DataSet = New-Object System.Data.DataSet
        $RecordCount = $dataAdapter.Fill($dataSet, "data")
        return $DataSet;
    }

    Catch {
        Write-Host "ERROR : Unable to run query : $query `n$Error[0]"
    }

    Finally {
        $Connection.Close()
    }
}

#Schleife

#Schleife, die das Menue aufruft, bis der Nutzer x eingibt.
Do
{	
	Write-Host "Bitte treffen Sie Ihre Wahl"
	Write-Host "   1. Nutzer anlegen"
	Write-Host "   2. Computer anlegen"
	Write-Host "   3. Reports anlegen"
    Write-Host "   4. Statistik anzeigen"
	Write-Host "   x  fuer Beenden"
	
    $benutzerwahl=Read-Host
	if($benutzerwahl -eq "x")
	{
		break;
	}
	
    switch ($benutzerwahl)
	{
		"1" { getUsers}
		"2" { getComputer }
		"3" { getReports }
		"4" { getStatistik }
	}
} 
while ($benutzerwahl -ne "x")