# Setup required environment variable(s).
% SHELL_NAME_DOC:"#/ DESCRIPTION:"

Describe "ShellName:" shellName
	Describe "shellName():" shellName:shellName
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/shellName/shellName.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" shellNameShellName:optionalOption
			Describe "Help:" shellNameShellNameOptionalOption:help
				It "-h" shellNameShellNameOptionalOptionHelp:h
					When run shellName -h
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$SHELL_NAME_DOC"
					The status should be success
				End
				It "--help" shellNameShellNameOptionalOptionHelp:help
					When run shellName --help
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$SHELL_NAME_DOC"
					The status should be success
				End
			End
		End
	End
End

