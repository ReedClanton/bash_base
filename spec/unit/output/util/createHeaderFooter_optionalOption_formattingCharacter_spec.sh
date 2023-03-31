Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Formatting character:" outputUtilCreateHeaderFooterOptionalOption:formattingCharacter
					Describe "Input invalid:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalid
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:f
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:blank
								When call $createHeaderFooter -f=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:null
								When call $createHeaderFooter -f=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:missing
								When call $createHeaderFooter -f
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
								When call $createHeaderFooter --formatting-character=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
								When call $createHeaderFooter --formatting-character=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
								When call $createHeaderFooter --formatting-character
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
					End
					Describe "Input invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalidCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:f
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:newLine
								When call $createHeaderFooter -f="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:backSlash
								When call $createHeaderFooter -f="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:formattingCharacter
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:newLine
								When call $createHeaderFooter --formatting-character="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:bachSlash
								When call $createHeaderFooter --formatting-character="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
					Describe "Input single character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputSingleCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:f
							It "' '" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:space
								When call $createHeaderFooter -f=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "  \n"
								The status should be success
							End
							It "'%'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percent
								When call $createHeaderFooter -f="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "%%\n"
								The status should be success
							End
							It "'L'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:L
								When call $createHeaderFooter -f="L"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "LL\n"
								The status should be success
							End
							It "'0'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0
								When call $createHeaderFooter -f="0"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "00\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
							It "' '" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:space
								When call $createHeaderFooter --formatting-character=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "  \n"
								The status should be success
							End
							It "'%'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percent
								When call $createHeaderFooter --formatting-character="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "%%\n"
								The status should be success
							End
							It "'a'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:a
								When call $createHeaderFooter --formatting-character="a"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "aa\n"
								The status should be success
							End
							It "'|'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBar
								When call $createHeaderFooter --formatting-character="|"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "||\n"
								The status should be success
							End
						End
					End
					Describe "Input multiple characters:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputMultipleCharacters
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:f
							It "'##'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastag
								When call $createHeaderFooter -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "####\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
							It "??'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMark
								When call $createHeaderFooter --formatting-character="??" -l=5
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "?????????\n"
								The status should be success
							End
						End
					End
				End
			End
		End
	End
End

