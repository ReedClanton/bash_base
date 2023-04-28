# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% INFO:3
readonly INFO
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$INFO

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		# Mock out.
		verifyInputProvided() { :; }
		
		Describe "Optional option:" logLog:optionalOption
			Describe "Info:" logLogOptionalOption:info
				It "-i" logLogOptionalOptionInfo:d
					When run log -m=m -i
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO :	m"
					The status should be success
				End
				It "--info" logLogOptionalOptionInfo:info
					When run log -m=m --info
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO :	m"
					The status should be success
				End
			End
		End
	End
End

