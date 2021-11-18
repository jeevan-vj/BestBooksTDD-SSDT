$msbuildPath = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\MSBuild\\Current\\Bin\\msbuild.exe"

Write-Host "Testing path: " $msbuildPath


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

$SqlPackageLocation2 = "C:\jeevan\Softwares\sqlpackage-win7-x64-en-US-15.0.5084.2\sqlpackage.exe"
$buildOutPutDacpacFilePath = .\\MyBestBooks\\BestBooks\\bin\\Debug\\BestBooks.dacpac
& $SqlPackageLocation2 /action:Publish  /SourceFile:$buildOutPutDacpacFilePath /TargetDatabaseName:BestBooks /TargetServerName:”localhost” /tu:sa /tp:123 

Write-Host "Successfully deployed"
