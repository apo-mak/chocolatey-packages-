$ErrorActionPreference = 'Stop';

$procName = (Get-WmiObject Win32_Processor).Name
if (!$procName.Contains('Ryzen')) {
    Write-Error 'Only compatible with AMD Ryzen processors'
}

$url = 'https://download.amd.com/Desktop/AMD-Ryzen-Master.exe'
$checksum = '00d927489a38967b66d9ce7414c472aa91a56963fe9d857b4f4ac897cfddab76'
$slientArgs = '/S /v/qn'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    url64          = $url
    softwareName   = 'amd-ryzen-master*'
    checksum       = $checksum
    checksumType   = 'sha256'
    checksum64     = $checksum
    checksumType64 = 'sha256'
    silentArgs     = $slientArgs
    silentArgs64   = $slientArgs
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
