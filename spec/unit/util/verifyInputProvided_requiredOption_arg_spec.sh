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
			Describe "Value:" utilVerifyInputProvidedRequiredOption:value
				Describe "Calling doc not returned:" utilVerifyInputProvidedRequiredOptionValueInputInvalid:callingDocNotReturned
					Describe "Alphanumeric:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturned:alphanumeric
						Describe "-v:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumeric:a
							It "Upper case letter" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericV:upperCaseLetter
								When run verifyInputProvided "$CALLING_DOC" -v=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericV:lowerCaseLetter
								When run verifyInputProvided "$CALLING_DOC" -v=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericV:singleDigitNumber
								When run verifyInputProvided "$CALLING_DOC" -v=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericV:sentence
								When run verifyInputProvided "$CALLING_DOC" -v="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--value:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumeric:value
							It "Upper case letter" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericValue:upperCaseLetter
								When run verifyInputProvided "$CALLING_DOC" --value=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericValue:lowerCaseLetter
								When run verifyInputProvided "$CALLING_DOC" --value=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericValue:singleDigitNumber
								When run verifyInputProvided "$CALLING_DOC" --value=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedAlphanumericValue:sentence
								When run verifyInputProvided "$CALLING_DOC" --value="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Symbols:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturned:symbols
						Describe "-v:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbols:v
							It "'\`'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:backtick
								When run verifyInputProvided "$CALLING_DOC" -v=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:tilde
								When run verifyInputProvided "$CALLING_DOC" -v=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:exclamationMark
								When run verifyInputProvided "$CALLING_DOC" -v=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:at
								When run verifyInputProvided "$CALLING_DOC" -v=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:hashtag
								When run verifyInputProvided "$CALLING_DOC" -v=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:dollar
								When run verifyInputProvided "$CALLING_DOC" -v=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:percentSign
								When run verifyInputProvided "$CALLING_DOC" -v=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:caret
								When run verifyInputProvided "$CALLING_DOC" -v=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:ampersand
								When run verifyInputProvided "$CALLING_DOC" -v="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:asterisk
								When run verifyInputProvided "$CALLING_DOC" -v="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:openParentheses
								When run verifyInputProvided "$CALLING_DOC" -v="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:closeParentheses
								When run verifyInputProvided "$CALLING_DOC" -v=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:hyphen
								When run verifyInputProvided "$CALLING_DOC" -v=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:underscore
								When run verifyInputProvided "$CALLING_DOC" -v=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:equal
								When run verifyInputProvided "$CALLING_DOC" -v==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:plus
								When run verifyInputProvided "$CALLING_DOC" -v=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:openSquareBracket
								When run verifyInputProvided "$CALLING_DOC" -v="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:openCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" -v="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:closeSquareBracket
								When run verifyInputProvided "$CALLING_DOC" -v="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:closeCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" -v="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:backslash
								When run verifyInputProvided "$CALLING_DOC" -v="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:verticalBar
								When run verifyInputProvided "$CALLING_DOC" -v="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:semicolon
								When run verifyInputProvided "$CALLING_DOC" -v=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:colon
								When run verifyInputProvided "$CALLING_DOC" -v=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:apostrophe
								When run verifyInputProvided "$CALLING_DOC" -v=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:quotationMark
								When run verifyInputProvided "$CALLING_DOC" -v=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:comma
								When run verifyInputProvided "$CALLING_DOC" -v=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:lessThanSign
								When run verifyInputProvided "$CALLING_DOC" -v="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:period
								When run verifyInputProvided "$CALLING_DOC" -v=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:greaterThanSign
								When run verifyInputProvided "$CALLING_DOC" -v=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:forwardSlash
								When run verifyInputProvided "$CALLING_DOC" -v=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:questionMark
								When run verifyInputProvided "$CALLING_DOC" -v="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsV:space
								When run verifyInputProvided "$CALLING_DOC" -v=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--value:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbols:value
							It "'\`'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:backtick
								When run verifyInputProvided "$CALLING_DOC" --value=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:tilde
								When run verifyInputProvided "$CALLING_DOC" --value=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:exclamationMark
								When run verifyInputProvided "$CALLING_DOC" --value=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:at
								When run verifyInputProvided "$CALLING_DOC" --value=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:hashtag
								When run verifyInputProvided "$CALLING_DOC" --value=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:dollar
								When run verifyInputProvided "$CALLING_DOC" --value=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:percentSign
								When run verifyInputProvided "$CALLING_DOC" --value=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:caret
								When run verifyInputProvided "$CALLING_DOC" --value=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:ampersand
								When run verifyInputProvided "$CALLING_DOC" --value="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:asterisk
								When run verifyInputProvided "$CALLING_DOC" --value="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:openParentheses
								When run verifyInputProvided "$CALLING_DOC" --value="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:closeParentheses
								When run verifyInputProvided "$CALLING_DOC" --value=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:hyphen
								When run verifyInputProvided "$CALLING_DOC" --value=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:underscore
								When run verifyInputProvided "$CALLING_DOC" --value=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:equal
								When run verifyInputProvided "$CALLING_DOC" --value==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:plus
								When run verifyInputProvided "$CALLING_DOC" --value=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:openSquareBracket
								When run verifyInputProvided "$CALLING_DOC" --value="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:openCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" --value="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:closeSquareBracket
								When run verifyInputProvided "$CALLING_DOC" --value="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:closeCurlyBracket
								When run verifyInputProvided "$CALLING_DOC" --value="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:backslash
								When run verifyInputProvided "$CALLING_DOC" --value="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:verticalBar
								When run verifyInputProvided "$CALLING_DOC" --value="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:semicolon
								When run verifyInputProvided "$CALLING_DOC" --value=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:colon
								When run verifyInputProvided "$CALLING_DOC" --value=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:apostrophe
								When run verifyInputProvided "$CALLING_DOC" --value=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:quotationMark
								When run verifyInputProvided "$CALLING_DOC" --value=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:comma
								When run verifyInputProvided "$CALLING_DOC" --value=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:lessThanSign
								When run verifyInputProvided "$CALLING_DOC" --value="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:period
								When run verifyInputProvided "$CALLING_DOC" --value=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:greaterThanSign
								When run verifyInputProvided "$CALLING_DOC" --value=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:forwardSlash
								When run verifyInputProvided "$CALLING_DOC" --value=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:questionMark
								When run verifyInputProvided "$CALLING_DOC" --value="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSymbolsValue:space
								When run verifyInputProvided "$CALLING_DOC" --value=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Special character:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturned:specialCharacter
						Describe "-v:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacter:v
							It "'\0'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:nullCharacter
								When run verifyInputProvided "$CALLING_DOC" -v=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:alarm
								When run verifyInputProvided "$CALLING_DOC" -v=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:backspace
								When run verifyInputProvided "$CALLING_DOC" -v=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:tab
								When run verifyInputProvided "$CALLING_DOC" -v=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:newLine
								When run verifyInputProvided "$CALLING_DOC" -v=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:verticalTab
								When run verifyInputProvided "$CALLING_DOC" -v=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:formFeed
								When run verifyInputProvided "$CALLING_DOC" -v=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:carriageReturn
								When run verifyInputProvided "$CALLING_DOC" -v=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:eof
								When run verifyInputProvided "$CALLING_DOC" -v=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterV:escapeSequence
								When run verifyInputProvided "$CALLING_DOC" -v=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--value:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacter:value
							It "'\0'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:nullCharacter
								When run verifyInputProvided "$CALLING_DOC" --value=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:alarm
								When run verifyInputProvided "$CALLING_DOC" --value=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:backspace
								When run verifyInputProvided "$CALLING_DOC" --value=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:tab
								When run verifyInputProvided "$CALLING_DOC" --value=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:newLine
								When run verifyInputProvided "$CALLING_DOC" --value=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:verticalTab
								When run verifyInputProvided "$CALLING_DOC" --value=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:formFeed
								When run verifyInputProvided "$CALLING_DOC" --value=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:carriageReturn
								When run verifyInputProvided "$CALLING_DOC" --value=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:eof
								When run verifyInputProvided "$CALLING_DOC" --value=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocNotReturnedSpecialCharacterValue:escapeSequence
								When run verifyInputProvided "$CALLING_DOC" --value=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
				End
				Describe "Calling doc returned:" utilVerifyInputProvidedRequiredOptionValueInputInvalid:callingDocReturned
					Describe "-v:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturned:v
						It "Blank" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturnedV:blank
							When run verifyInputProvided "$CALLING_DOC" -v=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturnedV:null
							When run verifyInputProvided "$CALLING_DOC" -v=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "--value:" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturned:value
						It "Blank" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturnedValue:blank
							When run verifyInputProvided "$CALLING_DOC" --value=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilVerifyInputProvidedRequiredOptionValueInputInvalidCallingDocReturnedValue:null
							When run verifyInputProvided "$CALLING_DOC" --value=
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

