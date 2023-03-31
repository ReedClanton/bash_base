Describe "output():" output:output
	# Makes test easier to read and maintain.
	output=$PWD/src/shell/functions/output/output.sh
	
	Describe "Required option:" option:required
		Describe "Message:" option:message
			Describe "Input single line:" message:singleLine
				Describe "-m:" option:"-m"
					It "Alphanumeric" message:alphanumeric
						When call $output -m="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Alphanumeric" message:alphanumeric
						When call $output --msg="mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3"
						The status should be success
					End
				End
				Describe "-m:" option:"-m"
					It "Sentence" message:sentence
						When call $output -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Sentence" message:sentence
						When call $output --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The output should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input multiple lines, single message:" message:multipleLinesSingleMessage
				Describe "-m:" option:"-m"
					It "Sentence"
						When call $output -m="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Sentence"
						When call $output --msg="mes6sag3 mes6sag3 mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input multiple lines, multiple messages:" message:multipleLinesMultipleMessages
				Describe "-m:" option:"-m"
					It "Sentence" message:multipleMessages
						When call $output -m="mes6sag3 mes6sag3" -m="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Sentence" message:multipleMessages
						When call $output --msg="mes6sag3 mes6sag3" --msg="mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 2
						The stdout line 1 should equal "mes6sag3 mes6sag3"
						The stdout line 2 should equal "mes6sag3 mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "-m:" option:"-m"
					It "Sentence" message:multipleLinesPerMessageAndMultipleMessages
						When call $output -m="mes6sag3\nmes6sag3" -m="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 4
						The stdout line 1 should equal "mes6sag3"
						The stdout line 2 should equal "mes6sag3"
						The stdout line 3 should equal "mes6sag3"
						The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Sentence" message:multipleLinesPerMessageAndMultipleMessages
						When call $output --msg="mes6sag3\nmes6sag3" --msg="mes6sag3\nmes6sag3 mes6sag3 mes6sag3"
						The stderr should not be present
						The lines of stdout should equal 4
						The stdout line 1 should equal "mes6sag3"
						The stdout line 2 should equal "mes6sag3"
						The stdout line 3 should equal "mes6sag3"
						The stdout line 4 should equal "mes6sag3 mes6sag3 mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input tabs:" message:tabs
				Describe "-m:" option:"-m"
					It "Sentence"
						When call $output -m="mes6sag3\t\tmes6sag3\t"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "mes6sag3		mes6sag3	"
						The status should be success
					End
				End
				Describe "--msg:" option:"--msg"
					It "Sentence"
						When call $output --msg="\tmes6sag3\t\tmes6sag3"
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "	mes6sag3		mes6sag3"
						The status should be success
					End
				End
			End
			Describe "Input invalid:" message:invalid
				Describe "-m:" option:"-m"
					It "Blank" message:blank
						When call $output -m=""
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
				Describe "-msg:" option:"-msg"
					It "Blank" message:blank
						When call $output --msg=""
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
				Describe "-m:" option:"-m"
					It "Null" message:null
						When call $output -m=
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
				Describe "-msg:" option:"-msg"
					It "Null" message:null
						When call $output --msg=
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_VALUE_INVALID_RT
					End
				End
				Describe "-m:" option:"-m"
					It "Missing" message:missing
						When call $output -m
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
				Describe "-msg:" option:"-msg"
					It "Missing" message:missing
						When call $output --msg
						The stdout should not be present
						The stderr should include "DESCRIPTION:"
						The status should equal $OPTION_NAME_INVALID_RT
					End
				End
			End
		End
	End
End

