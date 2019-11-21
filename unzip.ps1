$arg = $args.Split("");
$tmp = @();

for ($i = $arg.Length; $arg[$i] -ne '\'; $i--) {
	$tmp += $arg[$i - 1];
}

for ($i = $tmp.Length - 2; $i -ge 0; $i--) {
	$name += $tmp[$i];
}

$file = "./" + $name

for ($i = 0; $i -ne $arg.Length - $file.Length + 1; $i++) {
	$path += $arg[$i];
}

cd $path;
pwd;

$make = "Expand-Archive -Path " + $file + " -DestinationPath ./";
Invoke-Expression $make;
