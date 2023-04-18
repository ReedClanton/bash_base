# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Mock out 'cat' so it returns stdin.
			cat() { input=""; read input; echo $input; }
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Prefix:" outputUtilCreateHeaderFooterOptionalOption:prefix
					It "Single character formatting character with zero line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacterWithZeroLineLength
						When run createHeaderFooter --prefix
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " ##\n"
						The status should be success
					End
					It "Single character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " ###\n"
						The status should be success
					End
					It "Single character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " ####\n"
						The status should be success
					End
					It "Two character formatting character with zero line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithZeroLineLength
						When run createHeaderFooter --prefix -f="&!"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " &!&!\n"
						The status should be success
					End
					It "Two character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -f="&!" -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " &!&!&\n"
						The status should be success
					End
					It "Two character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -f="&!" -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " &!&!&!\n"
						The status should be success
					End
					It "Two character formatting character with three line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithThreeLineLength
						When run createHeaderFooter --prefix -f="&!" -l=3
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " &!&!&!&\n"
						The status should be success
					End
					It "Many character formatting character with zero line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithZeroLineLength
						When run createHeaderFooter --prefix -f="!#*@"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@\n"
						The status should be success
					End
					It "Many character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@!\n"
						The status should be success
					End
					It "Many character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@!#\n"
						The status should be success
					End
					It "Many character formatting character with three line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithThreeLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=3
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@!#*\n"
						The status should be success
					End
					It "Many character formatting character with four line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithFourLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=4
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@!#*@\n"
						The status should be success
					End
					It "Many character formatting character with five line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithFiveLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=5
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !#*@!#*@!#*@!\n"
						The status should be success
					End
				End
			End
		End
	End
End

