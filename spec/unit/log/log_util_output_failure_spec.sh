# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% FULL_TITLE:1
readonly FULL_TITLE
% LINE_TITLE:2
readonly LINE_TITLE
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
		verifyInputProvided() { :; }
		
		Describe "Util:" logLog:util
			Describe "output():" logLogUtil:output
				Describe "Failure:" logLogUtilOutput:failure
					Describe "Non zero return code:" logLogUtilOutputFailure:nonZeroReturnCode
						It "3" logLogUtilOutputFailureNonZeroReturnCode:3
							output() { return $MINOR_EXECUTION_FAILURE_RT; }
							When run log -m=m --full-title
							The lines of stderr should equal 1
							The stderr line 1 should start with "ERROR log(): "
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	m"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "140" logLogUtilOutputFailureNonZeroReturnCode:140
							output() { return $OPTION_NAME_INVALID_RT; }
							When run log -m=m --line-title
							The lines of stderr should equal 1
							The stderr line 1 should start with "ERROR log(): "
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	m"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "141" logLogUtilOutputFailureNonZeroReturnCode:141
							output() { return $OPTION_VALUE_INVALID_RT; }
							When run log -m=ms --full-title
							The lines of stderr should equal 1
							The stderr line 1 should start with "ERROR log(): "
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	ms"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "142" logLogUtilOutputFailureNonZeroReturnCode:142
							output() { return $OPTION_REQUIRED_NOT_PROVIDED_RT; }
							When run log -m=ms --line-title
							The lines of stderr should equal 1
							The stderr line 1 should start with "ERROR log(): "
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	ms"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "200" logLogUtilOutputFailureNonZeroReturnCode:200
							output() { return $ENV_VAR_BAD_VALUE_RT; }
							When run log -m="message 1" -m=msg2 --full-title
							The lines of stderr should equal 1
							The stderr line 1 should start with "ERROR log(): "
							The lines of stdout should equal 2
							The stdout line 1 should equal "TRACE:	message 1"
							The stdout line 2 should equal "msg2"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
			End
		End
	End
End

