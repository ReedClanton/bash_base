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
			Describe "Input invalid:" shellNameShellNameOptionalOption:inputInvalid
				It "-b" shellNameShellNameOptionalOptionInputInvalid:b
					When run shellName -b
					The stdout should not be present
					The stderr line 1 should start with "ERROR shellName(): "
					The stderr should include "$SHELL_NAME_DOC"
					The status should equal $OPTION_NAME_INVALID_RT
				End
				It "--blabla" shellNameShellNameOptionalOptionInputInvalid:blabla
					When run shellName --blabla
					The stdout should not be present
					The stderr line 1 should start with "ERROR shellName(): "
					The stderr should include "$SHELL_NAME_DOC"
					The status should equal $OPTION_NAME_INVALID_RT
				End
			End
		End
	End
End

