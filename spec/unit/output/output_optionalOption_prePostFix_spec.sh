# Setup required environment variable(s).
% DEFAULT_LINE_LENGTH:11
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
		
		Describe "Optional option:" outputOutput:optionalOption
			Describe "Prefix and postfix:" outputOutputOptionalOption:prefixAndPostfix
				Describe "--pp:" outputOutputOptionalOptionPrefixAndPostfix:pp
					It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:singleCharacterFormattingCharacter
						DEFAULT_CHAR='#'
						When run output -m=m --pp
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "# m #"
						The status should be success
					End
					It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:twoCharacterFormattingCharacter
						DEFAULT_CHAR='&!'
						When run output -m=m --pp
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "&! m &!"
						The status should be success
					End
					It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPp:manyCharacterFormattingCharacter
						DEFAULT_CHAR='!#*@'
						When run output -m=m --pp
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "!#*@ m !#*@"
						The status should be success
					End
					It "Many character formatting character, message broken up" outputOutputOptionalOptionPrefixAndPostfixPp:manyCharacterFormattingCharacterMessageBrokenUp
						DEFAULT_CHAR='!#*@'
						When run output -m=msg --pp
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "!#*@ m !#*@"
						The stdout line 2 should equal "!#*@ s !#*@"
						The stdout line 3 should equal "!#*@ g !#*@"
						The status should be success
					End
					It "Formatting character too long for line" outputOutputOptionalOptionPrefixAndPostfixPp:formattingCharacterTooLongForLine
						DEFAULT_CHAR='!#*@>'
						When run output -m=m --pp
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $ENV_VAR_BAD_VALUE_RT
					End
				End
				Describe "--pre-post-fix:" outputOutputOptionalOptionPrefixAndPostfix:prePostFix
					It "Single character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:singleCharacterFormattingCharacter
						DEFAULT_CHAR='#'
						When run output -m=m --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "# m #"
						The status should be success
					End
					It "Two character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:twoCharacterFormattingCharacter
						DEFAULT_CHAR='&!'
						When run output -m=m --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "&! m &!"
						The status should be success
					End
					It "Many character formatting character" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:manyCharacterFormattingCharacter
						DEFAULT_CHAR='!#*@'
						When run output -m=m --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "!#*@ m !#*@"
						The status should be success
					End
					It "Many character formatting character, message broken up" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:manyCharacterFormattingCharacterMessageBrokenUp
						DEFAULT_CHAR='!#*@'
						When run output --msg=msg --pre-post-fix
						The stderr should not be present
						The lines of stdout should equal 3
						The stdout line 1 should equal "!#*@ m !#*@"
						The stdout line 2 should equal "!#*@ s !#*@"
						The stdout line 3 should equal "!#*@ g !#*@"
						The status should be success
					End
					It "Formatting character too long for line" outputOutputOptionalOptionPrefixAndPostfixPrePostFix:formattingCharacterTooLongForLine
						DEFAULT_CHAR='!#*@>'
						When run output --msg=m --pre-post-fix
						The stdout should not be present
						The stderr should include "ERROR"
						The status should equal $ENV_VAR_BAD_VALUE_RT
					End
				End
			End
		End
	End
End

