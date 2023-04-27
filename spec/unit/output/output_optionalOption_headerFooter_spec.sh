# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
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
			Describe "--header-footer:" outputOutputOptionalOption:headerFooter
				Describe "No prefix:" outputOutputOptionalOptionHeaderFooter:noPrefix
					Describe "Single character formatting character:" outputOutputOptionalOptionHeaderFooterNoPrefix:singleCharacterFormattingCharacter
						DEFAULT_CHAR='#'
						
						It "Message length one" outputOutputOptionalOptionHeaderFooterNoPrefixSingleCharacterFormattingCharacter:messageLengthOne
							createHeaderFooter() { echo "#"; }
							cat() { createHeaderFooter; }
							When run output -m=m --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "#"
							The stdout line 2 should equal "m"
							The stdout line 3 should equal "#"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionHeaderFooterNoPrefixSingleCharacterFormattingCharacter:messageLengthTwo
							createHeaderFooter() { echo "##"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "##"
							The stdout line 2 should equal "ms"
							The stdout line 3 should equal "##"
							The status should be success
						End
					End
					Describe "Two character formatting character:" outputOutputOptionalOptionHeaderFooterNoPrefix:twoCharacterFormattingCharacter
						DEFAULT_CHAR='&!'
						
						It "Message length one" outputOutputOptionalOptionHeaderFooterNoPrefixTwoCharacterFormattingCharacter:messageLengthOne
							createHeaderFooter() { echo "&"; }
							cat() { createHeaderFooter; }
							When run output -m=m --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "&"
							The stdout line 2 should equal "m"
							The stdout line 3 should equal "&"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionHeaderFooterNoPrefixTwoCharacterFormattingCharacter:messageLengthTwo
							createHeaderFooter() { echo "&!"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "&!"
							The stdout line 2 should equal "ms"
							The stdout line 3 should equal "&!"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionHeaderFooterNoPrefixTwoCharacterFormattingCharacter:messageLengthThree
							createHeaderFooter() { echo "&!&"; }
							cat() { createHeaderFooter; }
							When run output -m=msg --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "&!&"
							The stdout line 2 should equal "msg"
							The stdout line 3 should equal "&!&"
							The status should be success
						End
					End
					Describe "Many character formatting character:" outputOutputOptionalOptionHeaderFooterNoPrefix:manyCharacterFormattingCharacter
						DEFAULT_CHAR='!#*@'
						
						It "Message length one" outputOutputOptionalOptionHeaderFooterNoPrefixManyCharacterFormattingCharacter:messageLengthOne
							createHeaderFooter() { echo "!"; }
							cat() { createHeaderFooter; }
							When run output -m=m --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "!"
							The stdout line 2 should equal "m"
							The stdout line 3 should equal "!"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionHeaderFooterNoPrefixManyCharacterFormattingCharacter:messageLengthTwo
							createHeaderFooter() { echo "!#"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "!#"
							The stdout line 2 should equal "ms"
							The stdout line 3 should equal "!#"
							The status should be success
						End
						It "Message length three" outputOutputOptionalOptionHeaderFooterNoPrefixManyCharacterFormattingCharacter:messageLengthThree
							createHeaderFooter() { echo "!#*"; }
							cat() { createHeaderFooter; }
							When run output -m=msg --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "!#*"
							The stdout line 2 should equal "msg"
							The stdout line 3 should equal "!#*"
							The status should be success
						End
						It "Message length four" outputOutputOptionalOptionHeaderFooterNoPrefixManyCharacterFormattingCharacter:messageLengthFour
							createHeaderFooter() { echo "!#*@"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1 --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "!#*@"
							The stdout line 2 should equal "msg1"
							The stdout line 3 should equal "!#*@"
							The status should be success
						End
						It "Message length five" outputOutputOptionalOptionHeaderFooterNoPrefixManyCharacterFormattingCharacter:messageLengthFive
							createHeaderFooter() { echo "!#*@!"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1m --header-footer
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal "!#*@!"
							The stdout line 2 should equal "msg1m"
							The stdout line 3 should equal "!#*@!"
							The status should be success
						End
					End
				End
			End
		End
	End
End

