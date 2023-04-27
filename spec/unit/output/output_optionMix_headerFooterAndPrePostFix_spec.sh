# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:15
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
		
		Describe "Option mix:" outputOutput:optionMix
			Describe "--header-footer and --pre-post-fix:" outputOutputOptionMix:headerFooterAndPrePostFix
				Describe "Single character formatting character:" outputOutputOptionMixHeaderFooterAndPrePostFix:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthOne
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthTwo
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
				Describe "Two character formatting character:" outputOutputOptionMixHeaderFooterAndPrePostFix:twoCharacterFormattingCharacter
					DEFAULT_CHAR='&!'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthOne
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthTwo
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthThree
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
				Describe "Many character formatting character:" outputOutputOptionMixHeaderFooterAndPrePostFix:manyCharacterFormattingCharacter
					DEFAULT_CHAR='!#*@'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthOne
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthTwo
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
					It "Message length three" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthThree
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
					It "Message length four" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthFour
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
					It "Message length five" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageLengthFive
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
					It "Message onto next line" outputOutputOptionMixHeaderFooterAndPrePostFixSingleCharacterFormattingCharacter:messageOntoNextLine
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

