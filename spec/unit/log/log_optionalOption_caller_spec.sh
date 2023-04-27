# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$TRACE

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		# Mock out.
		checkRequiredOpts() { :; }
		
		Describe "Optional option:" logLog:optionalOption
			Describe "Caller:" logLogOptionalOption:caller
				Describe "-c:" logLogOptionalOptionCaller:c
					It "Function name" logLogOptionalOptionCallerC:functionName
						When run log -m=m -c="functionName()"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "TRACE functionName():	m"
						The status should be success
					End
					It "User" logLogOptionalOptionCallerC:user
						When run log -m=m -c="SomeUser-Name1"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "TRACE SomeUser-Name1:	m"
						The status should be success
					End
				End
				Describe "--caller:" logLogOptionalOptionCaller:caller
					It "Function name" logLogOptionalOptionCallerCaller:functionName
						When run log -m=m --caller="functionName()"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "TRACE functionName():	m"
						The status should be success
					End
					It "User" logLogOptionalOptionCallerCaller:user
						When run log -m=m --caller="SomeUser-Name1"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "TRACE SomeUser-Name1:	m"
						The status should be success
					End
				End
			End
		End
	End
End

