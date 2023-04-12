# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Mock out sourcing of util (constants, globals, helper functions, etc).
	inScriptSource() { return 0; }
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# Mock out cat command.
	cat() { createHeaderFooter; }
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Header, footer, prefix, and postfix:" outputOutputOptionalOption:headerFooterPrefixAndPostfix
			Describe "Single character formatting character:" outputOutputOptionalOptionHeaderFooterPrefixAndPostfix:singleCharacterFormattingCharacter
				DEFAULT_CHAR='#'
				
				It "Message length one" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixSingleCharacterFormattingCharacter:messageLengthOne
					createHeaderFooter() { echo " ###\n"; }
					When run source $output -m=m --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " ###"
					The stdout line 2 should equal "# m #"
					The stdout line 3 should equal " ###"
					The status should be success
				End
				It "Message length two" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixSingleCharacterFormattingCharacter:messageLengthTwo
					createHeaderFooter() { echo " ####\n"; }
					When run source $output -m=ms --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " ####"
					The stdout line 2 should equal "# ms #"
					The stdout line 3 should equal " ####"
					The status should be success
				End
			End
			Describe "Two character formatting character:" outputOutputOptionalOptionHeaderFooterPrefixAndPostfix:twoCharacterFormattingCharacter
				DEFAULT_CHAR='&!'
				
				It "Message length one" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixTwoCharacterFormattingCharacter:messageLengthOne
					createHeaderFooter() { echo " &!&!&\n"; }
					When run source $output -m=m --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " &!&!&"
					The stdout line 2 should equal "&! m &!"
					The stdout line 3 should equal " &!&!&"
					The status should be success
				End
				It "Message length two" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixTwoCharacterFormattingCharacter:messageLengthTwo
					createHeaderFooter() { echo " &!&!&!\n"; }
					When run source $output -m=ms --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " &!&!&!"
					The stdout line 2 should equal "&! ms &!"
					The stdout line 3 should equal " &!&!&!"
					The status should be success
				End
				It "Message length two" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixTwoCharacterFormattingCharacter:messageLengthThree
					createHeaderFooter() { echo " &!&!&!&\n"; }
					When run source $output -m=msg --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " &!&!&!&"
					The stdout line 2 should equal "&! msg &!"
					The stdout line 3 should equal " &!&!&!&"
					The status should be success
				End
			End
			Describe "Many character formatting character:" outputOutputOptionalOptionHeaderFooterPrefixAndPostfix:manyCharacterFormattingCharacter
				DEFAULT_CHAR='!#*@'
				
				It "Message length one" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixManyCharacterFormattingCharacter:messageLengthOne
					createHeaderFooter() { echo " !#*@!#*@!\n"; }
					When run source $output -m=m --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " !#*@!#*@!"
					The stdout line 2 should equal "!#*@ m !#*@"
					The stdout line 3 should equal " !#*@!#*@!"
					The status should be success
				End
				It "Message length two" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixManyCharacterFormattingCharacter:messageLengthTwo
					createHeaderFooter() { echo " !#*@!#*@!#\n"; }
					When run source $output -m=ms --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " !#*@!#*@!#"
					The stdout line 2 should equal "!#*@ ms !#*@"
					The stdout line 3 should equal " !#*@!#*@!#"
					The status should be success
				End
				It "Message length three" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixManyCharacterFormattingCharacter:messageLengthThree
					createHeaderFooter() { echo " !#*@!#*@!#*\n"; }
					When run source $output -m=msg --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " !#*@!#*@!#*"
					The stdout line 2 should equal "!#*@ msg !#*@"
					The stdout line 3 should equal " !#*@!#*@!#*"
					The status should be success
				End
				It "Message length four" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixManyCharacterFormattingCharacter:messageLengthFour
					createHeaderFooter() { echo " !#*@!#*@!#*@\n"; }
					When run source $output -m=msg1 --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " !#*@!#*@!#*@"
					The stdout line 2 should equal "!#*@ msg1 !#*@"
					The stdout line 3 should equal " !#*@!#*@!#*@"
					The status should be success
				End
				It "Message length five" outputOutputOptionalOptionHeaderFooterPrefixAndPostfixManyCharacterFormattingCharacter:messageLengthFive
					createHeaderFooter() { echo " !#*@!#*@!#*@!\n"; }
					When run source $output -m=msg1m --header-footer --pp
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " !#*@!#*@!#*@!"
					The stdout line 2 should equal "!#*@ msg1m !#*@"
					The stdout line 3 should equal " !#*@!#*@!#*@!"
					The status should be success
				End
			End
		End
	End
End

