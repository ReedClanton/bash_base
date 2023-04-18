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
								When run createHeaderFooter -l=1 --formatting-character=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
								When run createHeaderFooter -l=1 --formatting-character=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
								When run createHeaderFooter -l=1 --formatting-character
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
					End
					Describe "Input invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalidCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:f
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:newLine
								When run createHeaderFooter -l=1 -f="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:backSlash
								When run createHeaderFooter -l=1 -f="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:formattingCharacter
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:newLine
								When run createHeaderFooter -l=1 --formatting-character="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:bachSlash
								When run createHeaderFooter -l=1 --formatting-character="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
					Describe "Input single character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputSingleCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:f
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:spaceWithOneLineLength
								When run createHeaderFooter -l=1 -f=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with " "
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal " \n"
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percentWithOneLineLength
								When run createHeaderFooter -l=1 -f="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "%"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "%\n"
							End
							It "'L' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:LWithOneLineLength
								When run createHeaderFooter -l=1 -f="L"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "L"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "L\n"
							End
							It "'0' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0WithOneLineLength
								When run createHeaderFooter -l=1 -f="0"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "0"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "0\n"
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
							It "Space with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:spaceWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with " "
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal " \n"
							End
							It "Percent with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percentWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "%"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "%\n"
							End
							It "'a' with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:aWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="a"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "a"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "a\n"
							End
							It "Vertical bar with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBarWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="|"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "|"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "|\n"
							End
						End
					End
					Describe "Input multiple characters:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputMultipleCharacters
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:f
							It "Hashtag hashtag with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithOneLineLength
								When run createHeaderFooter -l=1 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "#"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "#\n"
							End
							It "Hashtag hashtag with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithTwoLineLength
								When run createHeaderFooter -l=2 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "##"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "##\n"
							End
							It "Hashtag hashtag with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastagWithThreeLineLength
								When run createHeaderFooter -l=3 -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "###"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "###\n"
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
							It "Question mark question mark question mark with one line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithOneLineLength
								When run createHeaderFooter -l=1 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "?"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "?\n"
							End
							It "Question mark question mark question mark with two line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithTwoLineLength
								When run createHeaderFooter -l=2 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "??"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "??\n"
							End
							It "Question mark question mark question mark with three line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithThreeLineLength
								When run createHeaderFooter -l=3 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "???"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "???\n"
							End
							It "Question mark question mark question mark with four line length" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMarkQuestionMarkWithFourLineLength
								When run createHeaderFooter -l=4 --formatting-character="???"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should start with "????"
								The status should be success
								Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
								The stdout line 1 should equal "????\n"
							End
						End
					End
				End
			End
		End
	End
End

