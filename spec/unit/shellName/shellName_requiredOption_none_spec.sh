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
		
		Describe "Required option:" shellNameShellName:requiredOption
			Describe "None:" shellNameShellNameRequiredOption:none
				Describe "Bash" shellNameShellNameRequiredOptionNone:bash
					Skip if "Test not for this shell." isNotBash
					It
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "bash"
						The status should be success
					End
				End
				Describe "Dash" shellNameShellNameRequiredOptionNone:dash
					Skip if "Test not for this shell." isNotDash
					It
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "dash"
						The status should be success
					End
				End
				Describe "Ksh" shellNameShellNameRequiredOptionNone:ksh
					Skip if "Test not for this shell." isNotKsh
					It
						When run shellName
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "ksh"
						The status should be success
					End
				End
				Describe "Zsh" shellNameShellNameRequiredOptionNone:zsh
					Skip if "Test not for this shell." isNotZsh
					It
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

