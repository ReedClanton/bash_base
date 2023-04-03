Describe "output():" output
	# Mock out sourcing of constants file.
	inScriptSource() { return 0; }
	
	Describe "util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Makes test easier to read and maintain.
			createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
			
			Describe "Mock date():" outputUtilCreateHeaderFooter:mockDate
				It "Not defined" outputUtilCreateHeaderFooterMockDate:notDefined
					When run source $createHeaderFooter -f
					The stdout should not be present
					The stderr line 1 should start with "ERROR"
					The status should equal $OPTION_NAME_INVALID_RT
				End
			End
			Describe "Mock date():" outputUtilCreateHeaderFooter:mockDate
				date() { echo "2023/03/31 22:06:55 MDT"; }
				It "Defined" outputUtilCreateHeaderFooterMockDate:defined
					When run source $createHeaderFooter -f
					The stdout should not be present
					The stderr line 1 should start with "2023/03/31 22:06:55 MDT ERROR"
					The status should equal $OPTION_NAME_INVALID_RT
				End
			End
		End
	End
End

