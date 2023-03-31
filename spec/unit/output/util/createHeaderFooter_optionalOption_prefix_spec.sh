Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Prefix:" outputUtilCreateHeaderFooterOptionalOption:prefix
					It "Single character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:singleCharacterFormattingCharacter
						When call $createHeaderFooter --prefix
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal " ##\n"
						The status should be success
					End
					It "Two character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:twoCharacterFormattingCharacter
						When call $createHeaderFooter --prefix -f="&!"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal " &!&!\n"
						The status should be success
					End
					It "Many character formatting character" outputUtilCreateHeaderFooterOptionalOptionPrefix:manyCharacterFormattingCharacter
						When call $createHeaderFooter --prefix -f="!$*@"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal " !$*@!$*@\n"
						The status should be success
					End
				End
			End
		End
	End
End

