Login-AzureRmAccount

$account = ""   #Enter ADLA account name
$database = ""  #Enter ADLA database name
$localpath = "C:\Temp\DevSPs"  #Choose your local path to download ADLA table definitions


$ChildItems = Get-AzureRmDataLakeAnalyticsCatalogItem -Account $account -ItemType Table -Path "$database.dbo"

    foreach ($ChildItem in $ChildItems) {
    #$ChildItem
        $script =  $childitem.ColumnList;
        $file  = $ChildItem.Name;
        $filename = "$file.txt";
        $script | Out-File $localpath\$filename;
        }
    