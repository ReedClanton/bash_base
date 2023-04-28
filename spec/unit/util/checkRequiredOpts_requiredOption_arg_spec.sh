# Setup required environment variable(s).
% CALLING_DOC:"#/ DESCRIPTION: caller"

Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" utilCheckRequiredOpts:requiredOption
			Describe "Arg:" utilCheckRequiredOptsRequiredOption:arg
				Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:a
					It "Blank" utilCheckRequiredOptsRequiredOptionArgInputInvalidA:blank
						When run checkRequiredOpts "$CALLING_DOC" -a=""
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$CALLING_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
					End
					It "Null" utilCheckRequiredOptsRequiredOptionArgInputInvalidA:null
						When run checkRequiredOpts "$CALLING_DOC" -a=
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$CALLING_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
					End
				End
				Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:arg
					It "Blank" utilCheckRequiredOptsRequiredOptionArgInputInvalidArg:blank
						When run checkRequiredOpts "$CALLING_DOC" --arg=""
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$CALLING_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
					End
					It "Null" utilCheckRequiredOptsRequiredOptionArgInputInvalidArg:null
						When run checkRequiredOpts "$CALLING_DOC" --arg=
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$CALLING_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
					End
				End
				Todo "Write tests"
			End
		End
	End
End

