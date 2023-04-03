# Set constant(s) use here so configuration changes won't cause tests to fail.
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "output():" output
	# Mock out sourcing of constants file.
	inScriptSource() { return 0; }
	
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Prefix:" outputUtilCreateHeaderFooterOptionalOption:prefix
					It "Single character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacter
						When run source $createHeaderFooter --prefix
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " ##\n"
						The status should be success
					End
					It "Two character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacter
						When run source $createHeaderFooter --prefix -f="&!"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " &!&!\n"
						The status should be success
					End
					It "Many character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacter
						When run source $createHeaderFooter --prefix -f="!$*@"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal " !$*@!$*@\n"
						The status should be success
					End
				End
			End
		End
	End
End

