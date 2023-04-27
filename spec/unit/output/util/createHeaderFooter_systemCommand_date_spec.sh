Describe "Output:" output
	Describe "Util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Mock date():" outputUtilCreateHeaderFooter:mockDate
				It "Not defined" outputUtilCreateHeaderFooterMockDate:notDefined
					When run createHeaderFooter -f
					The stdout should not be present
					The stderr line 1 should start with "ERROR createHeaderFooter():	"
					The status should equal $OPTION_NAME_INVALID_RT
				End
				It "Defined" outputUtilCreateHeaderFooterMockDate:defined
					date() { echo "2023/03/31 22:06:55 MDT"; }
					When run createHeaderFooter -f
					The stdout should not be present
					The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR createHeaderFooter():	"
					The status should equal $OPTION_NAME_INVALID_RT
				End
			End
		End
	End
End

