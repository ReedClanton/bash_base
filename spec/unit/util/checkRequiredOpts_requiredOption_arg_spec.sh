# Setup required environment variable(s).
% CALLING_DOC:"#/ DESCRIPTION: caller"

Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" utilCheckRequiredOpts:requiredOption
			Describe "Arg:" utilCheckRequiredOptsRequiredOption:arg
				Describe "Calling doc not returned:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:callingDocNotReturned
					Describe "Alphanumeric:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturned:alphanumeric
						Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumeric:a
							It "Upper case letter" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:upperCaseLetter
								When run checkRequiredOpts "$CALLING_DOC" -a=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:lowerCaseLetter
								When run checkRequiredOpts "$CALLING_DOC" -a=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:singleDigitNumber
								When run checkRequiredOpts "$CALLING_DOC" -a=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:sentence
								When run checkRequiredOpts "$CALLING_DOC" -a="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumeric:arg
							It "Upper case letter" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:upperCaseLetter
								When run checkRequiredOpts "$CALLING_DOC" --arg=A
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Lower case letter" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:lowerCaseLetter
								When run checkRequiredOpts "$CALLING_DOC" --arg=x
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Single digit number" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericArg:singleDigitNumber
								When run checkRequiredOpts "$CALLING_DOC" --arg=3
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "Sentence" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedAlphanumericA:sentence
								When run checkRequiredOpts "$CALLING_DOC" --arg="someText s p a c e s and n1u2m3b4e5r6s7"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Symbols:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturned:symbols
						Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbols:a
							It "'\`'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:backtick
								When run checkRequiredOpts "$CALLING_DOC" -a=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:tilde
								When run checkRequiredOpts "$CALLING_DOC" -a=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:exclamationMark
								When run checkRequiredOpts "$CALLING_DOC" -a=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:at
								When run checkRequiredOpts "$CALLING_DOC" -a=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:hashtag
								When run checkRequiredOpts "$CALLING_DOC" -a=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:dollar
								When run checkRequiredOpts "$CALLING_DOC" -a=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:percentSign
								When run checkRequiredOpts "$CALLING_DOC" -a=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:caret
								When run checkRequiredOpts "$CALLING_DOC" -a=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:ampersand
								When run checkRequiredOpts "$CALLING_DOC" -a="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:asterisk
								When run checkRequiredOpts "$CALLING_DOC" -a="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openParentheses
								When run checkRequiredOpts "$CALLING_DOC" -a="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeParentheses
								When run checkRequiredOpts "$CALLING_DOC" -a=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:hyphen
								When run checkRequiredOpts "$CALLING_DOC" -a=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:underscore
								When run checkRequiredOpts "$CALLING_DOC" -a=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:equal
								When run checkRequiredOpts "$CALLING_DOC" -a==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:plus
								When run checkRequiredOpts "$CALLING_DOC" -a=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openSquareBracket
								When run checkRequiredOpts "$CALLING_DOC" -a="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:openCurlyBracket
								When run checkRequiredOpts "$CALLING_DOC" -a="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeSquareBracket
								When run checkRequiredOpts "$CALLING_DOC" -a="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:closeCurlyBracket
								When run checkRequiredOpts "$CALLING_DOC" -a="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:backslash
								When run checkRequiredOpts "$CALLING_DOC" -a="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:verticalBar
								When run checkRequiredOpts "$CALLING_DOC" -a="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:semicolon
								When run checkRequiredOpts "$CALLING_DOC" -a=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:colon
								When run checkRequiredOpts "$CALLING_DOC" -a=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:apostrophe
								When run checkRequiredOpts "$CALLING_DOC" -a=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:quotationMark
								When run checkRequiredOpts "$CALLING_DOC" -a=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:comma
								When run checkRequiredOpts "$CALLING_DOC" -a=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:lessThanSign
								When run checkRequiredOpts "$CALLING_DOC" -a="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:period
								When run checkRequiredOpts "$CALLING_DOC" -a=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:greaterThanSign
								When run checkRequiredOpts "$CALLING_DOC" -a=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:forwardSlash
								When run checkRequiredOpts "$CALLING_DOC" -a=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:questionMark
								When run checkRequiredOpts "$CALLING_DOC" -a="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsA:space
								When run checkRequiredOpts "$CALLING_DOC" -a=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbols:arg
							It "'\`'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:backtick
								When run checkRequiredOpts "$CALLING_DOC" --arg=\`
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'~'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:tilde
								When run checkRequiredOpts "$CALLING_DOC" --arg=~
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'!'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:exclamationMark
								When run checkRequiredOpts "$CALLING_DOC" --arg=!
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'@'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:at
								When run checkRequiredOpts "$CALLING_DOC" --arg=@
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'#'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:hashtag
								When run checkRequiredOpts "$CALLING_DOC" --arg=#
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'$'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:dollar
								When run checkRequiredOpts "$CALLING_DOC" --arg=$
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'%'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:percentSign
								When run checkRequiredOpts "$CALLING_DOC" --arg=%
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'^'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:caret
								When run checkRequiredOpts "$CALLING_DOC" --arg=^
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'&'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:ampersand
								When run checkRequiredOpts "$CALLING_DOC" --arg="&"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'*'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:asterisk
								When run checkRequiredOpts "$CALLING_DOC" --arg="*"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'('" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openParentheses
								When run checkRequiredOpts "$CALLING_DOC" --arg="("
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "')'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeParentheses
								When run checkRequiredOpts "$CALLING_DOC" --arg=")"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'-'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:hyphen
								When run checkRequiredOpts "$CALLING_DOC" --arg=-
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'_'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:underscore
								When run checkRequiredOpts "$CALLING_DOC" --arg=_
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'='" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:equal
								When run checkRequiredOpts "$CALLING_DOC" --arg==
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'+'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:plus
								When run checkRequiredOpts "$CALLING_DOC" --arg=+
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'['" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openSquareBracket
								When run checkRequiredOpts "$CALLING_DOC" --arg="["
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'{'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:openCurlyBracket
								When run checkRequiredOpts "$CALLING_DOC" --arg="{"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "']'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeSquareBracket
								When run checkRequiredOpts "$CALLING_DOC" --arg="]"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'}'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:closeCurlyBracket
								When run checkRequiredOpts "$CALLING_DOC" --arg="}"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\\'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:backslash
								When run checkRequiredOpts "$CALLING_DOC" --arg="\\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'|'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:verticalBar
								When run checkRequiredOpts "$CALLING_DOC" --arg="|"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "';'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:semicolon
								When run checkRequiredOpts "$CALLING_DOC" --arg=";"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "':'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:colon
								When run checkRequiredOpts "$CALLING_DOC" --arg=:
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'''" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:apostrophe
								When run checkRequiredOpts "$CALLING_DOC" --arg=\'
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It '"' utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:quotationMark
								When run checkRequiredOpts "$CALLING_DOC" --arg=\"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "','" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:comma
								When run checkRequiredOpts "$CALLING_DOC" --arg=,
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'<'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:lessThanSign
								When run checkRequiredOpts "$CALLING_DOC" --arg="<"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'.'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:period
								When run checkRequiredOpts "$CALLING_DOC" --arg=.
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'>'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:greaterThanSign
								When run checkRequiredOpts "$CALLING_DOC" --arg=">"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'/'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:forwardSlash
								When run checkRequiredOpts "$CALLING_DOC" --arg=/
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'?'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:questionMark
								When run checkRequiredOpts "$CALLING_DOC" --arg="?"
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "' '" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSymbolsArg:space
								When run checkRequiredOpts "$CALLING_DOC" --arg=" "
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
					Describe "Special character:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturned:specialCharacter
						Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacter:a
							It "'\0'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:nullCharacter
								When run checkRequiredOpts "$CALLING_DOC" -a=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:alarm
								When run checkRequiredOpts "$CALLING_DOC" -a=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:backspace
								When run checkRequiredOpts "$CALLING_DOC" -a=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:tab
								When run checkRequiredOpts "$CALLING_DOC" -a=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:newLine
								When run checkRequiredOpts "$CALLING_DOC" -a=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:verticalTab
								When run checkRequiredOpts "$CALLING_DOC" -a=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:formFeed
								When run checkRequiredOpts "$CALLING_DOC" -a=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:carriageReturn
								When run checkRequiredOpts "$CALLING_DOC" -a=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:eof
								When run checkRequiredOpts "$CALLING_DOC" -a=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterA:escapeSequence
								When run checkRequiredOpts "$CALLING_DOC" -a=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
						Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacter:arg
							It "'\0'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:nullCharacter
								When run checkRequiredOpts "$CALLING_DOC" --arg=\0
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\a'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:alarm
								When run checkRequiredOpts "$CALLING_DOC" --arg=\a
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\b'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:backspace
								When run checkRequiredOpts "$CALLING_DOC" --arg=\b
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\t'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:tab
								When run checkRequiredOpts "$CALLING_DOC" --arg=\t
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\n'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:newLine
								When run checkRequiredOpts "$CALLING_DOC" --arg=\n
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\v'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:verticalTab
								When run checkRequiredOpts "$CALLING_DOC" --arg=\v
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\f'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:formFeed
								When run checkRequiredOpts "$CALLING_DOC" --arg=\f
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\r'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:carriageReturn
								When run checkRequiredOpts "$CALLING_DOC" --arg=\r
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'EOF'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:eof
								When run checkRequiredOpts "$CALLING_DOC" --arg=EOF
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
							It "'\e'" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocNotReturnedSpecialCharacterArg:escapeSequence
								When run checkRequiredOpts "$CALLING_DOC" --arg=\e
								The stderr should not be present
								The stdout should not be present
								The status should be success
							End
						End
					End
				End
				Describe "Calling doc returned:" utilCheckRequiredOptsRequiredOptionArgInputInvalid:callingDocReturned
					Describe "-a:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturned:a
						It "Blank" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturnedA:blank
							When run checkRequiredOpts "$CALLING_DOC" -a=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturnedA:null
							When run checkRequiredOpts "$CALLING_DOC" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "--arg:" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturned:arg
						It "Blank" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturnedArg:blank
							When run checkRequiredOpts "$CALLING_DOC" --arg=""
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Null" utilCheckRequiredOptsRequiredOptionArgInputInvalidCallingDocReturnedArg:null
							When run checkRequiredOpts "$CALLING_DOC" --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$CALLING_DOC"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
			End
		End
	End
End

