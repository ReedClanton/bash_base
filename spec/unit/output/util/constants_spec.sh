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
				isPositive() { [ $(($1)) -gt 0 ]; }
				
				It "Set" defaultLineLength:set
					The value $DEFAULT_LINE_LENGTH should be present
				End
				It "Readonly" defaultLineLength:readonly
					The variable DEFAULT_LINE_LENGTH should be readonly
				End
				It "Not exported" defaultLineLength:notExported
					The variable DEFAULT_LINE_LENGTH should not be exported
				End
				It "Is positive" defaultLineLength:isPositive
					The value $DEFAULT_LINE_LENGTH should satisfy isPositive $DEFAULT_LINE_LENGTH
				End
			End
			
			Describe "DEFAULT_INDENT:" outputConstants:defaultIndent
				isNotNegative() { [ $(($1)) -ge 0 ]; }
				
				It "Set" defaultIndent:set
					The value $DEFAULT_INDENT should be present
				End
				It "Readonly" defaultIndent:readonly
					The variable DEFAULT_INDENT should be readonly
				End
				It "Not exported" defaultIndent:notExported
					The variable DEFAULT_INDENT should not be exported
				End
				It "Is not negative" defaultIndent:isNotNegative
					The value $DEFAULT_INDENT should satisfy isNotNegative $DEFAULT_INDENT
				End
			End
		End
	End
End

