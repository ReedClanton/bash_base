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
			Describe "Line length:" outputOutputOptionalOption:lineLength
				Describe "Input invalid:" outputOutputOptionalOptionLineLength:inputInvalid
					Describe "-l:" outputOutputOptionalOptionLineLengthInputInvalid:l
						It "Blank" outputOutputOptionalOptionLineLengthInputInvalidL:blank
							When run output -m=m -l=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputOutputOptionalOptionLineLengthInputInvalidL:null
							When run output -m=m -l=
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputOutputOptionalOptionLineLengthInputInvalidL:missing
							When run output -m=m -l
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
						It "Float" outputOutputOptionalOptionLineLengthInputInvalidL:float
							When run output -m=m -l="1.1"
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "'+'" outputOutputOptionalOptionLineLengthInputInvalidL:plus
							When run output -m=m -l="+50"
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--line-length:" outputOutputOptionalOptionLineLengthInputInvalid:lineLength
						It "Blank" outputOutputOptionalOptionLineLengthInputInvalidLineLength:blank
							When run output -m=m --line-length=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputOutputOptionalOptionLineLengthInputInvalidLineLength:null
							When run output -m=m --line-length=
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputOutputOptionalOptionLineLengthInputInvalidLineLength:missing
							When run output -m=m --line-length
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
						It "Float" outputOutputOptionalOptionLineLengthInputInvalidLineLength:float
							When run output -m=m --line-length="1.1"
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "'+'" outputOutputOptionalOptionLineLengthInputInvalidLineLength:plus
							When run output -m=m --line-length="+50"
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

