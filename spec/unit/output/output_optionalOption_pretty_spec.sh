# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:25
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
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Pretty:" outputOutputOptionalOption:pretty
				Describe "Single character formatting character:" outputOutputOptionalOptionPretty:singleCharacterFormattingCharacter
					DEFAULT_CHAR='#'
					
					Describe "--pretty:" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacter:pretty
						It "Message length one" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterPretty:messageLengthOne
							createHeaderFooter() { echo " ###"; }
							cat() { createHeaderFooter; }
							When run output -m=m --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ###"
							The stdout line 2 should equal "# m #"
							The stdout line 3 should equal " ###"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterPretty:messageLengthTwo
							createHeaderFooter() { echo " ####"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ####"
							The stdout line 2 should equal "# ms #"
							The stdout line 3 should equal " ####"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterPretty:multilineMessage
							createHeaderFooter() { echo " ######"; }
							cat() { createHeaderFooter; }
							When run output -m=ms -m=msg2 --pretty
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal " ######"
							The stdout line 2 should equal "# ms   #"
							The stdout line 3 should equal "# msg2 #"
							The stdout line 4 should equal " ######"
							The status should be success
						End
					End
					Describe "-p:" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacter:p
						It "Message length one" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterP:messageLengthOne
							createHeaderFooter() { echo " ###"; }
							cat() { createHeaderFooter; }
							When run output -m=m -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ###"
							The stdout line 2 should equal "# m #"
							The stdout line 3 should equal " ###"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterP:messageLengthTwo
							createHeaderFooter() { echo " ####"; }
							cat() { createHeaderFooter; }
							When run output -m=ms -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ####"
							The stdout line 2 should equal "# ms #"
							The stdout line 3 should equal " ####"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettySingleCharacterFormattingCharacterP:multilineMessage
							createHeaderFooter() { echo " ###########"; }
							cat() { createHeaderFooter; }
							When run output -m="message 1" -m=msg2 -p
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal " ###########"
							The stdout line 2 should equal "# message 1 #"
							The stdout line 3 should equal "# msg2      #"
							The stdout line 4 should equal " ###########"
							The status should be success
						End
					End
				End
				Describe "Two character formatting character:" outputOutputOptionalOptionPretty:twoCharacterFormattingCharacter
					DEFAULT_CHAR='##'
					
					Describe "--pretty:" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacter:pretty
						It "Message length one" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterPretty:messageLengthOne
							createHeaderFooter() { echo " #####"; }
							cat() { createHeaderFooter; }
							When run output -m=m --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #####"
							The stdout line 2 should equal "## m ##"
							The stdout line 3 should equal " #####"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterPretty:messageLengthTwo
							createHeaderFooter() { echo " ######"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ######"
							The stdout line 2 should equal "## ms ##"
							The stdout line 3 should equal " ######"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterPretty:messageLengthThree
							createHeaderFooter() { echo " #######"; }
							cat() { createHeaderFooter; }
							When run output -m=msg --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #######"
							The stdout line 2 should equal "## msg ##"
							The stdout line 3 should equal " #######"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterPretty:multilineMessage
							createHeaderFooter() { echo " #############"; }
							cat() { createHeaderFooter; }
							When run output -m=msg --msg="message 2" --pretty
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal " #############"
							The stdout line 2 should equal "## msg       ##"
							The stdout line 3 should equal "## message 2 ##"
							The stdout line 4 should equal " #############"
							The status should be success
						End
					End
					Describe "-p:" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacter:p
						It "Message length one" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterP:messageLengthOne
							createHeaderFooter() { echo " #####"; }
							cat() { createHeaderFooter; }
							When run output -m=m -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #####"
							The stdout line 2 should equal "## m ##"
							The stdout line 3 should equal " #####"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterP:messageLengthTwo
							createHeaderFooter() { echo " ######"; }
							cat() { createHeaderFooter; }
							When run output -m=ms -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ######"
							The stdout line 2 should equal "## ms ##"
							The stdout line 3 should equal " ######"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterP:messageLengthThree
							createHeaderFooter() { echo " #######"; }
							cat() { createHeaderFooter; }
							When run output -m=msg -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #######"
							The stdout line 2 should equal "## msg ##"
							The stdout line 3 should equal " #######"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettyTwoCharacterFormattingCharacterP:multilineMessage
							createHeaderFooter() { echo " #############"; }
							cat() { createHeaderFooter; }
							When run output --msg=msg -m="message 2" -m="message 3\nmessage 4" -p
							The stderr should not be present
							The lines of stdout should equal 6
							The stdout line 1 should equal " #############"
							The stdout line 2 should equal "## msg       ##"
							The stdout line 3 should equal "## message 2 ##"
							The stdout line 4 should equal "## message 3 ##"
							The stdout line 5 should equal "## message 4 ##"
							The stdout line 6 should equal " #############"
							The status should be success
						End
					End
				End
				Describe "Many character formatting character:" outputOutputOptionalOptionPretty:manyCharacterFormattingCharacter
					DEFAULT_CHAR='####'
					
					Describe "--pretty:" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacter:pretty
						It "Message length one" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:messageLengthOne
							createHeaderFooter() { echo " #########"; }
							cat() { createHeaderFooter; }
							When run output -m=m --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #########"
							The stdout line 2 should equal "#### m ####"
							The stdout line 3 should equal " #########"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:messageLengthTwo
							createHeaderFooter() { echo " ##########"; }
							cat() { createHeaderFooter; }
							When run output -m=ms --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ##########"
							The stdout line 2 should equal "#### ms ####"
							The stdout line 3 should equal " ##########"
							The status should be success
						End
						It "Message length three" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:messageLengthThree
							createHeaderFooter() { echo " ###########"; }
							cat() { createHeaderFooter; }
							When run output -m=msg --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ###########"
							The stdout line 2 should equal "#### msg ####"
							The stdout line 3 should equal " ###########"
							The status should be success
						End
						It "Message length four" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:messageLengthFour
							createHeaderFooter() { echo " ############"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1 --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ############"
							The stdout line 2 should equal "#### msg1 ####"
							The stdout line 3 should equal " ############"
							The status should be success
						End
						It "Message length five" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:messageLengthFive
							createHeaderFooter() { echo " #############"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1m --pretty
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #############"
							The stdout line 2 should equal "#### msg1m ####"
							The stdout line 3 should equal " #############"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterPretty:multilineMessage
							createHeaderFooter() { echo " ##################"; }
							cat() { createHeaderFooter; }
							When run output -m=m -m="0123456789" --pretty
							The stderr should not be present
							The lines of stdout should equal 4
							The stdout line 1 should equal " ##################"
							The stdout line 2 should equal "#### m          ####"
							The stdout line 3 should equal "#### 0123456789 ####"
							The stdout line 4 should equal " ##################"
							The status should be success
						End
					End
					Describe "-p:" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacter:p
						It "Message length one" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:messageLengthOne
							createHeaderFooter() { echo " #########"; }
							cat() { createHeaderFooter; }
							When run output -m=m -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #########"
							The stdout line 2 should equal "#### m ####"
							The stdout line 3 should equal " #########"
							The status should be success
						End
						It "Message length two" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:messageLengthTwo
							createHeaderFooter() { echo " ##########"; }
							cat() { createHeaderFooter; }
							When run output -m=ms -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ##########"
							The stdout line 2 should equal "#### ms ####"
							The stdout line 3 should equal " ##########"
							The status should be success
						End
						It "Message length three" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:messageLengthThree
							createHeaderFooter() { echo " ###########"; }
							cat() { createHeaderFooter; }
							When run output -m=msg -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ###########"
							The stdout line 2 should equal "#### msg ####"
							The stdout line 3 should equal " ###########"
							The status should be success
						End
						It "Message length four" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:messageLengthFour
							createHeaderFooter() { echo " ############"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1 -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " ############"
							The stdout line 2 should equal "#### msg1 ####"
							The stdout line 3 should equal " ############"
							The status should be success
						End
						It "Message length five" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:messageLengthFive
							createHeaderFooter() { echo " #############"; }
							cat() { createHeaderFooter; }
							When run output -m=msg1m -p
							The stderr should not be present
							The lines of stdout should equal 3
							The stdout line 1 should equal " #############"
							The stdout line 2 should equal "#### msg1m ####"
							The stdout line 3 should equal " #############"
							The status should be success
						End
						It "Multiline message" outputOutputOptionalOptionPrettyManyCharacterFormattingCharacterP:multilineMessage
							createHeaderFooter() { echo " #########"; }
							cat() { createHeaderFooter; }
							When run output -m=m --msg=s -m=g -p
							The stderr should not be present
							The lines of stdout should equal 5
							The stdout line 1 should equal " #########"
							The stdout line 2 should equal "#### m ####"
							The stdout line 3 should equal "#### s ####"
							The stdout line 4 should equal "#### g ####"
							The stdout line 5 should equal " #########"
							The status should be success
						End
					End
				End
			End
		End
	End
End

