# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		outputPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $outputPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" outputOutput:requiredOption
			Describe "Message:" outputOutputrequiredOption:message
				Describe "Input invalid:" outputOutputrequiredOptionMessage:inputInvalid
					It "None" outputOutputrequiredOptionMessageInputInvalid:none
						When run output
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
					End
					Describe "-m:" outputOutputrequiredOptionMessageInputInvalid:m
						It "Missing" outputOutputrequiredOptionMessageInputInvalidM:missing
							When run output -m
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--msg:" outputOutputrequiredOptionMessageInputInvalid:msg
						It "Missing" outputOutputrequiredOptionMessageInputInvalidMsg:missing
							When run output --msg
							The stdout should not be present
							The stderr should include "ERROR"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
			End
		End
	End
End

