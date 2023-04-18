# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_LINE_LENGTH:100
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	# createHeaderFooter() shouldn't be called, but mock it out just in case.
	createHeaderFooter() { return $CATCHALL_RT; }
	
	Describe "Optional option:" outputOutput:optionalOption
		Describe "Formatting character:" outputOutputOptionalOption:formattingCharacter
			Describe "Input invalid:" outputOutputOptionalOptionFormattingCharacter:inputInvalid
				Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputInvalid:f
					It "Blank" outputOutputOptionalOptionFormattingCharacterInputInvalidF:blank
						When run source $output -m=m -f=""
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputOptionalOptionFormattingCharacterInputInvalidF:null
						When run source $output -m=m -f=
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputOptionalOptionFormattingCharacterInputInvalidF:missing
						When run source $output -m=m -f
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
				Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
					It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
						When run source $output -m=m --formatting-character=""
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
						When run source $output -m=m --formatting-character=
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
						When run source $output -m=m --formatting-character
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
			End
			Describe "Input invalid character:" outputOutputOptionalOptionFormattingCharacter:inputInvalidCharacter
				Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacter:f
					It "'\n'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterF:newLine
						When run source $output -m=m -f="\n"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "'\\'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterF:backSlash
						When run source $output -m=m -f="\\"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "'%'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterF:percent
						When run source $output -m=m -f="%"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
				Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacter:formattingCharacter
					It "'\n'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:newLine
						When run source $output -m=m --formatting-character="\n"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "'\\'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:bachSlash
						When run source $output -m=m --formatting-character="\\"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "'%'" outputOutputOptionalOptionFormattingCharacterInputInvalidCharacterFormattingCharacter:percent
						When run source $output -m=m --formatting-character="%"
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
			End
			Describe "Input single character:" outputOutputOptionalOptionFormattingCharacter:inputSingleCharacter
				Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputSingleCharacter:f
					It "' '" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:space
						When run source $output -m=m --pp -f=" "
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "  m  "
						The status should be success
					End
					It "'L'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:L
						When run source $output -m=m --pp -f="L"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "L m L"
						The status should be success
					End
					It "'0'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterF:0
						When run source $output -m=m --pp -f="0"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "0 m 0"
						The status should be success
					End
				End
				Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputSingleCharacter:formattingCharacter
					It "' '" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:space
						When run source $output -m=m --pp --formatting-character=" "
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "  m  "
						The status should be success
					End
					It "'a'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:a
						When run source $output -m=m --pp --formatting-character="a"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "a m a"
						The status should be success
					End
					It "'|'" outputOutputOptionalOptionFormattingCharacterInputSingleCharacterFormattingCharacter:verticalBar
						When run source $output -m=m --pp --formatting-character="|"
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
						When run source $output -m=m --pp -f="##"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "## m ##"
						The status should be success
					End
				End
				Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputMultipleCharacters:formattigCharacter
					It "??'" outputOutputOptionalOptionFormattingCharacterInputMultipleCharactersFormattingCharacter:questionMarkQuestionMark
						When run source $output -m=m --pp --formatting-character="??"
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

