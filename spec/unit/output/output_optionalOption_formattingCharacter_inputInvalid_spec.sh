# Setup required environment variable(s).
% OUTPUT_DOC:"#/ DESCRIPTION:"

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
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputOutputOptionalOptionFormattingCharacterInputInvalidF:null
							When run output -m=m -f=
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputOutputOptionalOptionFormattingCharacterInputInvalidF:missing
							When run output -m=m -f
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputInvalid:formattingCharacter
						It "Blank" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:blank
							When run output -m=m --formatting-character=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:null
							When run output -m=m --formatting-character=
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputUtilCreateHeaderFooterOptionalOptionFormattingCharacterInputInvalidFormattingCharacter:missing
							When run output -m=m --formatting-character
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "Invalid character:" outputOutputOptionalOptionFormattingCharacterInputInvalid:invalidCharacter
						Describe "-f:" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacter:f
							It "'\n'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterF:newLine
								When run output -m=m -f="\n"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterF:backSlash
								When run output -m=m -f="\\"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'%'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterF:percent
								When run output -m=m -f="%"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
						Describe "--formatting-character:" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacter:formattingCharacter
							It "'\n'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterFormattingCharacter:newLine
								When run output -m=m --formatting-character="\n"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'\\'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterFormattingCharacter:bachSlash
								When run output -m=m --formatting-character="\\"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "'%'" outputOutputOptionalOptionFormattingCharacterInputInvalidInvalidCharacterFormattingCharacter:percent
								When run output -m=m --formatting-character="%"
								The stdout should not be present
								The stderr line 1 should start with "ERROR output(): "
								The stderr should include "$OUTPUT_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
						End
					End
				End
			End
		End
	End
End

