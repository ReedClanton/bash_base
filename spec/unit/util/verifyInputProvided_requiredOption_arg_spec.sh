# Setup required environment variable(s).
% CALLING_DOC:"#/ DESCRIPTION: caller"

Describe "Util:" util
	Describe "verifyInputProvided():" util:verifyInputProvided
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/verifyInputProvided.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" utilVerifyInputProvided:requiredOption
			Describe "Arg:" utilVerifyInputProvidedRequiredOption:arg
				Describe "Calling doc not returned:" utilVerifyInputProvidedRequiredOptionArgInputInvalid:callingDocNotReturned
					Describe "Alphanumeric:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturned:alphanumeric
						Describe "-a:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumeric:a
							It "Upper case letter" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:upperCaseLetter
								When run verifyInputProvided "$CALLING_DOC" -a=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:lowerCaseLetter
								When run verifyInputProvided "$CALLING_DOC" -a=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:singleDigitNumber
								When run verifyInputProvided "$CALLING_DOC" -a=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:sentence
								When run verifyInputProvided "$CALLING_DOC" -a="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumeric:arg
							It "Upper case letter" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:upperCaseLetter
								When run verifyInputProvided "$CALLING_DOC" --arg=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:lowerCaseLetter
								When run verifyInputProvided "$CALLING_DOC" --arg=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:singleDigitNumber
								When run verifyInputProvided "$CALLING_DOC" --arg=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:sentence
								When run verifyInputProvided "$CALLING_DOC" --arg="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Symbols:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturned:symbols
						Describe "-a:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbols:a
							It "'\`'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:backtick
								When run verifyInputProvided "$CALLING_DOC" -a=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:tilde
								When run verifyInputProvided "$CALLING_DOC" -a=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:exclamationMark
								When run verifyInputProvided "$CALLING_DOC" -a=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:at
								When run verifyInputProvided "$CALLING_DOC" -a=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:hashtag
								When run verifyInputProvided "$CALLING_DOC" -a=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:dollar
								When run verifyInputProvided "$CALLING_DOC" -a=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:percentSign
								When run verifyInputProvided "$CALLING_DOC" -a=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:caret
								When run verifyInputProvided "$CALLING_DOC" -a=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:ampersand
								When run verifyInputProvided "$CALLING_DOC" -a="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:asterisk
								When run verifyInputProvided "$CALLING_DOC" -a="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openParentheses
								When run verifyInputProvided "$CALLING_DOC" -a="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeParentheses
								When run verifyInputProvided "$CALLING_DOC" -a=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:hyphen
								When run verifyInputProvided "$CALLING_DOC" -a=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:underscore
								When run verifyInputProvided "$CALLING_DOC" -a=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:equal
								When run verifyInputProvided "$CALLING_DOC" -a==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:plus
								When run verifyInputProvided "$CALLING_DOC" -a=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openSquareBracket
								When run verifyInputProvided "$CALLING_DOC" -a="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" -a="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeSquareBracket
								When run verifyInputProvided "$CALLING_DOC" -a="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" -a="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:backslash
								When run verifyInputProvided "$CALLING_DOC" -a="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:verticalBar
								When run verifyInputProvided "$CALLING_DOC" -a="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:semicolon
								When run verifyInputProvided "$CALLING_DOC" -a=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:colon
								When run verifyInputProvided "$CALLING_DOC" -a=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:apostrophe
								When run verifyInputProvided "$CALLING_DOC" -a=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:quotationMark
								When run verifyInputProvided "$CALLING_DOC" -a=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:comma
								When run verifyInputProvided "$CALLING_DOC" -a=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:lessThanSign
								When run verifyInputProvided "$CALLING_DOC" -a="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:period
								When run verifyInputProvided "$CALLING_DOC" -a=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:greaterThanSign
								When run verifyInputProvided "$CALLING_DOC" -a=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:forwardSlash
								When run verifyInputProvided "$CALLING_DOC" -a=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:questionMark
								When run verifyInputProvided "$CALLING_DOC" -a="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:space
								When run verifyInputProvided "$CALLING_DOC" -a=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbols:arg
							It "'\`'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:backtick
								When run verifyInputProvided "$CALLING_DOC" --arg=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:tilde
								When run verifyInputProvided "$CALLING_DOC" --arg=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:exclamationMark
								When run verifyInputProvided "$CALLING_DOC" --arg=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:at
								When run verifyInputProvided "$CALLING_DOC" --arg=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:hashtag
								When run verifyInputProvided "$CALLING_DOC" --arg=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:dollar
								When run verifyInputProvided "$CALLING_DOC" --arg=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:percentSign
								When run verifyInputProvided "$CALLING_DOC" --arg=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:caret
								When run verifyInputProvided "$CALLING_DOC" --arg=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:ampersand
								When run verifyInputProvided "$CALLING_DOC" --arg="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:asterisk
								When run verifyInputProvided "$CALLING_DOC" --arg="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openParentheses
								When run verifyInputProvided "$CALLING_DOC" --arg="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeParentheses
								When run verifyInputProvided "$CALLING_DOC" --arg=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:hyphen
								When run verifyInputProvided "$CALLING_DOC" --arg=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:underscore
								When run verifyInputProvided "$CALLING_DOC" --arg=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:equal
								When run verifyInputProvided "$CALLING_DOC" --arg==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:plus
								When run verifyInputProvided "$CALLING_DOC" --arg=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openSquareBracket
								When run verifyInputProvided "$CALLING_DOC" --arg="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" --arg="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeSquareBracket
								When run verifyInputProvided "$CALLING_DOC" --arg="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" --arg="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:backslash
								When run verifyInputProvided "$CALLING_DOC" --arg="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:verticalBar
								When run verifyInputProvided "$CALLING_DOC" --arg="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:semicolon
								When run verifyInputProvided "$CALLING_DOC" --arg=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:colon
								When run verifyInputProvided "$CALLING_DOC" --arg=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:apostrophe
								When run verifyInputProvided "$CALLING_DOC" --arg=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:quotationMark
								When run verifyInputProvided "$CALLING_DOC" --arg=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:comma
								When run verifyInputProvided "$CALLING_DOC" --arg=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:lessThanSign
								When run verifyInputProvided "$CALLING_DOC" --arg="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:period
								When run verifyInputProvided "$CALLING_DOC" --arg=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:greaterThanSign
								When run verifyInputProvided "$CALLING_DOC" --arg=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:forwardSlash
								When run verifyInputProvided "$CALLING_DOC" --arg=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:questionMark
								When run verifyInputProvided "$CALLING_DOC" --arg="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:space
								When run verifyInputProvided "$CALLING_DOC" --arg=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Special character:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturned:specialCharacter
						Describe "-a:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacter:a
							It "'\0'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:nullCharacter
								When run verifyInputProvided "$CALLING_DOC" -a=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:alarm
								When run verifyInputProvided "$CALLING_DOC" -a=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:backspace
								When run verifyInputProvided "$CALLING_DOC" -a=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:tab
								When run verifyInputProvided "$CALLING_DOC" -a=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:newLine
								When run verifyInputProvided "$CALLING_DOC" -a=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:verticalTab
								When run verifyInputProvided "$CALLING_DOC" -a=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:formFeed
								When run verifyInputProvided "$CALLING_DOC" -a=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:carriageReturn
								When run verifyInputProvided "$CALLING_DOC" -a=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:eof
								When run verifyInputProvided "$CALLING_DOC" -a=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:escapeSequence
								When run verifyInputProvided "$CALLING_DOC" -a=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacter:arg
							It "'\0'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:nullCharacter
								When run verifyInputProvided "$CALLING_DOC" --arg=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:alarm
								When run verifyInputProvided "$CALLING_DOC" --arg=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:backspace
								When run verifyInputProvided "$CALLING_DOC" --arg=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:tab
								When run verifyInputProvided "$CALLING_DOC" --arg=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:newLine
								When run verifyInputProvided "$CALLING_DOC" --arg=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:verticalTab
								When run verifyInputProvided "$CALLING_DOC" --arg=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:formFeed
								When run verifyInputProvided "$CALLING_DOC" --arg=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:carriageReturn
								When run verifyInputProvided "$CALLING_DOC" --arg=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:eof
								When run verifyInputProvided "$CALLING_DOC" --arg=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:escapeSequence
								When run verifyInputProvided "$CALLING_DOC" --arg=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
				End
				Describe "Calling doc returned:" utilVerifyInputProvidedRequiredOptionArgInputInvalid:callingDocReturned
					Describe "-a:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturned:a
						It "Blank" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturnedA:blank
							When run verifyInputProvided "$CALLING_DOC" -a=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturnedA:null
							When run verifyInputProvided "$CALLING_DOC" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "--arg:" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturned:arg
						It "Blank" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturnedArg:blank
							When run verifyInputProvided "$CALLING_DOC" --arg=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilVerifyInputProvidedRequiredOptionArgInputInvalidCallingDocReturnedArg:null
							When run verifyInputProvided "$CALLING_DOC" --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
			End
		End
	End
End

