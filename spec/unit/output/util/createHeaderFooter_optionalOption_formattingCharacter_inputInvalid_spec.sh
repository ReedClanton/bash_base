Describe "Output:" output
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
						Describe "Invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacter:invalidCharacter
							Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacter:f
								It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacterF:newLine
									When run createHeaderFooter -l=1 -f="\n"
									The stdout should not be present
									The stderr should include "DESCRIPTION:"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
								It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacterF:backSlash
									When run createHeaderFooter -l=1 -f="\\"
									The stdout should not be present
									The stderr should include "DESCRIPTION:"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
							End
							Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacter:formattingCharacter
								It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacterFormattingCharacter:newLine
									When run createHeaderFooter -l=1 --formatting-character="\n"
									The stdout should not be present
									The stderr should include "DESCRIPTION:"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
								It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInvalidCharacterFormattingCharacter:bachSlash
									When run createHeaderFooter -l=1 --formatting-character="\\"
									The stdout should not be present
									The stderr should include "DESCRIPTION:"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
							End
						End
					End
				End
			End
		End
	End
End

