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
		
		Describe "Mock command():" shellNameShellName:mockCommand
			It "Not defined" shellNameShellNameMockCommand:notDefined
				command() { echo "<shell>: ps: command not found"; return $COMMAND_NOT_FOUND_RT; }
				When run shellName
				The stdout should not be present
				The stderr line 1 should start with "ERROR shellName(): "
				The status should equal $REQUIRED_SYSTEM_COMMAND_NOT_ACCESSIBLE_RT
			End
			It "Defined" shellNameShellNameMockCommand:defined
				ps() { echo "ksh"; }
				When run shellName
				The stderr should not be present
				The lines of stdout should equal 1
				The stdout line 1 should equal "ksh"
				The status should be success
			End
		End
	End
End

