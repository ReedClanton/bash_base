Describe "output(): util:bla" output:util
	Describe "createHeaderFooter():bla" createHeaderFooter output:createHeaderFooter util:createHeaderFooter
		# Makes test easier to read and maintain.
		createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
		
		Describe "Optional option(s):" option:optional
			Describe "Formatting character:" option:formattingCharacter
				Describe "Input invalid:" formattingCharacter:invalid
					Describe "-c:" option:"-c"
						It "Blank" formattingCharacter:blank
							When call $createHeaderFooter -c=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--char:" option:"--char"
						It "Blank" formattingCharacter:blank
							When call $createHeaderFooter --char=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-c:" option:"-c"
						It "Null" formattingCharacter:null
							When call $createHeaderFooter -c=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--char:" option:"--char"
						It "Null" formattingCharacter:null
							When call $createHeaderFooter --char=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-c:" option:"-c"
						It "Missing" formattingCharacter:missing
							When call $createHeaderFooter -c
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--char:" option:"--char"
						It "Missing" formattingCharacter:missing
							When call $createHeaderFooter --char
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
				Describe "Input invalid character:" formattingCharacter:invalid
					Describe "-c:" option:"-c"
						It "'\n'" formattingCharacter:"\n" formattingCharacter:newLine
							When call $createHeaderFooter -c="\n"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--char:" option:"--char"
						It "'\n'" formattingCharacter:"\n" formattingCharacter:newLine
							When call $createHeaderFooter --char="\n"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-c:" option:"-c"
						It "'\\'" formattingCharacter:"\\" formattingCharacter:backSlash
							When call $createHeaderFooter -c="\\"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--char:" option:"--char"
						It "'\\'" formattingCharacter:"\\" formattingCharacter:bachSlash
							When call $createHeaderFooter --char="\\"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
				End
				Describe "Input single nominal character:" formattingCharacter:singleNominalCharacter
					Describe "-c:" option:"-c"
						It "' '" formattingCharacter:" " formattingCharacter:space
							When call $createHeaderFooter -c=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "  \n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "' '" formattingCharacter:" " formattingCharacter:space
							When call $createHeaderFooter --char=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "  \n"
							The status should be success
						End
					End
					Describe "-c:" option:"-c"
						It "'%'" formattingCharacter:"%" formattingCharacter:percent
							When call $createHeaderFooter -c="%"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "%%\n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "'%'" formattingCharacter:"%" formattingCharacter:percent
							When call $createHeaderFooter -c="%"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "%%\n"
							The status should be success
						End
					End
					Describe "-c:" option:"-c"
						It "'L'" formattingCharacter:L
							When call $createHeaderFooter -c="L"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "LL\n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "'a'" formattingCharacter:a
							When call $createHeaderFooter --char="a"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "aa\n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "'0'" formattingCharacter:0
							When call $createHeaderFooter --char="0"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "00\n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "'|'" formattingCharacter:"|" formattingCharacter:verticalBar
							When call $createHeaderFooter --char="|"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "||\n"
							The status should be success
						End
					End
				End
				Describe "Input multiple nominal character(s):" formattingCharacter:multipleNominalCharacters
					Describe "-c:" option:"-c"
						It "'##'" formattingCharacter:## formattingCharacter:hastagHastag
							When call $createHeaderFooter -c="##"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "####\n"
							The status should be success
						End
					End
					Describe "--char:" option:"--char"
						It "??'" formattingCharacter:?? formattingCharacter:questionMarkQuestionMark
							When call $createHeaderFooter --char="??" -l=5
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "?????????\n"
							The status should be success
						End
					End
				End
			End
		End
	End
End

