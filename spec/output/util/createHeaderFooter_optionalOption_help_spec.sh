Describe "output(): util:" output:util
	Describe "createHeaderFooter():" createHeaderFooter output:createHeaderFooter util:createHeaderFooter
		# Makes test easier to read and maintain.
		createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
		
		Describe "Optional option(s):" option:optional
			Describe "Help:" option:help
				It "-h" option:"-h"
					When call $createHeaderFooter -h
					The stderr should not be present
					The stdout should include "DESCRIPTION:"
					The status should be success
				End
				It "--help" option:"--help"
					When call $createHeaderFooter --help
					The stderr should not be present
					The stdout should include "DESCRIPTION:"
					The status should be success
				End
			End
		End
	End
End

