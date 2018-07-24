#Removes the apps specified in the array. Check before using


$AppsList = "Microsoft.messaging", "Microsoft.GetHelp", "Microsoft.GetStarted", "Microsoft.Microsoft3DViewer", "Microsoft.BingNews", "Microsoft.BingWeather", "Microsoft.BingSports", "Microsoft.BingFinance", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.Office.OneNote", "Microsoft.OneConnect", "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet", "microsoft.windowscommunicationsapps", "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo""Microsoft.messaging", "Microsoft.GetHelp", "Microsoft.GetStarted", "Microsoft.Microsoft3DViewer", "Microsoft.BingNews", "Microsoft.BingWeather", "Microsoft.BingSports", "Microsoft.BingFinance", "Microsoft.MicrosoftOfficeHub", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.Office.OneNote", "Microsoft.OneConnect", "Microsoft.People", "Microsoft.Print3D", "Microsoft.SkypeApp", "Microsoft.Wallet", "microsoft.windowscommunicationsapps", "Microsoft.WindowsFeedbackHub", "Microsoft.WindowsMaps", "Microsoft.WindowsPhone", "Microsoft.Xbox.TCUI", "Microsoft.XboxApp", "Microsoft.XboxGameOverlay", "Microsoft.XboxGamingOverlay", "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.MinecraftUWP", "Facebook.Facebook", "flaregamesGmbH.RoyalRevolt2", "king.com.CandyCrushSodaSaga", "Microsoft.BioEnrollment", "Microsoft.Windows.ShellExperienceHost", "Microsoft.Windows.CloudExperienceHost", "Microsoft.Windows.ContentDeliveryManager", "Microsoft.Windows.ParentalControls", "Microsoft.Windows.SecondaryTileExperience", "Microsoft.Advertising.Xaml", "Microsoft.CommsPhone", "Microsoft.Windows.FeatureOnDemand.InsiderHub", "Microsoft.Appconnector", "Microsoft.Office.Sway", "Microsoft.Office.OneNote", "Windows.ContactSupport", "Microsoft.XboxGameCallableUI", "Microsoft.Windows.PeopleExperienceHost", "38062AvishaiDernis.DiscordUWP", "Facebook.InstagramBeta"

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

#Uninstall OneDrive
taskkill /f /im OneDrive.exe
C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall