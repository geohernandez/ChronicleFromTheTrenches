# Parameters
[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true,Position=1)]
    [ValidateSet('local', 'DEVELOP','INTEGRATION','LOAD','PRODUCTION')]
    [string] $environmentDEPLOY
)

if ($environmentDEPLOY -eq "local") 
{ 
    $Core_ServerName = "localhost"
    $Core_DBName = "MyDB"
}

if ($environmentDEPLOY -eq "DEVELOP") 
{ 
    $Core_ServerName = "NAME-DEVELOP-SERVER"
    $Core_DBName = "MyDevelopDB"
}


$result=Invoke-Sqlcmd -ServerInstance "$Core_ServerName" -InputFile "01_QueryToExecute.sql" -Database "$Core_DBName"
$result |export-csv MyOutputFile.csv -notypeinformation -delimiter "`t"