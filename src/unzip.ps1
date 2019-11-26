$arg = $args.Split("")

$tmp = @()
for ($i = $arg.Length; $arg[$i] -ne '\'; $i--) {
	$tmp += $arg[$i - 1]
}
for ($i = $tmp.Length - 2; $i -ge 0; $i--) {
	$name += $tmp[$i]
}

for ($i = 0; $i -ne $arg.Length - $name.Length; $i++) {
	$path += $arg[$i]
}

cd $path

$dir = $name.Substring(1, $name.length - 5)
# $dir = $name.Split(".")[0]F
mkdir $dir
cd $dir

Expand-Archive -Path $("../" + $name) -DestinationPath ./

$list = ls -Name
if ($list.Count -ne 1) {
	return
}
if (("" + $(ls | Select-Object Mode)[0]).Substring(7, 1) -ne "d") {
	return
}

mv $list ../
cd ../
rm $dir
