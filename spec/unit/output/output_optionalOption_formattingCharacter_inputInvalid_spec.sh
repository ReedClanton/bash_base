Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Formatting character:" outputOutputOptionalOption:formattingCharacter
				Describe "Input invalid:" outputOutputOptionalOptionFormattingCharacter:inputInvalid
					Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputInvalid:f
						It "Blank" outputOutputOptionalOptionFormattingCharacterInputInvalidF:blank
							When run output -m=m -f=""
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputOutputOptionalOptionFormattingCharacterInputInvalidF:null
							When run output -m=m -f=
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputOutputOptionalOptionFormattingCharacterInputInvalidF:missing
							When run output -m=m -f
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
						It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
							When run output -m=m --formatting-character=""
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
							When run output -m=m --formatting-character=
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
							When run output -m=m --formatting-character
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "Invalid character:" outputOutputOptionalOptionFormattingCharacter:invalidCharacter
						Describe "-f:" outputOutputOptionalOptionFormattingCharacterInvalidCharacter:f
							It "'\n'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterF:newLine
								When run output -m=m -f="\n"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterF:backSlash
								When run output -m=m -f="\\"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'%'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterF:percent
								When run output -m=m -f="%"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInvalidCharacter:formattingCharacter
							It "'\n'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterFormattingCharacter:newLine
								When run output -m=m --formatting-character="\n"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterFormattingCharacter:bachSlash
								When run output -m=m --formatting-character="\\"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'%'" outputOutputOptionalOptionFormattingCharacterInvalidCharacterFormattingCharacter:percent
								When run output -m=m --formatting-character="%"
								The stdout should not be present
								The stderr should include "ERROR"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
				End
			End
		End
	End
End

