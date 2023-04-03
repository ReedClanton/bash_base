# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Mock out sourcing of constants file.
	inScriptSource() { return 0; }
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Prefix and postfix:" outputOutputOptionalOption:prefixAndPostfix
			Describe "--pp:" outputOutputOptionalOptionPrefixAndPostfix:pp
				It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:singleCharacterFormattingCharacter
					When run source $output -m=m --pp
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
				It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:twoCharacterFormattingCharacter
					When run source $output -m=m --pp -f="&!"
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "&! m &!"
					The status should be success
				End
				It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:manyCharacterFormattingCharacter
					When run source $output -m=m --pp -f="!$*@"
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "!$*@ m !$*@"
					The status should be success
				End
			End
			Describe "--pre-post-fix:" outputOutputOptionalOptionPrefixAndPostfix:prePostFix
				It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:singleCharacterFormattingCharacter
					When run source $output -m=m --pre-post-fix
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "# m #"
					The status should be success
				End
				It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:twoCharacterFormattingCharacter
					When run source $output -m=m --pre-post-fix -f="&!"
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "&! m &!"
					The status should be success
				End
				It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:manyCharacterFormattingCharacter
					When run source $output -m=m --pre-post-fix -f="!$*@"
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "!$*@ m !$*@"
					The status should be success
				End
			End
		End
	End
End

