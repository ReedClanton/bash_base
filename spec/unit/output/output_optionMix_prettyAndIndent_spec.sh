# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:50
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "--pretty and --indent:" outputOutputOptionalOption:pAndIndent
				Describe "Single character formatting character:" outputOutputOptionalOptionPrettyAndIndent:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					
					It "Zero indent" outputOutputOptionalOptionPrettyAndIndentSingleCharacterFormattingCharacter:zeroIndent
						createHeaderFooter() { echo " ###"; }
						cat() { createHeaderFooter; }
						When run output -m=m -p --indent=0
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " ###"
						The stdout line 2 should equal "# m #"
						The stdout line 3 should equal " ###"
						The status should be success
					End
					It "One indent" outputOutputOptionalOptionPrettyAndIndentSingleCharacterFormattingCharacter:oneIndent
						createHeaderFooter() { echo " ####"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --pretty --indent=1
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "  ####"
						The stdout line 2 should equal " # ms #"
						The stdout line 3 should equal "  ####"
						The status should be success
					End
					It "Many indents" outputOutputOptionalOptionPrettyAndIndentSingleCharacterFormattingCharacter:manyIndents
						createHeaderFooter() { echo " ###########"; }
						cat() { createHeaderFooter; }
						When run output -m="message 1" -m=msg2 -p --indent=10
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
						createHeaderFooter() { echo " #####"; }
						cat() { createHeaderFooter; }
						When run output -m=m --pretty --indent=15
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "                #####"
						The stdout line 2 should equal "               ## m ##"
						The stdout line 3 should equal "                #####"
						The status should be success
					End
					It "Zero indent" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:zeroIndent
						createHeaderFooter() { echo " ######"; }
						cat() { createHeaderFooter; }
						When run output -m=ms -p --indent=0
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " ######"
						The stdout line 2 should equal "## ms ##"
						The stdout line 3 should equal " ######"
						The status should be success
					End
					It "One indent" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:oneIndent
						createHeaderFooter() { echo " #######"; }
						cat() { createHeaderFooter; }
						When run output -m=msg --pretty --indent=1
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "  #######"
						The stdout line 2 should equal " ## msg ##"
						The stdout line 3 should equal "  #######"
						The status should be success
					End
					It "Two indents" outputOutputOptionalOptionPrettyAndIndentTwoCharacterFormattingCharacter:twoIndents
						createHeaderFooter() { echo " #############"; }
						cat() { createHeaderFooter; }
						When run output --msg=msg -m="message 2" -m="message 3\nmessage 4" -p --indent=2
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
						createHeaderFooter() { echo " #############"; }
						cat() { createHeaderFooter; }
						When run output -m=msg1m --pretty --indent=1
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "  #############"
						The stdout line 2 should equal " #### msg1m ####"
						The stdout line 3 should equal "  #############"
						The status should be success
					End
					It "Many indents" outputOutputOptionalOptionPrettyAndIndentManyCharacterFormattingCharacter:manyIndents
						createHeaderFooter() { echo " #########"; }
						cat() { createHeaderFooter; }
						When run output -m=m --msg=s -m=g -p --indent=39
						The stderr should not be present
						The lines of stdout should equal 5
						The stdout line 1 should equal "                                        #########"
						The stdout line 2 should equal "                                       #### m ####"
						The stdout line 3 should equal "                                       #### s ####"
						The stdout line 4 should equal "                                       #### g ####"
						The stdout line 5 should equal "                                        #########"
						The status should be success
					End
					It "Too many indents" outputOutputOptionalOptionPrettyAndIndentManyCharacterFormattingCharacter:tooManyIndents
						createHeaderFooter() { return 0; }
						cat() { createHeaderFooter; }
						When run output -m=m --msg=s -m=g --pretty --indent=40
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
			End
		End
	End
End

