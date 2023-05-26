# Setup required environment variable(s).
% RECOGNIZED_SHELL_NAMES:"bash dash tcsh ksh zsh "
readonly RECOGNIZED_SHELL_NAMES

Describe "ShellName:" shellName
	Describe "shellName():" shellName:shellName
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/shellName/shellName.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Mock ps():" shellNameShellName:mockPs
			It "Not defined" shellNameShellNameMockPs:notDefined
				ps() { echo "<shell>: ps: command not found"; return $COMMAND_NOT_FOUND_RT; }
				When run shellName
				The stdout should not be present
				The stderr line 1 should start with "ERROR shellName(): "
				The status should equal $GENERIC_ENVIRONMENT_ISSUE_RT
			End
			Describe "Defined:" shellNameShellNameMockPs:defined
				Describe "Bash shell:" shellNameShellNameMockPsDefined:bashShell
					It "bash" shellNameShellNameMockPsDefinedBashShell:bash
						ps() { echo "bash"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "bash"
						The status should be success
					End
					It "blabash" shellNameShellNameMockPsDefinedBashShell:blabash
						ps() { echo "blabash"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "bash"
						The status should be success
					End
					It "bashbla" shellNameShellNameMockPsDefinedBashShell:bashbla
						ps() { echo "bashbla"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "bash"
						The status should be success
					End
				End
				Describe "Dash shell:" shellNameShellNameMockPsDefined:dashShell
					It "dash" shellNameShellNameMockPsDefinedDashShell:dash
						ps() { echo "dash"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "dash"
						The status should be success
					End
					It "bladash" shellNameShellNameMockPsDefinedDashShell:bladash
						ps() { echo "bladash"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "dash"
						The status should be success
					End
					It "dashbla" shellNameShellNameMockPsDefinedDashShell:dashbla
						ps() { echo "dashbla"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "dash"
						The status should be success
					End
				End
				Describe "Tcsh shell:" shellNameShellNameMockPsDefined:tcshShell
					It "tcsh" shellNameShellNameMockPsDefinedTcshShell:tcsh
						ps() { echo "tcsh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "tcsh"
						The status should be success
					End
					It "blatcsh" shellNameShellNameMockPsDefinedTcshShell:blatcsh
						ps() { echo "blatcsh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "tcsh"
						The status should be success
					End
					It "tcshbla" shellNameShellNameMockPsDefinedTcshShell:tcshbla
						ps() { echo "tcshbla"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "tcsh"
						The status should be success
					End
				End
				Describe "Ksh shell:" shellNameShellNameMockPsDefined:kshShell
					It "ksh" shellNameShellNameMockPsDefinedKshShell:ksh
						ps() { echo "ksh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "ksh"
						The status should be success
					End
					It "blaksh" shellNameShellNameMockPsDefinedKshShell:blaksh
						ps() { echo "blaksh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "ksh"
						The status should be success
					End
					It "kshbla" shellNameShellNameMockPsDefinedKshShell:kshbla
						ps() { echo "kshbla"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "ksh"
						The status should be success
					End
				End
				Describe "Zsh shell:" shellNameShellNameMockPsDefined:zshShell
					It "zsh" shellNameShellNameMockPsDefinedZshShell:zsh
						ps() { echo "zsh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "zsh"
						The status should be success
					End
					It "blazsh" shellNameShellNameMockPsDefinedZshShell:blazsh
						ps() { echo "blazsh"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "zsh"
						The status should be success
					End
					It "zshbla" shellNameShellNameMockPsDefinedZshShell:zshbla
						ps() { echo "zshbla"; }
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "zsh"
						The status should be success
					End
				End
			End
		End
	End
End

