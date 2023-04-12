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
			
			Describe "Environment variable set:" outputUtilConstants:environmentVariableSet
				# Ensure constants set by file are incorporated into the test environment.
				sourceCut() { . $constants; }
				BeforeAll 'sourceCut'
				
				Describe "DEFAULT_LINE_LENGTH:" outputUtilConstantsEnvironmentVariableSet:defaultLineLength
					It "Set" outputUtilConstantsEnvironmentVariableSetDefaultLineLength:set                         this
						The variable DEFAULT_LINE_LENGTH should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetDefaultLineLength:readonly               this
						The variable DEFAULT_LINE_LENGTH should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetDefaultLineLength:notExported
						The variable DEFAULT_LINE_LENGTH should not be exported
					End
					It "Is positive" outputUtilConstantsEnvironmentVariableSetDefaultLineLength:isPositive          this
						The value "$DEFAULT_LINE_LENGTH" should satisfy isPositive "$DEFAULT_LINE_LENGTH"
					End
				End
				Describe "DEFAULT_INDENT:" outputUtilConstantsEnvironmentVariableSet:defaultIndent
					It "Set" outputUtilConstantsEnvironmentVariableSetDefaultIndent:set
						The value "$DEFAULT_INDENT" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetDefaultIndent:readonly                   this
						The variable DEFAULT_INDENT should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetDefaultIndent:notExported
						The variable DEFAULT_INDENT should not be exported
					End
					It "Is not negative" outputUtilConstantsEnvironmentVariableSetDefaultIndent:isNotNegative
						The value "$DEFAULT_INDENT" should satisfy isNotNegative "$DEFAULT_INDENT"
					End
				End
				Describe "DEFAULT_CHAR:" outputUtilConstantsEnvironmentVariableSet:defaultChar
					It "Set" outputUtilConstantsEnvironmentVariableSetDefaultChar:set
						The value "$DEFAULT_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetDefaultChar:readonly                     this
						The variable DEFAULT_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetDefaultChar:notExported
						The variable DEFAULT_CHAR should not be exported
					End
				End
				
				Describe "TRACE_CHAR:" outputUtilConstantsEnvironmentVariableSet:traceChar
					It "Set" outputUtilConstantsEnvironmentVariableSetTraceChar:set
						The value "$TRACE_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetTraceChar:readonly                       this
						The variable TRACE_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetTraceChar:notExported
						The variable TRACE_CHAR should not be exported
					End
				End
				Describe "INFO_CHAR:" outputUtilConstantsEnvironmentVariableSet:infoChar
					It "Set" outputUtilConstantsEnvironmentVariableSetInfoChar:set                                  this
						The value "$INFO_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetInfoChar:readonly                        this
						The variable INFO_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetInfoChar:notExported
						The variable INFO_CHAR should not be exported
					End
				End
				Describe "DEBUG_CHAR:" outputUtilConstantsEnvironmentVariableSet:debugChar
					It "Set" outputUtilConstantsEnvironmentVariableSetDebugChar:set
						The value "$DEBUG_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetDebugChar:readonly                       this
						The variable DEBUG_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetDebugChar:notExported
						The variable DEBUG_CHAR should not be exported
					End
				End
				Describe "WARN_CHAR:" outputUtilConstantsEnvironmentVariableSet:warnChar
					It "Set" outputUtilConstantsEnvironmentVariableSetWarnChar:set
						The value "$WARN_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetWarnChar:readonly                        this
						The variable WARN_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetWarnChar:notExported
						The variable WARN_CHAR should not be exported
					End
				End
				Describe "ERROR_CHAR:" outputUtilConstantsEnvironmentVariableSet:errorChar
					It "Set" outputUtilConstantsEnvironmentVariableSetErrorChar:set
						The value "$ERROR_CHAR" should be present
					End
					It "Readonly" outputUtilConstantsEnvironmentVariableSetErrorChar:readonly                       this
						The variable ERROR_CHAR should be readonly
					End
					It "Not exported" outputUtilConstantsEnvironmentVariableSetErrorChar:notExported
						The variable ERROR_CHAR should not be exported
					End
				End
			End
		End
	End
End

