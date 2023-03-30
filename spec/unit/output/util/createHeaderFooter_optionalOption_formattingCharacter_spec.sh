Describe "output(): util:" output:util
	Describe "createHeaderFooter():" createHeaderFooter output:createHeaderFooter util:createHeaderFooter
		# Makes test easier to read and maintain.
		createHeaderFooter=$PWD/src/shell/functions/output/util/createHeaderFooter.sh
		
		Describe "Optional option(s):" option:optional
			Describe "Formatting character:" option:formattingCharacter
				Describe "Input invalid:" formattingCharacter:invalid
					Describe "-f:" option:"-f"
						It "Blank" formattingCharacter:blank
							When call $createHeaderFooter -f=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "Blank" formattingCharacter:blank
							When call $createHeaderFooter --formatting-character=""
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-f:" option:"-f"
						It "Null" formattingCharacter:null
							When call $createHeaderFooter -f=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "Null" formattingCharacter:null
							When call $createHeaderFooter --formatting-character=
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-f:" option:"-f"
						It "Missing" formattingCharacter:missing
							When call $createHeaderFooter -f
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "Missing" formattingCharacter:missing
							When call $createHeaderFooter --formatting-character
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_NAME_INVALID_RT
						End
					End
				End
				Describe "Input invalid character:" formattingCharacter:invalid
					Describe "-f:" option:"-f"
						It "'\n'" formattingCharacter:"\n" formattingCharacter:newLine
							When call $createHeaderFooter -f="\n"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'\n'" formattingCharacter:"\n" formattingCharacter:newLine
							When call $createHeaderFooter --formatting-character="\n"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "-f:" option:"-f"
						It "'\\'" formattingCharacter:"\\" formattingCharacter:backSlash
							When call $createHeaderFooter -f="\\"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'\\'" formattingCharacter:"\\" formattingCharacter:bachSlash
							When call $createHeaderFooter --formatting-character="\\"
							The stdout should not be present
							The stderr should include "DESCRIPTION:"
							The status should equal $OPTION_VALUE_INVALID_RT
						End
					End
				End
				Describe "Input single nominal character:" formattingCharacter:singleNominalCharacter
					Describe "-f:" option:"-f"
						It "' '" formattingCharacter:" " formattingCharacter:space
							When call $createHeaderFooter -f=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "  \n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "' '" formattingCharacter:" " formattingCharacter:space
							When call $createHeaderFooter --formatting-character=" "
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "  \n"
							The status should be success
						End
					End
					Describe "-f:" option:"-f"
						It "'%'" formattingCharacter:"%" formattingCharacter:percent
							When call $createHeaderFooter -f="%"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "%%\n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'%'" formattingCharacter:"%" formattingCharacter:percent
							When call $createHeaderFooter --formatting-character="%"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "%%\n"
							The status should be success
						End
					End
					Describe "-f:" option:"-f"
						It "'L'" formattingCharacter:L
							When call $createHeaderFooter -f="L"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "LL\n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'a'" formattingCharacter:a
							When call $createHeaderFooter --formatting-character="a"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "aa\n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'0'" formattingCharacter:0
							When call $createHeaderFooter --formatting-character="0"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "00\n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "'|'" formattingCharacter:"|" formattingCharacter:verticalBar
							When call $createHeaderFooter --formatting-character="|"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "||\n"
							The status should be success
						End
					End
				End
				Describe "Input multiple nominal character(s):" formattingCharacter:multipleNominalCharacters
					Describe "-f:" option:"-f"
						It "'##'" formattingCharacter:## formattingCharacter:hastagHastag
							When call $createHeaderFooter -f="##"
							The stderr should not be present
							The lines of stdout should equal 1
							The output should equal "####\n"
							The status should be success
						End
					End
					Describe "--formatting-character:" option:"--formatting-character"
						It "??'" formattingCharacter:?? formattingCharacter:questionMarkQuestionMark
							When call $createHeaderFooter --formatting-character="??" -l=5
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

