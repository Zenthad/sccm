<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2018 v5.5.150
	 Created on:   	4/6/2018 4:09 PM
	 Created by:   	Thaddeus Pearson
	 Organization: 	City of Missoula
	 Filename:     	Manual SCCM client reinstall
	===========================================================================
	.DESCRIPTION
		The goal of this script is to remedy communication issues between the sccm-cb server and a configMgr client. 
This becomes very useful when the client is having issues communicating with the MSS site and the GUI for configMgr is limmited.
#>

$clientComputer = Read-Host 'enter client computer'
$credential = Get-Credential
$session = New-PSSession -Credential $credential -ComputerName $clientComputer
Enter-PSSession -Session $session
#cd c:\Windows\CCM
#ccmsetup.exe /uninstall
& 'c:\windows\CCM\ccmsetup.exe' /uninstall
if ((get-content '<path to log>' | select-object -last 1) -contains '<uninstall completed text>')
{
	$proceed = $true
}
else
{
	start-sleep -seconds 60
}
}
psexec
