Describe "Output:" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Formatting character:" outputUtilCreateHeaderFooterOptionalOption:formattingCharacter
					Describe "Input single character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputSingleCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:f
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:spaceWithOneLineLength
								When run createHeaderFooter -l=1 -f=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal " "
								The status should be success
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percentWithOneLineLength
								When run createHeaderFooter -l=1 -f="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%"
								The status should be success
							End
							It "'L' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:LWithOneLineLength
								When run createHeaderFooter -l=1 -f="L"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "L"
								The status should be success
							End
							It "'0' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0WithOneLineLength
								When run createHeaderFooter -l=1 -f="0"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "0"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:spaceWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal " "
								The status should be success
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percentWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%"
								The status should be success
							End
							It "'a' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:aWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="a"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "a"
								The status should be success
							End
							It "Vertical bar with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBarWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="|"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "|"
								The status should be success
							End
						End
					End
					Describe "Input multiple characters:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputMultipleCharacters
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:f
							It "Hashtag hashtag with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithOneLineLength
								When run createHeaderFooter -l=1 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#"
								The status should be success
							End
							It "Hashtag hashtag with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithTwoLineLength
								When run createHeaderFooter -l=2 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "##"
								The status should be success
							End
							It "Hashtag hashtag with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithThreeLineLength
								When run createHeaderFooter -l=3 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "###"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
							It "Question mark question mark question mark with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "?"
								The status should be success
							End
							It "Question mark question mark question mark with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithTwoLineLength
								When run createHeaderFooter -l=2 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "??"
								The status should be success
							End
							It "Question mark question mark question mark with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithThreeLineLength
								When run createHeaderFooter -l=3 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "???"
								The status should be success
							End
							It "Question mark question mark question mark with four line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithFourLineLength
								When run createHeaderFooter -l=4 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "????"
								The status should be success
							End
						End
					End
				End
			End
		End
	End
End

