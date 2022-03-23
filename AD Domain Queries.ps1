#requires -version 5
<#
.SYNOPSIS
  Scrapes Domain related info 
.DESCRIPTION
  Displayes Key Ad info 
.PARAMETER 
n/a
.INPUTS
  AD (RSAT/PS RequireD)  
.OUTPUTS
 Console 
.NOTES
  Version:        1.0
  Author:         Pknowles
  Creation Date:  TBC
  Purpose/Change: Initial script development
.EXAMPLE
n/a 
.Ref
    https://gallery.technet.microsoft.com/scriptcenter/Write-Log-PowerShell-999c32d0
    https://9to5it.com/powershell-script-template-version-2/
  #>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------
#Import Modules & Snap-ins

#----------------------------------------------------------[Declarations]----------------------------------------------------------
#Any Global Declarations go here

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'
#Static Variables for  Logging Function

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------
(Get-ADDomain -Current LocalComputer).ChildDomains
(Get-ADDomain -Current LocalComputer).NetBIOSName
((Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }).hostname
(Get-ADForest).SchemaMaster
(Get-ADForest).DomainNamingMaster
(Get-ADDomain -Current LocalComputer).RIDMaster
(Get-ADDomain -Current LocalComputer).PDCEmulator
(Get-ADDomain -Current LocalComputer).InfrastructureMaster
(Get-ADDomain -Current LocalComputer).DomainMode
$ForestInfo = Get-ADForest
$ForestInfo.GlobalCatalogs
Get-DnsServerResourceRecord -ComputerName $dnsdc -ZoneName $domain -RRType "NS" | FT -AutoSize
Get-DhcpServerInDC
