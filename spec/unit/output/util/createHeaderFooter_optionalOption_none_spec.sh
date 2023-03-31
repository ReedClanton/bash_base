Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				It "None" outputUtilCreateHeaderFooterOptionalOption:none
					When call $createHeaderFooter
					The stderr should not be present
					The lines of stdout should equal 1
					The output should equal "##\n"
					The status should be success
				End
			End
		End
	End
End

