# Setup required environment variable(s).
% CREATE_HEADER_FOOTER_DOC:"#/ DESCRIPTION:"

Describe "Output:" output
	Describe "Util:" output:util
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
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:null
								When run createHeaderFooter -f=
								The stdout should not be present
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidF:missing
								When run createHeaderFooter -f
								The stdout should not be present
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
								When run createHeaderFooter --formatting-character=""
								The stdout should not be present
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
								When run createHeaderFooter --formatting-character=
								The stdout should not be present
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
								When run createHeaderFooter --formatting-character
								The stdout should not be present
								The stderr line 1 should start with "ERROR createHeaderFooter(): "
								The stderr should include "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "Invalid character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalid:invalidCharacter
							Describe "-f:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacter:f
								It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacterF:newLine
									When run createHeaderFooter -f="\n"
									The stdout should not be present
									The stderr line 1 should start with "ERROR createHeaderFooter(): "
									The stderr should include "$CREATE_HEADER_FOOTER_DOC"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
								It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacterF:backSlash
									When run createHeaderFooter -f="\\"
									The stdout should not be present
									The stderr line 1 should start with "ERROR createHeaderFooter(): "
									The stderr should include "$CREATE_HEADER_FOOTER_DOC"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
							End
							Describe "--formatting-character:" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacter:formattingCharacter
								It "'\n'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacterFormattingCharacter:newLine
									When run createHeaderFooter --formatting-character="\n"
									The stdout should not be present
									The stderr line 1 should start with "ERROR createHeaderFooter(): "
									The stderr should include "$CREATE_HEADER_FOOTER_DOC"
									The status should equal $OPTION_VALUE_INVALID_RT
								End
								It "'\\'" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidInvalidCharacterFormattingCharacter:bachSlash
									When run createHeaderFooter --formatting-character="\\"
									The stdout should not be present
									The stderr line 1 should start with "ERROR createHeaderFooter(): "
									The stderr should include "$CREATE_HEADER_FOOTER_DOC"
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

