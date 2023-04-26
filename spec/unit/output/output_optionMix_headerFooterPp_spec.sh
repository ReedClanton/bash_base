# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:15
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		outputPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $outputPath; }
		BeforeAll 'sourceCut'
		
		Describe "Option mix:" outputOutput:optionMix
			Describe "--header-footer and --pp:" outputOutputOptionMix:headerFooterAndPp
				Describe "Single character formatting character:" outputOutputOptionMixHeaderFooterAndPp:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthOne
						createHeaderFooter() { echo " ###"; }
						cat() { createHeaderFooter; }
						When run output -m=m --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " ###"
						The stdout line 2 should equal "# m #"
						The stdout line 3 should equal " ###"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthTwo
						createHeaderFooter() { echo " ####"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " ####"
						The stdout line 2 should equal "# ms #"
						The stdout line 3 should equal " ####"
						The status should be success
					End
				End
				Describe "Two character formatting character:" outputOutputOptionMixHeaderFooterAndPp:twoCharacterFormattingCharacter
					DEFAULT_CHAR='&!'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthOne
						createHeaderFooter() { echo " &!&!&"; }
						cat() { createHeaderFooter; }
						When run output -m=m --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " &!&!&"
						The stdout line 2 should equal "&! m &!"
						The stdout line 3 should equal " &!&!&"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthTwo
						createHeaderFooter() { echo " &!&!&!"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " &!&!&!"
						The stdout line 2 should equal "&! ms &!"
						The stdout line 3 should equal " &!&!&!"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthThree
						createHeaderFooter() { echo " &!&!&!&"; }
						cat() { createHeaderFooter; }
						When run output -m=msg --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " &!&!&!&"
						The stdout line 2 should equal "&! msg &!"
						The stdout line 3 should equal " &!&!&!&"
						The status should be success
					End
				End
				Describe "Many character formatting character:" outputOutputOptionMixHeaderFooterAndPp:manyCharacterFormattingCharacter
					DEFAULT_CHAR='!#*@'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthOne
						createHeaderFooter() { echo " !#*@!#*@!"; }
						cat() { createHeaderFooter; }
						When run output -m=m --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!"
						The stdout line 2 should equal "!#*@ m !#*@"
						The stdout line 3 should equal " !#*@!#*@!"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthTwo
						createHeaderFooter() { echo " !#*@!#*@!#"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#"
						The stdout line 2 should equal "!#*@ ms !#*@"
						The stdout line 3 should equal " !#*@!#*@!#"
						The status should be success
					End
					It "Message length three" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthThree
						createHeaderFooter() { echo " !#*@!#*@!#*"; }
						cat() { createHeaderFooter; }
						When run output -m=msg --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#*"
						The stdout line 2 should equal "!#*@ msg !#*@"
						The stdout line 3 should equal " !#*@!#*@!#*"
						The status should be success
					End
					It "Message length four" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthFour
						createHeaderFooter() { echo " !#*@!#*@!#*@"; }
						cat() { createHeaderFooter; }
						When run output -m=msg1 --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#*@"
						The stdout line 2 should equal "!#*@ msg1 !#*@"
						The stdout line 3 should equal " !#*@!#*@!#*@"
						The status should be success
					End
					It "Message length five" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageLengthFive
						createHeaderFooter() { echo " !#*@!#*@!#*@!"; }
						cat() { createHeaderFooter; }
						When run output -m=msg1m --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#*@!"
						The stdout line 2 should equal "!#*@ msg1m !#*@"
						The stdout line 3 should equal " !#*@!#*@!#*@!"
						The status should be success
					End
					It "Message onto next line" outputOutputOptionMixHeaderFooterAndPpSingleCharacterFormattingCharacter:messageOntoNextLine
						createHeaderFooter() { echo " !#*@!#*@!#*@!"; }
						cat() { createHeaderFooter; }
						When run output -m=msg1ms --header-footer --pp
						The stderr should not be present
						The lines of stdout should equal 4
						The stdout line 1 should equal " !#*@!#*@!#*@!"
						The stdout line 2 should equal "!#*@ msg1m !#*@"
						The stdout line 3 should equal "!#*@ s     !#*@"
						The stdout line 4 should equal " !#*@!#*@!#*@!"
						The status should be success
					End
				End
			End
		End
	End
End

