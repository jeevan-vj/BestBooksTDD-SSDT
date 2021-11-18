$root = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)
$msBuildRootDir = "$root\MSBuild"
Write-Host "Root Path: " $root

$msbuildPath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe"



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

