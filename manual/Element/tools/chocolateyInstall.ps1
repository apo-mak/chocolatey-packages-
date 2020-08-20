$ErrorActionPreference = 'Stop';
$file64                = (Get-Childitem -Path $toolsDir -Filter "*_x64.exe").fullname

$packageArgs = @{
  file64         = $file64
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  url            = 'https://packages.riot.im/desktop/install/win32/x64/Element%20Setup%201.7.4.exe'
  checksum       = 'DEC5BDB5746B00CB876A0FCB1DEE8196CA8CFE8A23876E6B228268DB5714FE24'
  checksumType   = 'sha512'
  silentArgs     = '--silent'
  validExitCodes = @(0)
  softwareName   = 'Element*'
  toolsDir       = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Install-ChocolateyPackage @packageArgs