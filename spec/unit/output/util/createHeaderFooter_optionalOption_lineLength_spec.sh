Describe "output():" output
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Line length:" outputUtilCreateHeaderFooterOptionalOption:lineLength
					Describe "Input invalid:" outputUtilCreateHeaderFooterOptionalOptionLineLength:inputInvalid
						Describe "-l:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalid:l
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidL:blank
								When call $createHeaderFooter -l=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidL:null
								When call $createHeaderFooter -l=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidL:missing
								When call $createHeaderFooter -l
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
						Describe "--line-length:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalid:lineLength
							It "Blank" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidLineLength:blank
								When call $createHeaderFooter --line-length=""
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Null" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidLineLength:null
								When call $createHeaderFooter --line-length=
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Missing" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputInvalidLineLength:missing
								When call $createHeaderFooter --line-length
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_NAME_INVALID_RT
							End
						End
					End
					Describe "Input special character:" outputUtilCreateHeaderFooterOptionalOptionLineLength:inputSpecialCharacter
						Describe "-l:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacter:l
							It "'+'" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:plus
								When call $createHeaderFooter -l="+50"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "####################################################\n"
								The status should be success
							End
							It "' '" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:space
								When call $createHeaderFooter -l="          75              "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "#############################################################################\n"
								The status should be success
							End
							It "' ' & '+'" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:plusSpace
								When call $createHeaderFooter -l="          +100              "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "######################################################################################################\n"
								The status should be success
							End
						End
						Describe "--line-length:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacter:lineLength
							It "'+'" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:plus
								When call $createHeaderFooter --line-length="+50"
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "####################################################\n"
								The status should be success
							End
							It "' '" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:space
								When call $createHeaderFooter --line-length="          75              "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "#############################################################################\n"
								The status should be success
							End
							It "' ' & '+'" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:plusSpace
								When call $createHeaderFooter --line-length="          +100              "
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "######################################################################################################\n"
								The status should be success
							End
						End
					End
					Describe "Bound:" outputUtilCreateHeaderFooterOptionalOptionLineLength:bound
						Describe "-l:" outputUtilCreateHeaderFooterOptionalOptionLineLengthBound:l
							It "Far bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:farBellowLower
								When call $createHeaderFooter -l="-999999999"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:bellowLower
								When call $createHeaderFooter -l="-1"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "At lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:atLower
								When call $createHeaderFooter -l=0
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "##\n"
								The status should be success
							End
							It "Above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:aboveLower
								When call $createHeaderFooter -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "###\n"
								The status should be success
							End
							It "Far above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:farAboveLower
								When call $createHeaderFooter -l=999
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "#########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################\n"
								The status should be success
							End
						End
						Describe "--line-length:" outputUtilCreateHeaderFooterOptionalOptionLineLengthBound:lineLength
							It "Far bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:farBellowLower
								When call $createHeaderFooter --line-length="-999999999"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:bellowLower
								When call $createHeaderFooter --line-length="-1"
								The stdout should not be present
								The stderr should include "DESCRIPTION:"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "At lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:atLower
								When call $createHeaderFooter --line-length=0
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "##\n"
								The status should be success
							End
							It "Above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:aboveLower
								When call $createHeaderFooter --line-length=1
								The stderr should not be present
								The lines of stdout should equal 1
								The output should equal "###\n"
								The status should be success
							End
							It "Far above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:farAboveLower
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
End

