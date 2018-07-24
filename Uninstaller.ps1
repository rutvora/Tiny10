#Change Execution Policy first (command: set-executionpolicy remotesigned)

#Removes the apps specified in the array. Check before using


$AppsList = "Microsoft.messaging", "Microsoft.GetHelp", "Microsoft.GetStarted", "Microsoft.Microsoft3DViewer", "Microsoft.BingNews", "Microsoft.BingWeather", "Microsoft.BingSports", "Microsoft.BingFinance", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.Office.OneNote", "Microsoft.OneConnect", "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet", "microsoft.windowscommunicationsapps", "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo""Microsoft.messaging", "Microsoft.GetHelp", "Microsoft.GetStarted", "Microsoft.Microsoft3DViewer", "Microsoft.BingNews", "Microsoft.BingWeather", "Microsoft.BingSports", "Microsoft.BingFinance", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.Office.OneNote", "Microsoft.OneConnect", "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet", "microsoft.windowscommunicationsapps", "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo" 

ForEach ($App in $AppsList)

{
    
$Packages = Get-AppxPackage | Where-Object {$_.Name -eq $App}

if ($Packages -ne $null)

{

      Write-Host "Removing Appx Package: $App"

      foreach ($Package in $Packages)

      {

      Remove-AppxPackage -package $Package.PackageFullName

      }

}

else

{

      Write-Host "Unable to find package: $App"

}

$ProvisionedPackage = Get-AppxProvisionedPackage -online | Where-Object {$_.displayName -eq $App}

if ($ProvisionedPackage -ne $null)

{

      Write-Host "Removing Appx Provisioned Package: $App"

      remove-AppxProvisionedPackage -online -packagename $ProvisionedPackage.PackageName

}

else

{

      Write-Host "Unable to find provisioned package: $App"

}

}

#Disable Services
$services = @("XboxGipSvc","xbgm", "XblAuthManager", "XblGameSave","XboxNetApiSvc","WMPNetworkSvc","WerSvc","SysMain","RetailDemo","irmon","Fax", "WdiSystemHost", "WdiServiceHost", "DPS", "BITS", "WpcMonSvc", "wmiApSrv", "WbioSrvc", "WalletService", "TabletInputService", "SystemUsageReportSvc_WILLAMETTE", "SkypeUpdate", "ShareItSvc", "MapsBroker", "lfsvc")
for($i = 0;$i -lt $services.Length;$i++){
    Try{
        Set-Service -Name $services[$i] -StartupType Manual -ErrorAction Continue #Change to SilentlyContinue to hide errors
        "Changed startup type of " + $services[$i] + " to manual."
    }
    Catch{
        "Error with " + $services[$i]
    }
}