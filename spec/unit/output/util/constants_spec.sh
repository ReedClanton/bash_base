Describe "output(): util:" output:util
	Describe "constants:" outputConstants constants output:constants util:constants
		# Makes test easier to read and maintain.
		constants=$PWD/src/shell/functions/output/util/constants.sh
		
		Describe "Ensure shell compatibility:" outputConstants:shellCompatible
			It "Source file" outputConstants:source
				When call $constants
				The stderr should not be present
				The stdout should not be present
				The status should be success
			End
		End
		
		Describe "Environment variable set:" outputConstants:environmentVariablesSet
			# Ensure constants set by file are incorporated into the test environment.
			Include $constants
			
			Describe "DEFAULT_LINE_LENGTH:" outputConstants:defaultLineLength
				It "Set" defaultLineLength:set
					The value "$DEFAULT_LINE_LENGTH" should be present
				End
				It "Readonly" defaultLineLength:readonly
					The variable DEFAULT_LINE_LENGTH should be readonly
				End
				It "Not exported" defaultLineLength:notExported
					The variable DEFAULT_LINE_LENGTH should not be exported
				End
				It "Is positive" defaultLineLength:isPositive
					The value "$DEFAULT_LINE_LENGTH" should satisfy isPositive "$DEFAULT_LINE_LENGTH"
				End
			End
			
			Describe "DEFAULT_INDENT:" outputConstants:defaultIndent
				It "Set" defaultIndent:set
					The value "$DEFAULT_INDENT" should be present
				End
				It "Readonly" defaultIndent:readonly
					The variable DEFAULT_INDENT should be readonly
				End
				It "Not exported" defaultIndent:notExported
					The variable DEFAULT_INDENT should not be exported
				End
				It "Is not negative" defaultIndent:isNotNegative
					The value "$DEFAULT_INDENT" should satisfy isNotNegative "$DEFAULT_INDENT"
				End
			End
			
			Describe "DEFAULT_CHAR:" outputConstants:defaultChar
				It "Set" defaultChar:set
					The value "$DEFAULT_CHAR" should be present
				End
				It "Readonly" defaultChar:readonly
					The variable DEFAULT_CHAR should be readonly
				End
				It "Not exported" defaultChar:notExported
					The variable DEFAULT_CHAR should not be exported
				End
			End
			
			Describe "TRACE_CHAR:" outputConstants:traceChar
				It "Set" traceChar:set
					The value "$TRACE_CHAR" should be present
				End
				It "Readonly" traceChar:readonly
					The variable TRACE_CHAR should be readonly
				End
				It "Not exported" traceChar:notExported
					The variable TRACE_CHAR should not be exported
				End
			End
			
			Describe "INFO_CHAR:" outputConstants:infoChar
				It "Set" infoChar:set
					The value "$INFO_CHAR" should be present
				End
				It "Readonly" infoChar:readonly
					The variable INFO_CHAR should be readonly
				End
				It "Not exported" infoChar:notExported
					The variable INFO_CHAR should not be exported
				End
			End
			
			Describe "DEBUG_CHAR:" outputConstants:debugChar
				It "Set" debugChar:set
					The value "$DEBUG_CHAR" should be present
				End
				It "Readonly" debugChar:readonly
					The variable DEBUG_CHAR should be readonly
				End
				It "Not exported" debugChar:notExported
					The variable DEBUG_CHAR should not be exported
				End
			End
			
			Describe "WARN_CHAR:" outputConstants:warnChar
				It "Set" warnChar:set
					The value "$WARN_CHAR" should be present
				End
				It "Readonly" warnChar:readonly
					The variable WARN_CHAR should be readonly
				End
				It "Not exported" warnChar:notExported
					The variable WARN_CHAR should not be exported
				End
			End
			
			Describe "ERROR_CHAR:" outputConstants:errorChar
				It "Set" errorChar:set
					The value "$ERROR_CHAR" should be present
				End
				It "Readonly" errorChar:readonly
					The variable ERROR_CHAR should be readonly
				End
				It "Not exported" errorChar:notExported
					The variable ERROR_CHAR should not be exported
				End
			End
		End
	End
End

