# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# Mock out cat command.
	cat() { createHeaderFooter; }
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Pretty and indent:" outputOutputOptionalOption:prettyAndIndent
			Describe "Single character formatting character:" outputOutputOptionalOptionPrettyAndIndent:singleCharacterFormattingCharacter
				DEFAULT_CHAR='#'
				
				It "Zero indent" outputOutputOptionalOptionPrettyAndIndentsingleCharacterFormattingCharacter:zeroIndent
					createHeaderFooter() { echo " ###\n"; }
					When run source $output -m=m -p --indent=0
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " ###"
					The stdout line 2 should equal "# m #"
					The stdout line 3 should equal " ###"
					The status should be success
				End
				It "One indent" outputOutputOptionalOptionPrettyAndIndentsingleCharacterFormattingCharacter:oneIndent
					createHeaderFooter() { echo " ####\n"; }
					When run source $output -m=ms --pretty --indent=1
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal "  ####"
					The stdout line 2 should equal " # ms #"
					The stdout line 3 should equal "  ####"
					The status should be success
				End
				It "Many indents" outputOutputOptionalOptionPrettyAndIndentsingleCharacterFormattingCharacter:manyIndents
					createHeaderFooter() { echo " ###########\n"; }
					When run source $output -m="message 1" -m=msg2 -p --indent=10
					The stderr should not be present
					The lines of stdout should equal 4
					The stdout line 1 should equal "           ###########"
					The stdout line 2 should equal "          # message 1 #"
					The stdout line 3 should equal "          # msg2      #"
					The stdout line 4 should equal "           ###########"
					The status should be success
				End
			End
			Describe "Two character formatting character:" outputOutputOptionalOptionPrettyAndIndent:twoCharacterFormattingCharacter
				DEFAULT_CHAR='##'
				
				It "Many indents" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:manyIndents
					createHeaderFooter() { echo " #####\n"; }
					When run source $output -m=m --pretty --indent=15
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal "                #####"
					The stdout line 2 should equal "               ## m ##"
					The stdout line 3 should equal "                #####"
					The status should be success
				End
				It "Zero indent" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:zeroIndent
					createHeaderFooter() { echo " ######\n"; }
					When run source $output -m=ms -p --indent=0
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal " ######"
					The stdout line 2 should equal "## ms ##"
					The stdout line 3 should equal " ######"
					The status should be success
				End
				It "One indent" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:oneIndent
					createHeaderFooter() { echo " #######\n" 2>&1; }
					When run source $output -m=msg --pretty --indent=1
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal "  #######"
					The stdout line 2 should equal " ## msg ##"
					The stdout line 3 should equal "  #######"
					The status should be success
				End
				It "Two indents" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:twoIndents
					createHeaderFooter() { echo " #############\n"; }
					When run source $output --msg=msg -m="message 2" -m="message 3\nmessage 4" -p --indent=2
					The stderr should not be present
					The lines of stdout should equal 6
					The stdout line 1 should equal "   #############"
					The stdout line 2 should equal "  ## msg       ##"
					The stdout line 3 should equal "  ## message 2 ##"
					The stdout line 4 should equal "  ## message 3 ##"
					The stdout line 5 should equal "  ## message 4 ##"
					The stdout line 6 should equal "   #############"
					The status should be success
				End
			End
			Describe "Many character formatting character:" outputOutputOptionalOptionPrettyAndIndent:manyCharacterFormattingCharacter
				DEFAULT_CHAR='####'
				
				It "One indent" outputOutputOptionalOptionPrettyAndIndentManyCharacterFormattingCharacter:oneIndent
					createHeaderFooter() { echo " #############\n"; }
					When run source $output -m=msg1m --pretty --indent=1
					The stderr should not be present
					The lines of stdout should equal 3
					The stdout line 1 should equal "  #############"
					The stdout line 2 should equal " #### msg1m ####"
					The stdout line 3 should equal "  #############"
					The status should be success
				End
				It "Many indents" outputOutputOptionalOptionPrettyAndIndentManyCharacterFormattingCharacter:manyIndents
					createHeaderFooter() { echo " #########\n"; }
					When run source $output -m=m --msg=s -m=g -p --indent=89
					The stderr should not be present
					The lines of stdout should equal 5
					The stdout line 1 should equal "                                                                                          #########"
					The stdout line 2 should equal "                                                                                         #### m ####"
					The stdout line 3 should equal "                                                                                         #### s ####"
					The stdout line 4 should equal "                                                                                         #### g ####"
					The stdout line 5 should equal "                                                                                          #########"
					The status should be success
				End
				It "Too many indents" outputOutputOptionalOptionPrettyAndIndentManyCharacterFormattingCharacter:tooManyIndents
					createHeaderFooter() { return 0; }
					When run source $output -m=m --msg=s -m=g --pretty --indent=90
					The stdout should not be present
					The stderr should include "ERROR"
					The status should equal $OPTION_VALUE_INVALID_RT
				End
			End
		End
	End
End

