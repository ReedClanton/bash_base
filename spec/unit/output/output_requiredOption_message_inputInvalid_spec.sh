# Setup required environment variable(s).
% OUTPUT_DOC:"#/ DESCRIPTION:"
% DEFAULT_LINE_LENGTH:10
readonly DEFAULT_LINE_LENGTH
% DEFAULT_INDENT:0
readonly DEFAULT_INDENT

Describe "Output:" output
	Describe "output():" output:output
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/output/output.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" outputOutput:requiredOption
			Describe "Message:" outputOutputRequiredOption:message
				Describe "Input invalid:" outputOutputRequiredOptionMessage:inputInvalid
					It "None" outputOutputRequiredOptionMessageInputInvalid:none
						When run output
						The stdout should not be present
						The stderr line 1 should start with "ERROR output(): "
						The stderr should include "$OUTPUT_DOC"
						The status should equal $OPTION_REQUIRED_NOT_PROVIDED_RT
					End
					Describe "-m:" outputOutputRequiredOptionMessageInputInvalid:m
						It "Missing" outputOutputRequiredOptionMessageInputInvalidM:missing
							When run output -m
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--msg:" outputOutputRequiredOptionMessageInputInvalid:msg
						It "Missing" outputOutputRequiredOptionMessageInputInvalidMsg:missing
							When run output --msg
							The stdout should not be present
							The stderr line 1 should start with "ERROR output(): "
							The stderr should include "$OUTPUT_DOC"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
			End
		End
	End
End

