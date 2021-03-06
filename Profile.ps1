Set-ExecutionPolicy Bypass
write-host "Setup powershell environment with visual studio tools."

Import-Module Isg
Import-Module PSGet
Import-Module PSCX

Install-VSCommandPrompt

$sourceDir = "C:\git"

set-alias sublime "C:\Program Files\Sublime Text 2\sublime_text.exe"
set-alias vboxmanage "C:\Program Files\Oracle\VirtualBox\vboxmanage.exe"
set-alias np "C:\Program Files (x86)\Notepad++\Notepad++.exe"
set-alias x explorer
set-alias which where.exe
remove-item alias:\curl

function Open-GitProject($projectName, $user = "crmckenzie")
{
    write-debug "Open-GitProject $projectName $user"
	$projectPath = Join-Path $sourceDir $projectName
	if ([System.IO.Directory]::Exists($projectPath) -eq $false)
	{
		$cmd = "git clone https://github.com/$user/$projectName.git $projectPath"
		write-host "Executing command: $cmd"
		Invoke-Expression $cmd
	}

    cd $projectPath	
}

cd $sourceDir
write-host "Ready."