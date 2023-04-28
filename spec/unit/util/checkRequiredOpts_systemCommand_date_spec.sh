Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Mock date():" utilCheckRequiredOpts:mockDate
			It "Not defined" utilCheckRequiredOptsMockDate:notDefined
				When run checkRequiredOpts
				The stdout should not be present
				The stderr line 1 should start with "ERROR checkRequiredOpts(): "
				The status should equal $ARGUMENT_REQUIRED_NOT_PROVIDED_RT
			End
			It "Defined" utilCheckRequiredOptsMockDate:defined
				date() { echo "2023/03/31 22:06:55 MDT"; }
				When run checkRequiredOpts
				The stdout should not be present
				The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR checkRequiredOpts(): "
				The status should equal $ARGUMENT_REQUIRED_NOT_PROVIDED_RT
			End
		End
	End
End

