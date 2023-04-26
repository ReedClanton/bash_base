Describe "output():" output
	Describe "util:" output:util
		Describe "constants:" outputUtil:constants
			# Makes test easier to read and maintain.
			constants=$PWD/src/shell/functions/output/util/constants.sh
			
			Describe "Shell compatibility:" outputUtilConstants:shellCompatibility
				It "Source file" outputUtilConstantsShellCompatibility:sourceFile
					When run source $constants
					The stderr should not be present
					The stdout should not be present
					The status should be success
				End
			End
			
			Describe "Environment variable:" outputUtilConstants:environmentVariable
				Describe "DEFAULT_LINE_LENGTH:" outputUtilConstantsEnvironmentVariable:defaultLineLength
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableDefaultLineLength:set
							The variable DEFAULT_LINE_LENGTH should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableDefaultLineLength:notExported
							The variable DEFAULT_LINE_LENGTH should not be exported
						End
						It "Is positive" outputUtilConstantsEnvironmentVariableDefaultLineLength:isPositive
							The value "$DEFAULT_LINE_LENGTH" should satisfy isPositive "$DEFAULT_LINE_LENGTH"
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableDefaultLineLength:readonly
							The variable DEFAULT_LINE_LENGTH should be readonly
						End
					End
				End
				Describe "DEFAULT_INDENT:" outputUtilConstantsEnvironmentVariable:defaultIndent
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableDefaultIndent:set
							The value "$DEFAULT_INDENT" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableDefaultIndent:notExported
							The variable DEFAULT_INDENT should not be exported
						End
						It "Is not negative" outputUtilConstantsEnvironmentVariableDefaultIndent:isNotNegative
							The value "$DEFAULT_INDENT" should satisfy isNotNegative "$DEFAULT_INDENT"
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableDefaultIndent:readonly
							The variable DEFAULT_INDENT should be readonly
						End
					End
				End
				Describe "DEFAULT_CHAR:" outputUtilConstantsEnvironmentVariable:defaultChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableDefaultChar:set
							The value "$DEFAULT_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableDefaultChar:notExported
							The variable DEFAULT_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableDefaultChar:readonly
							The variable DEFAULT_CHAR should be readonly
						End
					End
				End
				Describe "TRACE_CHAR:" outputUtilConstantsEnvironmentVariable:traceChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableTraceChar:set
							The value "$TRACE_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableTraceChar:notExported
							The variable TRACE_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableTraceChar:readonly
							The variable TRACE_CHAR should be readonly
						End
					End
				End
				Describe "INFO_CHAR:" outputUtilConstantsEnvironmentVariable:infoChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableInfoChar:set
							The value "$INFO_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableInfoChar:notExported
							The variable INFO_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableInfoChar:readonly
							The variable INFO_CHAR should be readonly
						End
					End
				End
				Describe "DEBUG_CHAR:" outputUtilConstantsEnvironmentVariable:debugChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableDebugChar:set
							The value "$DEBUG_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableDebugChar:notExported
							The variable DEBUG_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableDebugChar:readonly
							The variable DEBUG_CHAR should be readonly
						End
					End
				End
				Describe "WARN_CHAR:" outputUtilConstantsEnvironmentVariable:warnChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableWarnChar:set
							The value "$WARN_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableWarnChar:notExported
							The variable WARN_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableWarnChar:readonly
							The variable WARN_CHAR should be readonly
						End
					End
				End
				Describe "ERROR_CHAR:" outputUtilConstantsEnvironmentVariable:errorChar
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" outputUtilConstantsEnvironmentVariableErrorChar:set
							The value "$ERROR_CHAR" should be present
						End
						It "Not exported" outputUtilConstantsEnvironmentVariableErrorChar:notExported
							The variable ERROR_CHAR should not be exported
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" outputUtilConstantsEnvironmentVariableErrorChar:readonly
							The variable ERROR_CHAR should be readonly
						End
					End
				End
			End
		End
	End
End

