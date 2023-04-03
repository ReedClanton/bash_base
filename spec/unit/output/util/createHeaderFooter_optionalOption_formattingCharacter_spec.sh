Describe "output():" output
	# Mock out sourcing of constants file.
	inScriptSource() { return 0; }
	
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Formatting character:" outputUtilCreateHeaderFooterOptionalOption:formattingCharacter
					Describe "Input invalid:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalid
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:f
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:blank
								When run source $createHeaderFooter -f=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:null
								When run source $createHeaderFooter -f=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:missing
								When run source $createHeaderFooter -f
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
								When run source $createHeaderFooter --formatting-character=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
								When run source $createHeaderFooter --formatting-character=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
								When run source $createHeaderFooter --formatting-character
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
					End
					Describe "Input invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputInvalidCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:f
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:newLine
								When run source $createHeaderFooter -f="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterF:backSlash
								When run source $createHeaderFooter -f="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacter:formattingCharacter
							It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:newLine
								When run source $createHeaderFooter --formatting-character="\n"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:bachSlash
								When run source $createHeaderFooter --formatting-character="\\"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
					Describe "Input single character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputSingleCharacter
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:f
							It "' '" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:space
								When run source $createHeaderFooter -f=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "  \n"
								The status should be success
							End
							It "'%'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:percent
								When run source $createHeaderFooter -f="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%%\n"
								The status should be success
							End
							It "'L'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:L
								When run source $createHeaderFooter -f="L"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "LL\n"
								The status should be success
							End
							It "'0'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterF:0
								When run source $createHeaderFooter -f="0"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "00\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
							It "' '" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:space
								When run source $createHeaderFooter --formatting-character=" "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "  \n"
								The status should be success
							End
							It "'%'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:percent
								When run source $createHeaderFooter --formatting-character="%"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "%%\n"
								The status should be success
							End
							It "'a'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:a
								When run source $createHeaderFooter --formatting-character="a"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "aa\n"
								The status should be success
							End
							It "'|'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBar
								When run source $createHeaderFooter --formatting-character="|"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "||\n"
								The status should be success
							End
						End
					End
					Describe "Input multiple characters:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:inputMultipleCharacters
						Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:f
							It "'##'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersF:hastagHastag
								When run source $createHeaderFooter -f="##"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "####\n"
								The status should be success
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
							It "??'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMark
								When run source $createHeaderFooter --formatting-character="??"
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

