Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required argument:" utilCheckRequiredOpts:requiredArgument
			Describe "Calling doc:" utilCheckRequiredOptsRequiredArgument:callingDoc
				Describe "Single line:" utilCheckRequiredOptsRequiredArgumentCallingDocProvided:singleLine
					Describe "Alphanumeric" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLine:alphanumeric
						It "Upper case letter" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLineAlphanumeric:upperCaseLetter
							When run checkRequiredOpts "A" -a=A
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Lower case letter" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLineAlphanumeric:lowerCaseLetter
							When run checkRequiredOpts "z" --arg=z
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Single digit number" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLineAlphanumeric:singleDigitNumber
							When run checkRequiredOpts "5" -a=5398 --arg=abc
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
						It "Sentence" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLineAlphanumeric:sentence
							When run checkRequiredOpts "bla4BLA0" --arg="blabla" -a="bla1 Bla"
							The stderr should not be present
							The stdout should not be present
							The status should be success
						End
					End
					Describe "Symbols:" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLine:symbols
						Todo "Write tests."
					End
					Describe "Any supported character:" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLine:anySupportedCharacter
						Describe "Special characters:" utilCheckRequiredOptsRequiredArgumentCallingDocProvidedSingleLineAnySupportedCharacter:specialCharacters
							Todo "Write tests."
						End
						Todo "Write tests."
					End
				End
				Describe "Multiple lines:" utilCheckRequiredOptsRequiredArgumentCallingDocProvided:multipleLines
					Todo "Write tests."
				End
			End
		End
	End
End

