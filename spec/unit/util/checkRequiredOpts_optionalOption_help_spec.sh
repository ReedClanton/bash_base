# Setup required environment variable(s).
% CHECK_REQUIRED_OPTS_DOC:"#/ DESCRIPTION:"

Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" utilCheckRequiredOpts:optionalOption
			Describe "Help:" utilCheckRequiredOptsOptionalOption:help
				It "-h" utilCheckRequiredOptsOptionalOptionHelp:h
					When run checkRequiredOpts -h
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$CHECK_REQUIRED_OPTS_DOC"
					The status should be success
				End
				It "--help" utilCheckRequiredOptsOptionalOptionHelp:help
					When run checkRequiredOpts --help
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$CHECK_REQUIRED_OPTS_DOC"
					The status should be success
				End
			End
		End
	End
End

