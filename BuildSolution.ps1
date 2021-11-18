$root = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
$msBuildRootDir = "$root\MSBuild"
Write-Host "Root Path: " $root

$msbuildPath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe"


if(!(Test-Path ./nuget.exe)){
   wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -OutFile ./nuget.exe
}
./nuget install Microsoft.Data.Tools.Msbuild -o  $msBuildRootDir

$msbuildPath2 = Get-Childitem –Path $msBuildRootDir  -Include 'msbuild.exe'  -File -Recurse | Select-Object -First 1
Write-Host $msbuildPath2

Write-Host "Testing path: " $msbuildPath

if(!(Test-Path $msbuildPath)){
    Write-Host "Can't find msbuild?? make sur eyou installed visual studio 2015 or 2017"  
    Exit(1)
}

Write-Host "Using path: " $msbuildPath

& $msbuildPath .\MyBestBooks\\MyBestBooks.sln
if(!($?) -or $lastExitCode -ne 0){
    exit(1)
}

