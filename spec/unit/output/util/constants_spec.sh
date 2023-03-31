Describe "output():" output:output
	Describe "util:" outputOutput:util
		Describe "constants:" outputOutputUtil:constants
			# Makes test easier to read and maintain.
			constants=$PWD/src/shell/functions/output/util/constants.sh
			
			Describe "Shell compatibility:" outputOutputUtilConstants:shellCompatibility
				It "Source file" outputOutputUtilConstantsShellCompatibility:sourceFile
					When call $constants
					The stderr should not be present
					The stdout should not be present
					The status should be success
				End
			End
			
			Describe "Environment variable set:" outputOutputUtilConstants:environmentVariableSet
				# Ensure constants set by file are incorporated into the test environment.
				Include $constants
				
				Describe "DEFAULT_LINE_LENGTH:" outputOutputUtilConstantsEnvironmentVariableSet:defaultLineLength
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetDefaultLineLength:set
						The value "$DEFAULT_LINE_LENGTH" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetDefaultLineLength:readonly
						The variable DEFAULT_LINE_LENGTH should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetDefaultLineLength:notExported
						The variable DEFAULT_LINE_LENGTH should not be exported
					End
					It "Is positive" outputOutputUtilConstantsEnvironmentVariableSetDefaultLineLength:isPositive
						The value "$DEFAULT_LINE_LENGTH" should satisfy isPositive "$DEFAULT_LINE_LENGTH"
					End
				End
				
				Describe "DEFAULT_INDENT:" outputOutputUtilConstantsEnvironmentVariableSet:defaultIndent
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetDefaultIndent:set
						The value "$DEFAULT_INDENT" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetDefaultIndent:readonly
						The variable DEFAULT_INDENT should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetDefaultIndent:notExported
						The variable DEFAULT_INDENT should not be exported
					End
					It "Is not negative" outputOutputUtilConstantsEnvironmentVariableSetDefaultIndent:isNotNegative
						The value "$DEFAULT_INDENT" should satisfy isNotNegative "$DEFAULT_INDENT"
					End
				End
				
				Describe "DEFAULT_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:defaultChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetDefaultChar:set
						The value "$DEFAULT_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetDefaultChar:readonly
						The variable DEFAULT_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetDefaultChar:notExported
						The variable DEFAULT_CHAR should not be exported
					End
				End
				
				Describe "TRACE_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:traceChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetTraceChar:set
						The value "$TRACE_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetTraceChar:readonly
						The variable TRACE_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetTraceChar:notExported
						The variable TRACE_CHAR should not be exported
					End
				End
				
				Describe "INFO_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:infoChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetInfoChar:set
						The value "$INFO_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetInfoChar:readonly
						The variable INFO_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetInfoChar:notExported
						The variable INFO_CHAR should not be exported
					End
				End
				
				Describe "DEBUG_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:debugChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetDebugChar:set
						The value "$DEBUG_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetDebugChar:readonly
						The variable DEBUG_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetDebugChar:notExported
						The variable DEBUG_CHAR should not be exported
					End
				End
				
				Describe "WARN_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:warnChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetWarnChar:set
						The value "$WARN_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetWarnChar:readonly
						The variable WARN_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetWarnChar:notExported
						The variable WARN_CHAR should not be exported
					End
				End
				
				Describe "ERROR_CHAR:" outputOutputUtilConstantsEnvironmentVariableSet:errorChar
					It "Set" outputOutputUtilConstantsEnvironmentVariableSetErrorChar:set
						The value "$ERROR_CHAR" should be present
					End
					It "Readonly" outputOutputUtilConstantsEnvironmentVariableSetErrorChar:readonly
						The variable ERROR_CHAR should be readonly
					End
					It "Not exported" outputOutputUtilConstantsEnvironmentVariableSetErrorChar:notExported
						The variable ERROR_CHAR should not be exported
					End
				End
			End
		End
	End
End

