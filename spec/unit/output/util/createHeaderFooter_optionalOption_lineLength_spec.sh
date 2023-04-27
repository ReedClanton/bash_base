# Setup required environment variable(s).
% CREATE_HEADER_FOOTER_DOC:"#/ DESCRIPTION:"
% DEFAULT_CHAR:'#'
readonly DEFAULT_CHAR

Describe "Output:" output
	Describe "Util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Line length:" outputUtilCreateHeaderFooterOptionalOption:lineLength
					Describe "Input special character:" outputUtilCreateHeaderFooterOptionalOptionLineLength:inputSpecialCharacter
						Describe "-l:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacter:l
							It "Space before" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:spaceBefore
								When run createHeaderFooter -l="          7"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#######"
								The status should be success
							End
							It "Space before and after" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:spaceBeforeAndAfter
								When run createHeaderFooter -l="          75              "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "###########################################################################"
								The status should be success
							End
							It "Space after" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterL:spaceAfter
								When run createHeaderFooter -l="5              "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#####"
								The status should be success
							End
						End
						Describe "--line-length:" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacter:lineLength
							It "Space before" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceBefore
								When run createHeaderFooter --line-length="          9"
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#########"
								The status should be success
							End
							It "Space before and after" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceBeforeAndAfter
								When run createHeaderFooter --line-length="          75              "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "###########################################################################"
								The status should be success
							End
							It "Space after" outputUtilCreateHeaderFooterOptionalOptionLineLengthInputSpecialCharacterLineLength:spaceAfter
								When run createHeaderFooter --line-length="1              "
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#"
								The status should be success
							End
						End
					End
					Describe "Bound:" outputUtilCreateHeaderFooterOptionalOptionLineLength:bound
						Describe "-l:" outputUtilCreateHeaderFooterOptionalOptionLineLengthBound:l
							It "Far bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:farBellowLower
								When run createHeaderFooter -l="-999999999"
								The stdout should not be present
								The lines of stderr should equal 2
								The stderr line 1 should start with "ERROR createHeaderFooter():	"
								The stderr line 2 should equal "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:bellowLower
								When run createHeaderFooter -l="0"
								The stdout should not be present
								The lines of stderr should equal 2
								The stderr line 1 should start with "ERROR createHeaderFooter():	"
								The stderr line 2 should equal "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "At lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:atLower
								When run createHeaderFooter -l=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#"
								The status should be success
							End
							It "Above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:aboveLower
								When run createHeaderFooter -l=2
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "##"
								The status should be success
							End
							It "Far above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundL:farAboveLower
								When run createHeaderFooter -l=1000
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "########################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################"
								The status should be success
							End
						End
						Describe "--line-length:" outputUtilCreateHeaderFooterOptionalOptionLineLengthBound:lineLength
							It "Far bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:farBellowLower
								When run createHeaderFooter --line-length="-999999999"
								The stdout should not be present
								The lines of stderr should equal 2
								The stderr line 1 should start with "ERROR createHeaderFooter():	"
								The stderr line 2 should equal "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "Bellow lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:bellowLower
								When run createHeaderFooter --line-length="0"
								The stdout should not be present
								The lines of stderr should equal 2
								The stderr line 1 should start with "ERROR createHeaderFooter():	"
								The stderr line 2 should equal "$CREATE_HEADER_FOOTER_DOC"
								The status should equal $OPTION_VALUE_INVALID_RT
							End
							It "At lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:atLower
								When run createHeaderFooter --line-length=1
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "#"
								The status should be success
							End
							It "Above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:aboveLower
								When run createHeaderFooter --line-length=2
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "##"
								The status should be success
							End
							It "Far above lower" outputUtilCreateHeaderFooterOptionalOptionLineLengthBoundLineLength:farAboveLower
								When run createHeaderFooter --line-length=10000
								The stderr should not be present
								The lines of stdout should equal 1
								The stdout line 1 should equal "################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################################"
								The status should be success
							End
						End
					End
				End
			End
		End
	End
End

