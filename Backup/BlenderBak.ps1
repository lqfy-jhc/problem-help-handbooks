##$ymd=年月日
$ymd = (Get-Date).ToString("yyyy-MM-dd")
##$blender_version=blender版本
$blender_version="3.5", "3.6", "4.1"
##$appPath=7z地址
$appPath="F:\Program Files\7-Zip-Zstandard\7za.exe"
##备份

foreach($e in $blender_version){
    ##$backupfiles_name=备份文件名称
    $backupfiles_name=-join ("Blender_" , $e , "_Bak_" , $ymd)
    ##$sourcePath=备份源地址
    $sourcePath="$env:appdata\Blender Foundation\Blender\$e\config"
    ##$backupsDepositedPath=备份文件存放地址
    $backupsDepositedPath="$env:userprofile\Desktop\Blender\$backupfiles_name.7z"
    ##Set-Alias 7zipbak $appPath
    & $appPath a -t7z -mx=9 $backupsDepositedPath $sourcePath
    #Write-Output "源地址" $sourcePath "存放地址" $backupsDepositedPath
}
