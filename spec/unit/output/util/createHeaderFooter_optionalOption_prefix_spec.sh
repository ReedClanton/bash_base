# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Prefix:" outputUtilCreateHeaderFooterOptionalOption:prefix
					It "Single character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " ###"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " ###\n"
					End
					It "Single character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " ####"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " ####\n"
					End
					It "Two character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -f="&!" -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " &!&!&"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " &!&!&\n"
					End
					It "Two character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -f="&!" -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " &!&!&!"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " &!&!&!\n"
					End
					It "Two character formatting character with three line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacterWithThreeLineLength
						When run createHeaderFooter --prefix -f="&!" -l=3
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " &!&!&!&"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " &!&!&!&\n"
					End
					It "Many character formatting character with one line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithOneLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=1
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " !#*@!#*@!"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " !#*@!#*@!\n"
					End
					It "Many character formatting character with two line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithTwoLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=2
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " !#*@!#*@!#"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " !#*@!#*@!#\n"
					End
					It "Many character formatting character with three line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithThreeLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=3
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " !#*@!#*@!#*"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " !#*@!#*@!#*\n"
					End
					It "Many character formatting character with four line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithFourLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=4
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " !#*@!#*@!#*@"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " !#*@!#*@!#*@\n"
					End
					It "Many character formatting character with five line length" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacterWithFiveLineLength
						When run createHeaderFooter --prefix -f="!#*@" -l=5
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should start with " !#*@!#*@!#*@!"
						The status should be success
						Skip if "shellspec removes trailing '\n' in some shells other than bash so last step of test is skipped" isNotBash
						The stdout line 1 should equal " !#*@!#*@!#*@!\n"
					End
				End
			End
		End
	End
End

