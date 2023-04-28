# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% NONE:0
readonly NONE
% ERROR:1
readonly ERROR
% WARN:2
readonly WARN
% INFO:3
readonly INFO
% DEBUG:4
readonly DEBUG
% TRACE:5
readonly TRACE
% ALL:6
readonly ALL

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
			Describe "Constants:" logLogUtil:constants
				Describe "SHELL_LOG_LEVEL:" logLogUtilConstants:shellLogLevel
					Describe "NONE:" logLogUtilConstantsShellLogLevel:none
						SHELL_LOG_LEVEL=$NONE
						
						It "Error" logLogUtilConstantsShellLogLevelNone:error
							When run log -m=m -e
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelNone:warn
							When run log -m=m -w
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelNone:info
							When run log -m=m -i
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelNone:debug
							When run log -m=m -d
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelNone:trace
							When run log -m=m -t
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "ERROR:" logLogUtilConstantsShellLogLevel:error
						SHELL_LOG_LEVEL=$ERROR
						
						It "Error" logLogUtilConstantsShellLogLevelError:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelError:warn
							When run log -m=m -w
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelError:info
							When run log -m=m -i
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelError:debug
							When run log -m=m -d
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelError:trace
							When run log -m=m -t
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "WARN:" logLogUtilConstantsShellLogLevel:warn
						SHELL_LOG_LEVEL=$WARN
						
						It "Error" logLogUtilConstantsShellLogLevelWarn:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelWarn:warn
							When run log -m=m -w
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "WARN :	m"
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelWarn:info
							When run log -m=m -i
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelWarn:debug
							When run log -m=m -d
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelWarn:trace
							When run log -m=m -t
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "INFO:" logLogUtilConstantsShellLogLevel:info
						SHELL_LOG_LEVEL=$INFO
						
						It "Error" logLogUtilConstantsShellLogLevelInfo:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelInfo:warn
							When run log -m=m -w
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "WARN :	m"
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelInfo:info
							When run log -m=m -i
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "INFO :	m"
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelInfo:debug
							When run log -m=m -d
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelInfo:trace
							When run log -m=m -t
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "DEBUG:" logLogUtilConstantsShellLogLevel:debug
						SHELL_LOG_LEVEL=$DEBUG
						
						It "Error" logLogUtilConstantsShellLogLevelDebug:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelDebug:warn
							When run log -m=m -w
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "WARN :	m"
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelDebug:info
							When run log -m=m -i
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "INFO :	m"
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelDebug:debug
							When run log -m=m -d
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "DEBUG:	m"
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelDebug:trace
							When run log -m=m -t
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "TRACE:" logLogUtilConstantsShellLogLevel:trace
						SHELL_LOG_LEVEL=$TRACE
						
						It "Error" logLogUtilConstantsShellLogLevelTrace:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelTrace:warn
							When run log -m=m -w
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "WARN :	m"
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelTrace:info
							When run log -m=m -i
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "INFO :	m"
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelTrace:debug
							When run log -m=m -d
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "DEBUG:	m"
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelTrace:trace
							When run log -m=m -t
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	m"
							The status should be success
						End
					End
					Describe "ALL:" logLogUtilConstantsShellLogLevel:all
						SHELL_LOG_LEVEL=$ALL
						
						It "Error" logLogUtilConstantsShellLogLevelAll:error
							When run log -m=m -e
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "ERROR:	m"
							The status should be success
						End
						It "Warn" logLogUtilConstantsShellLogLevelAll:warn
							When run log -m=m -w
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "WARN :	m"
							The status should be success
						End
						It "Info" logLogUtilConstantsShellLogLevelAll:info
							When run log -m=m -i
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "INFO :	m"
							The status should be success
						End
						It "Debug" logLogUtilConstantsShellLogLevelAll:debug
							When run log -m=m -d
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "DEBUG:	m"
							The status should be success
						End
						It "Trace" logLogUtilConstantsShellLogLevelAll:trace
							When run log -m=m -t
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "TRACE:	m"
							The status should be success
						End
					End
				End
			End
		End
	End
End

