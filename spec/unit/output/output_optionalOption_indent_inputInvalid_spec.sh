Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "--indent:" outputOutputOptionalOption:indent
				Describe "Input invalid:" outputOutputOptionalOptionIndent:inputInvalid
					It "Blank" outputOutputOptionalOptionIndentInputInvalid:blank
						When run output -m="m" --indent=""
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Null" outputOutputOptionalOptionIndentInputInvalid:null
						When run output -m="m" --indent=
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
					It "Missing" outputOutputOptionalOptionIndentInputInvalid:missing
						When run output -m="m" --indent
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_NAME_INVALID_RT
					End
					It "Float" outputOutputOptionalOptionIndentInputInvalid:float
						When run output -m="m" --indent="1.1"
						The stdout should not be present
						The stderr should start with "ERROR output():	"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
			End
		End
	End
End

