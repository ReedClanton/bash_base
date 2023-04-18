# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# createHeaderFooter() shouldn't be called, but mock it out just in case.
	createHeaderFooter() { return $CATCHALL_RT; }
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Prefix and postfix:" outputOutputOptionalOption:prefixAndPostfix
			Describe "--pp:" outputOutputOptionalOptionPrefixAndPostfix:pp
				It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					When run source $output -m=m --pp
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
				It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:twoCharacterFormattingCharacter
					DEFAULT_CHAR='&!'
					When run source $output -m=m --pp
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "&! m &!"
					The status should be success
				End
				It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:manyCharacterFormattingCharacter
					DEFAULT_CHAR='!#*@'
					When run source $output -m=m --pp -f="!#*@"
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "!#*@ m !#*@"
					The status should be success
				End
			End
			Describe "--pre-post-fix:" outputOutputOptionalOptionPrefixAndPostfix:prePostFix
				It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					When run source $output -m=m --pre-post-fix
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
				It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:twoCharacterFormattingCharacter
					DEFAULT_CHAR='&!'
					When run source $output -m=m --pre-post-fix
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "&! m &!"
					The status should be success
				End
				It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:manyCharacterFormattingCharacter
					DEFAULT_CHAR='!#*@'
					When run source $output -m=m --pre-post-fix
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "!#*@ m !#*@"
					The status should be success
				End
			End
		End
	End
End

