# Windows setup

Install-PackageProvider Nuget -Force
Install-Module -Name AzureRM -AllowClobber -Force
Install-Module -Name Az -AllowClobber -Force

Enable-WindowsOptionalFeature -FeatureName @(
'Containers',
'IIS-ApplicationDevelopment',
'IIS-ASPNET',
'IIS-ASPNET45',
'IIS-ClientCertificateMappingAuthentication',
'IIS-CommonHttpFeatures',
'IIS-DefaultDocument',
'IIS-DirectoryBrowsing',
# 'IIS-FTPServer',
# 'IIS-FTPSvc',
'IIS-HealthAndDiagnostics',
'IIS-HttpCompressionDynamic',
'IIS-HttpCompressionStatic',
'IIS-HttpErrors',
'IIS-HttpLogging',
'IIS-HttpRedirect',
'IIS-HttpTracing',
'IIS-IISCertificateMappingAuthentication',
'IIS-IPSecurity',
'IIS-ISAPIExtensions',
'IIS-ISAPIFilter',
'IIS-LoggingLibraries',
'IIS-ManagementConsole',
'IIS-NetFxExtensibility',
'IIS-NetFxExtensibility45',
'IIS-Performance',
'IIS-RequestFiltering',
'IIS-RequestMonitor',
'IIS-Security',
'IIS-StaticContent',
'IIS-WebServer',
'IIS-WebServerManagementTools',
'IIS-WebServerRole',
'IIS-WindowsAuthentication',
'NetFx3',
'NetFx4Extended-ASPNET45',
'TelnetClient'
) -All -Online

Install-WindowsUpdate -getUpdatesFromMS -acceptEula -SuppressReboots
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives  -EnableShowFileExtensions # -EnableShowFullPathInTitleBar

# Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# IIS

choco install webdeploy
choco install urlrewrite # If this fails, try https://www.microsoft.com/en-us/download/details.aspx?id=47337

# runtimes/sdks

choco install dotnetfx
choco install dotnetcore-sdk
choco install jdk8 
choco install jre8

# source control tools

choco install winmerge # Same thing as BeyondCompare
choco install git -params '""/GitAndUnixToolsOnPath""'
#  cmder comes with git
#choco install Cmder  
# choco install hyper
choco install sourcetree
choco install tortoisesvn 
choco install tortoisegit 
choco install tortoisehg

# databases

$dataDir="F:\Data\MSSQL\DEFAULT"
$backupDir="$dataDir\Backup"
md -Force $backupDir

choco install sql-server-express -ia '/IACCEPTSQLSERVERLICENSETERMS /Q /ACTION=install /SQLUSERDBDIR=""$dataDir"" /SQLUSERDBLOGDIR=""$dataDir"" /SQLBACKUPDIR=""$backupDir""' -o -y
choco install sql-server-management-studio

# editors

choco install nodejs # Prerequisite

choco install visualstudio2017community -ia '--add Microsoft.VisualStudio.Workload.CoreEditor --passive --locale en-US' -o -y
choco install visualstudio2017-installer
choco install visualstudio2017-remotetools # Remote debugging
choco install visualstudio2017-powershelltools
choco install visualstudio2017-performancetools # Profiling tools
choco install visualstudio2017buildtools # MSBuild development without visual studio
choco install visualstudio2017-workload-azure
choco install visualstudio2017-workload-azurebuildtools
choco install visualstudio2017-workload-node 
choco install visualstudio2017-workload-data
choco install visualstudio2017-workload-databuildtools
choco install visualstudio2017-workload-netweb 
choco install visualstudio2017-workload-manageddesktop
choco install visualstudio2017-workload-manageddesktopbuildtools
choco install visualstudio2017-workload-netcoretools
choco install visualstudio2017-workload-webbuildtools # Web MSBuild development without visual studio
choco install visualstudio2017-workload-netcrossplat # Mobile development (Xamarin)
choco install visualstudio2017-workload-xamarinbuildtools 
choco install visualstudio2017-workload-visualstudioextension # VS Extension development
choco install visualstudio2017-workload-visualstudioextensionbuildtools
choco install visualstudio2017-workload-managedgame # Unity development

#choco install resharper
#choco install WebStorm
# choco install pycharm-community # Python IDE
choco install notepadplusplus
choco install markdownpad2
choco install atom # Hackable text editor
choco install vscode
choco install vscode-csharp
choco install vscode-powershell
choco install vscode-mssql
choco install vscode-gitignore
choco install vscode-markdownlint 
choco install vscode-azurerm-tools
choco install vscode-eslint
choco install vscode-tslint
choco install vscode-jshint
choco install vscode-gitattributes
choco install openinvscode
choco install vscode-settingssync

# business intelligence

choco install crystalreports-for-visualstudio --version 13.0.23.2819

# webdev

choco install fiddler4
choco install filezilla
choco install prefix # Free Profiler for ASP.NET

# dev

choco install nunit-console-runner
choco install xunit
choco install dotPeek # Decompiler similar to ILMerge, but also may replace .NET Reflector
choco install ilmerge
choco install NugetPackageExplorer
choco install linqpad

# utilities

choco install poweriso --version 7.0
choco install 7zip
choco install line
choco install putty 
# choco install skype # Bundled in Windows 10 now
choco install kindle
choco install sendtokindle
choco install lockhunter
# choco install f.lux  # Like the nighttime/daytime settings in Windows 10
choco install paint.net # Similar to PhotoShop, but free
choco install PngGauntlet  #this package required manual entry (in blog post - hopefully now it works)
# choco install astrogrep # Search utility
# choco install vagrant
choco install greenshot # Screenshot utility
choco install freemind # Mind-mapping software
choco install scriptcs # Free-form C# coding (no projects and solutions)
choco install autohotkey.portable # Automate repetitive tasks
choco install zoomit # Zoom tool for presentations
choco install licecap # Screenshot utility (partial screen)
# choco install vlc # Media player
choco install inkscape #SVG (vector graphics) editor

# browsers

choco install google-chrome-x64
choco install Firefox

# other not on chocolately
# Crystal Reports for ClickOnce - https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports%2C+Developer+for+Visual+Studio+Downloads
# Photoshop
# PowerISO - Need license key
# Beyond Compare - Need license key
# Adobe Acrobat IX Pro ? - Need license key
# Balsamiq Mockups For Desktop - Need license key
# SQL Compare - Need license key
# SQL Data Compare - Need license key
# Memory Profiler ?
# Performance Profiler ?
# TimeCamp - https://www.timecamp.com/kb/where-to-get-it/

# Stuff to check out
# http://azurestorageexplorer.codeplex.com/
# icons - https://www.syncfusion.com/downloads/metrostudio
# view android - http://www.vysor.io/
# OWASP ZAP https://github.com/zaproxy/zaproxy/wiki/Downloads


# NOTES:

# Only password authentication seems to work, so face recognition and fingerprint
# login must be disabled/removed before starting setup. It can be setup again
# after the script is run.