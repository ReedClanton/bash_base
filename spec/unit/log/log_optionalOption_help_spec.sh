# Setup required environment variable(s).
% LOG_DOC:"#/ DESCRIPTION:"

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" logLog:optionalOption
			Describe "Help:" logLogOptionalOption:help
				It "-h" logLogOptionalOptionHelp:h
					When run log -h
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$LOG_DOC"
					The status should be success
				End
				It "--help" logLogOptionalOptionHelp:help
					When run log --help
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "$LOG_DOC"
					The status should be success
				End
			End
		End
	End
End

