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