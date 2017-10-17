#. c:\temp\runde_1\model.ps1
. .\model.ps1

function hello([string]$name)
{

    Write-Host "Hello + $name"



} 



function getRechner([string]$Rechner)
{

    #BL
    $sql = "select * from report inner join computer "
    $sql += "on computer.computerID = report.computerID "
    $sql += "where computer.Hostname = $Rechner;"


    $result = getData($sql)


    return $result




}