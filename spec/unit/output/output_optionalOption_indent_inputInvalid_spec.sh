Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		outputPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $outputPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Indent:" outputOutputOptionalOption:indent
				Describe "Input invalid:" outputOutputOptionalOptionIndent:inputInvalid
					Describe "--indent:" outputOutputOptionalOptionIndentInputInvalid:indent
						It "Blank" outputOutputOptionalOptionIndentInputInvalidIndent:blank
							When run output -m="m" --indent=""
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Null" outputOutputOptionalOptionIndentInputInvalidIndent:null
							When run output -m="m" --indent=
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
						It "Missing" outputOutputOptionalOptionIndentInputInvalidIndent:missing
							When run output -m="m" --indent
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_NAME_INVALID_RT
						End
						It "Float" outputOutputOptionalOptionIndentInputInvalidIndent:float
							When run output -m="m" --indent="1.1"
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

