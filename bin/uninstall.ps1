. "$(split-path $myinvocation.mycommand.path)\..\lib\core.ps1"

if(test-path $scoopdir) {
	try {
		rm -r -force $scoopdir -ea 0
	} catch {
		abort "couldn't remove $(friendly_path $scoopdir): $_.exception.tostring()"
	}
}

$bindir_regex = "$([regex]::escape((full_path $bindir)));?"
if((env 'path') -match $bindir_regex) { # future sessions only
	echo "removing $(friendly_path $bindir) from your path"
	env 'path' ((env 'path') -replace $bindir_regex, '')
}

success "scoop has been uninstalled"