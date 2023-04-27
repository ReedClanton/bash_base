Describe "Log:" log
	Describe "Util:" log:util
		Describe "Constants:" logUtil:constants
			# Makes test easier to read and maintain.
			constants=$PWD/src/shell/functions/log/util/constants.sh
			
			Describe "Shell compatibility:" logUtilConstants:shellCompatibility
				It "Source file" logUtilConstantsShellCompatibility:sourceFile
					When run source $constants
					The stderr should not be present
					The stdout should not be present
					The status should be success
				End
			End
			
			Describe "Environment variable:" logUtilConstants:environmentVariable
				Describe "NO_TITLE:" logUtilConstantsEnvironmentVariable:noTitle
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableNoTitle:set
							The variable NO_TITLE should be present
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableNoTitle:readonly
							The variable NO_TITLE should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableNoTitle:exported
							The variable NO_TITLE should be exported
						End
					End
				End
				Describe "FULL_TITLE:" logUtilConstantsEnvironmentVariable:fullTitle
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableFullTitle:set
							The value "$FULL_TITLE" should be present
						End
						It "Is greater than NO_TITLE" logUtilConstantsEnvironmentVariableFullTitle:isGreaterThanNoTitle
							The value "$FULL_TITLE" should satisfy isGreaterThan $FULL_TITLE $NO_TITLE
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableFullTitle:readonly
							The variable FULL_TITLE should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableFullTitle:exported
							The variable FULL_TITLE should be exported
						End
					End
				End
				Describe "LINE_TITLE:" logUtilConstantsEnvironmentVariable:lineTitle
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableLineTitle:set
							The value "$LINE_TITLE" should be present
						End
						It "Is greater than FULL_TITLE" logUtilConstantsEnvironmentVariableFullTitle:isGreaterThanFullTitle
							The value "$FULL_TITLE" should satisfy isGreaterThan $LINE_TITLE $FULL_TITLE
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableLineTitle:readonly
							The variable LINE_TITLE should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableLineTitle:exported
							The variable LINE_TITLE should be exported
						End
					End
				End
				Describe "NONE:" logUtilConstantsEnvironmentVariable:none
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableNone:set
							The value "$NONE" should be present
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableNone:readonly
							The variable NONE should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableNone:exported
							The variable NONE should be exported
						End
					End
				End
				Describe "ERROR:" logUtilConstantsEnvironmentVariable:error
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableError:set
							The value "$ERROR" should be present
						End
						It "Is greater than NONE" logUtilConstantsEnvironmentVariableError:isGreaterThanNone
							The value "$ERROR" should satisfy isGreaterThan $ERROR $NONE
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableError:readonly
							The variable ERROR should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableError:exported
							The variable ERROR should be exported
						End
					End
				End
				Describe "WARN:" logUtilConstantsEnvironmentVariable:warn
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableWarn:set
							The value "$WARN" should be present
						End
						It "Is greater than ERROR" logUtilConstantsEnvironmentVariableWarn:isGreaterThanError
							The value "$WARN" should satisfy isGreaterThan $WARN $ERROR
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableWarn:readonly
							The variable WARN should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableWarn:exported
							The variable WARN should be exported
						End
					End
				End
				Describe "INFO:" logUtilConstantsEnvironmentVariable:info
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableInfo:set
							The value "$INFO" should be present
						End
						It "Is greater than WARN" logUtilConstantsEnvironmentVariableInfo:isGreaterThanWarn
							The value "$INFO" should satisfy isGreaterThan $INFO $WARN
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableInfo:readonly
							The variable INFO should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableInfo:exported
							The variable INFO should be exported
						End
					End
				End
				Describe "DEBUG:" logUtilConstantsEnvironmentVariable:debug
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableDebug:set
							The value "$DEBUG" should be present
						End
						It "Is greater than INFO" logUtilConstantsEnvironmentVariableDebug:isGreaterThanInfo
							The value "$DEBUG" should satisfy isGreaterThan $DEBUG $INFO
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableDebug:readonly
							The variable DEBUG should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableDebug:exported
							The variable DEBUG should be exported
						End
					End
				End
				Describe "TRACE:" logUtilConstantsEnvironmentVariable:trace
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableTrace:set
							The value "$TRACE" should be present
						End
						It "Is greater than DEBUG" logUtilConstantsEnvironmentVariableTrace:isGreaterThanDebug
							The value "$TRACE" should satisfy isGreaterThan $TRACE $DEBUG
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableTrace:readonly
							The variable TRACE should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableTrace:exported
							The variable TRACE should be exported
						End
					End
				End
				Describe "ALL:" logUtilConstantsEnvironmentVariable:all
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableAll:set
							The value "$ALL" should be present
						End
						It "Is greater than TRACE" logUtilConstantsEnvironmentVariableAll:isGreaterThanTrace
							The value "$ALL" should satisfy isGreaterThan $ALL $TRACE
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" logUtilConstantsEnvironmentVariableAll:readonly
							The variable ALL should be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableAll:exported
							The variable ALL should be exported
						End
					End
				End
				Describe "SHELL_LOG_LEVEL:" logUtilConstantsEnvironmentVariable:shellLogLevel
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" logUtilConstantsEnvironmentVariableShellLogLevel:set
							The value "$SHELL_LOG_LEVEL" should be present
						End
						It "Is inclusively between NONE and ALL" logUtilConstantsEnvironmentVariableShellLogLevel:isInclusivelyBetweenNoneAndAll
							The value "$SHELL_LOG_LEVEL" should satisfy isInclusivelyBetween $NONE $SHELL_LOG_LEVEL $ALL
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Not readonly" logUtilConstantsEnvironmentVariableShellLogLevel:notReadonly
							The variable SHELL_LOG_LEVEL should not be readonly
						End
						It "Exported" logUtilConstantsEnvironmentVariableShellLogLevel:exported
							The variable SHELL_LOG_LEVEL should be exported
						End
					End
				End
			End
		End
	End
End

