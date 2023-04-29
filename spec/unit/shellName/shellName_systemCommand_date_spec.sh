Describe "ShellName:" shellName
	Describe "shellName():" shellName:shellName
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/shellName/shellName.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Mock date():" shellNameShellName:mockDate
			It "Not defined" shellNameShellNameMockDate:notDefined
				When run shellName -f
				The stdout should not be present
				The stderr line 1 should start with "ERROR shellName(): "
				The status should equal $OPTION_NAME_INVALID_RT
			End
			It "Defined" shellNameShellNameMockDate:defined
				date() { echo "2023/03/31 22:06:55 MDT"; }
				When run shellName -f
				The stdout should not be present
				The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR shellName(): "
				The status should equal $OPTION_NAME_INVALID_RT
			End
		End
	End
End

