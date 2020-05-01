# C:\Users\smicle\Downloads\test.zip
$zip = $args[0]
$dir = $zip.split(".zip")[0]
& 'C:\Program Files\7-Zip\7z.exe' x -y -o"$dir" $zip | Out-Null
mv $zip	$dir
