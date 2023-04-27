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
			Describe "Formatting character:" outputOutputOptionalOption:formattingCharacter
				Describe "Input single character:" outputOutputOptionalOptionFormattingCharacter:inputSingleCharacter
					Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputSingleCharacter:f
						It "' '" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:space
							When run output -m=m --pp -f=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "  m  "
							The status should be success
						End
						It "'L'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:L
							When run output -m=m --pp -f="L"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "L m L"
							The status should be success
						End
						It "'0'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:0
							When run output -m=m --pp -f="0"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "0 m 0"
							The status should be success
						End
					End
					Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
						It "' '" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:space
							When run output -m=m --pp --formatting-character=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "  m  "
							The status should be success
						End
						It "'a'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:a
							When run output -m=m --pp --formatting-character="a"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "a m a"
							The status should be success
						End
						It "'|'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBar
							When run output -m=m --pp --formatting-character="|"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "| m |"
							The status should be success
						End
					End
				End
				Describe "Input multiple characters:" outputOutputOptionalOptionFormattingCharacter:inputMultipleCharacters
					Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputMultipleCharacters:f
						It "'##'" outputOutputOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastag
							When run output -m=m --pp -f="##"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "## m ##"
							The status should be success
						End
					End
					Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
						It "??'" outputOutputOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMark
							When run output -m=m --pp --formatting-character="??"
							The stderr should not be present
							The lines of stdout should equal 1
							The stdout line 1 should equal "?? m ??"
							The status should be success
						End
					End
				End
			End
		End
	End
End

