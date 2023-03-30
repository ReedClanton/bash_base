Describe "output(): util:" output:util
	Describe "createHeaderFooter():" createHeaderFooter output:createHeaderFooter util:createHeaderFooter
		# Makes test easier to read and maintain.
		createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
		
		Describe "Optional option(s):" option:optional
			Describe "Prefix:" option:prefix
				It "Single character formatting character" prefix:singleCharacter
					When call $createHeaderFooter --prefix
					The stderr should not be present
					The lines of stdout should equal 1
					The output should equal " ##\n"
					The status should be success
				End
				It "Two character formatting character" prefix:twoCharacter
					When call $createHeaderFooter --prefix -f="&!"
					The stderr should not be present
					The lines of stdout should equal 1
					The output should equal " &!&!\n"
					The status should be success
				End
				It "Many character formatting character" prefix:manyCharacter
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

