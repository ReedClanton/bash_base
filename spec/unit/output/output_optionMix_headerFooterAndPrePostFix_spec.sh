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
			Describe "--header-footer and postfix and prefix:" outputOutputOptionMix:headerFooterAndPreFixAndPostFix
				Describe "Single character formatting character:" outputOutputOptionMixHeaderFooterAndPreFixAndPostFix:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixSingleCharacterFormattingCharacter:messageLengthOne
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixSingleCharacterFormattingCharacter:messageLengthTwo
						createHeaderFooter() { echo " ####"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --header-footer --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " ####"
						The stdout line 2 should equal "# ms #"
						The stdout line 3 should equal " ####"
						The status should be success
					End
				End
				Describe "Two character formatting character:" outputOutputOptionMixHeaderFooterAndPreFixAndPostFix:twoCharacterFormattingCharacter
					DEFAULT_CHAR='&!'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixTwoCharacterFormattingCharacter:messageLengthOne
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
					It "Message length two" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixTwoCharacterFormattingCharacter:messageLengthTwo
						createHeaderFooter() { echo " &!&!&!"; }
						cat() { createHeaderFooter; }
						When run output -m=ms --header-footer --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " &!&!&!"
						The stdout line 2 should equal "&! ms &!"
						The stdout line 3 should equal " &!&!&!"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixTwoCharacterFormattingCharacter:messageLengthThree
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
				Describe "Many character formatting character:" outputOutputOptionMixHeaderFooterAndPreFixAndPostFix:manyCharacterFormattingCharacter
					DEFAULT_CHAR='!#*@'
					
					It "Message length one" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageLengthOne
						createHeaderFooter() { echo " !#*@!#*@!"; }
						cat() { createHeaderFooter; }
						When run output -m=m --header-footer --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!"
						The stdout line 2 should equal "!#*@ m !#*@"
						The stdout line 3 should equal " !#*@!#*@!"
						The status should be success
					End
					It "Message length two" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageLengthTwo
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
					It "Message length three" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageLengthThree
						createHeaderFooter() { echo " !#*@!#*@!#*"; }
						cat() { createHeaderFooter; }
						When run output -m=msg --header-footer --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#*"
						The stdout line 2 should equal "!#*@ msg !#*@"
						The stdout line 3 should equal " !#*@!#*@!#*"
						The status should be success
					End
					It "Message length four" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageLengthFour
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
					It "Message length five" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageLengthFive
						createHeaderFooter() { echo " !#*@!#*@!#*@!"; }
						cat() { createHeaderFooter; }
						When run output -m=msg1m --header-footer --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal " !#*@!#*@!#*@!"
						The stdout line 2 should equal "!#*@ msg1m !#*@"
						The stdout line 3 should equal " !#*@!#*@!#*@!"
						The status should be success
					End
					It "Message onto next line" outputOutputOptionMixHeaderFooterAndPreFixAndPostFixManyCharacterFormattingCharacter:messageOntoNextLine
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

