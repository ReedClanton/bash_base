Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Formatting character:" outputUtilCreateHeaderFooterOptionalOption:formattingCharacter
					Describe "Input invalid:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalid
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:f
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:blank
								When run createHeaderFooter -f=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:null
								When run createHeaderFooter -f=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:missing
								When run createHeaderFooter -f
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
								When run createHeaderFooter --formatting-character=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
								When run createHeaderFooter --formatting-character=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
								When run createHeaderFooter --formatting-character
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
					End
					Describe "Input invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalidCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:f
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:newLine
								When run createHeaderFooter -f="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:backSlash
								When run createHeaderFooter -f="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:formattingCharacter
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:newLine
								When run createHeaderFooter --formatting-character="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:bachSlash
								When run createHeaderFooter --formatting-character="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
					Describe "Input single character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputSingleCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:f
							It "Space with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:spaceWithZeroLineLength
								When run createHeaderFooter -f=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:spaceWithOneLineLength
								When run createHeaderFooter -f=" " -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal " \n"
								The status should be success
							End
							It "Percent with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percentWithZeroLineLength
								When run createHeaderFooter -f="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percentWithOneLineLength
								When run createHeaderFooter -f="%" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%\n"
								The status should be success
							End
							It "'L' with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:LWithZeroLineLength
								When run createHeaderFooter -f="L"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "'L' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:LWithOneLineLength
								When run createHeaderFooter -f="L" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "L\n"
								The status should be success
							End
							It "'0' with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0WithZeroLineLength
								When run createHeaderFooter -f="0"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "'0' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0WithOneLineLength
								When run createHeaderFooter -f="0" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "0\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
							It "Space with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:spaceWithZeroLineLength
								When run createHeaderFooter --formatting-character=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:spaceWithOneLineLength
								When run createHeaderFooter --formatting-character=" " -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal " \n"
								The status should be success
							End
							It "Percent with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percentWithZeroLineLength
								When run createHeaderFooter --formatting-character="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percentWithOneLineLength
								When run createHeaderFooter --formatting-character="%" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%\n"
								The status should be success
							End
							It "'a' with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:aWithZeroLineLength
								When run createHeaderFooter --formatting-character="a"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "'a' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:aWithOneLineLength
								When run createHeaderFooter --formatting-character="a" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "a\n"
								The status should be success
							End
							It "Vertical bar with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBarWithZeroLineLength
								When run createHeaderFooter --formatting-character="|"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Vertical bar with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBarWithOneLineLength
								When run createHeaderFooter --formatting-character="|" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "|\n"
								The status should be success
							End
						End
					End
					Describe "Input multiple characters:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputMultipleCharacters
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:f
							It "Hashtag hashtag with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithZeroLineLength
								When run createHeaderFooter -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Hashtag hashtag with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithOneLineLength
								When run createHeaderFooter -f="##" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#\n"
								The status should be success
							End
							It "Hashtag hashtag with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithTwoLineLength
								When run createHeaderFooter -f="##" -l=2
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "##\n"
								The status should be success
							End
							It "Hashtag hashtag with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithThreeLineLength
								When run createHeaderFooter -f="##" -l=3
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "###\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
							It "Question mark question mark question mark with zero line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithZeroLineLength
								When run createHeaderFooter --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "\n"
								The status should be success
							End
							It "Question mark question mark question mark with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithOneLineLength
								When run createHeaderFooter --formatting-character="???" -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "?\n"
								The status should be success
							End
							It "Question mark question mark question mark with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithTwoLineLength
								When run createHeaderFooter --formatting-character="???" -l=2
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "??\n"
								The status should be success
							End
							It "Question mark question mark question mark with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithThreeLineLength
								When run createHeaderFooter --formatting-character="???" -l=3
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "???\n"
								The status should be success
							End
							It "Question mark question mark question mark with four line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithFourLineLength
								When run createHeaderFooter --formatting-character="???" -l=4
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "????\n"
								The status should be success
							End
						End
					End
				End
			End
		End
	End
End

