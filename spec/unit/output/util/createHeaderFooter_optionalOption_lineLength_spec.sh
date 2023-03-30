Describe "output(): util:" output:util
	Describe "createHeaderFooter():" createHeaderFooter output:createHeaderFooter util:createHeaderFooter
		# Makes test easier to read and maintain.
		createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
		
		Describe "Optional option(s):" option:optional
			Describe "Line length:" option:lineLength
				Describe "Input invalid:" lineLength:invalid
					Describe "-l:" option:"-l"
						It "Blank" lineLength:blank
							When call $createHeaderFooter -l=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Blank" lineLength:blank
							When call $createHeaderFooter --line-length=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-l:" option:"-l"
						It "Null" lineLength:null
							When call $createHeaderFooter -l=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Null" lineLength:null
							When call $createHeaderFooter --line-length=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-l:" option:"-l"
						It "Missing" lineLength:missing
							When call $createHeaderFooter -l
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Missing" lineLength:missing
							When call $createHeaderFooter --line-length
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
				Describe "Input special character(s):" lineLength:specialChar
					Describe "-l:" option:"-l"
						It "'+'" lineLength:"+" lineLength:plus
							When call $createHeaderFooter -l="+50"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "####################################################\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "'+'" lineLength:"+" lineLength:plus
							When call $createHeaderFooter --line-length="+50"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "####################################################\n"
							The status should be success
						End
					End
					Describe "-l:" option:"-l"
						It "' '" lineLength:" " lineLength:space
							When call $createHeaderFooter -l="          75              "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "#############################################################################\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "' '" lineLength:" " lineLength:space
							When call $createHeaderFooter --line-length="          75              "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "#############################################################################\n"
							The status should be success
						End
					End
					Describe "-l:" option:"-l"
						It "' ' & '+'" lineLength:" +" lineLength:"+ " lineLength:spacePlus lineLength:plusSpace
							When call $createHeaderFooter -l="          +100              "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "######################################################################################################\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "' ' & '+'" lineLength:" +" lineLength:"+ " lineLength:spacePlus lineLength:plusSpace
							When call $createHeaderFooter --line-length="          +100              "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "######################################################################################################\n"
							The status should be success
						End
					End
				End
				Describe "Bound:" bound lineLength:bound
					Describe "-l:" option:"-l"
						It "Far bellow lower" bound:farBellowLower
							When call $createHeaderFooter -l="-999999999"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Far bellow lower" bound:farBellowLower
							When call $createHeaderFooter --line-length="-999999999"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-l:" option:"-l"
						It "Bellow lower" bound:bellowLower
							When call $createHeaderFooter -l="-1"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Bellow lower" bound:bellowLower
							When call $createHeaderFooter --line-length="-1"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-l:" option:"-l"
						It "At lower" bound:atLower
							When call $createHeaderFooter -l=0
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "##\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "At lower" bound:atLower
							When call $createHeaderFooter --line-length=0
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "##\n"
							The status should be success
						End
					End
					Describe "-l:" option:"-l"
						It "Above lower" bound:aboveLower
							When call $createHeaderFooter -l=1
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "###\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Above lower" bound:aboveLower
							When call $createHeaderFooter --line-length=1
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "###\n"
							The status should be success
						End
					End
					Describe "-l:" option:"-l"
						It "Far above lower" bound:farAboveLower
							When call $createHeaderFooter -l=999
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "#########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################\n"
							The status should be success
						End
					End
					Describe "--line-length:" option:"--line-length"
						It "Far above lower" bound:farAboveLower
							When run $createHeaderFooter --line-length=999
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "#########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################\n"
							The status should be success
						End
					End
				End
			End
		End
	End
End

