# Example doc used for testing bellow. It's generated in the same way as real function docs.
LOG_DOC=$(
	cat <<"EOF"
#/ DESCRIPTION:
#/	Used to produce log messages. Current global log level, tracked by
#/
#/ USAGE: log [OPTIONS]... -m="message text"...
#/
#/ NOTE(S):
#/	- Method may not use log... hopfully it's obvious why.
#/
#/ OPTION(S):
#/	-m=<logMsg>, --msg=<logMsg>
#/		Message user would like log produced of.
#/			- Note: At least one of these is required. If multiple are given,
#/				each will show up on a new line.
#/		(REQUIRED)
#/	--line-title
#/		When given, resulting log text will include a prefix and postfix.
#/			- Note: If no title option is given, then no prefix, postfis,
#/				header, or footer will be included in the resulting log text.
#/		(OPTIONAL)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful
#/			- No arguments are provided.
#/
#/ EXAMPLE(S):
#/	log -c=${FUNCNAME[0]} -m="line1\nline2" -m="line3"
EOF
)

Describe "Util:" util
	Describe "verifyInputProvided():" util:verifyInputProvided
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/verifyInputProvided.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required argument:" utilVerifyInputProvided:requiredArgument
			Describe "Calling doc:" utilVerifyInputProvidedRequiredArgument:callingDoc
				Describe "Single line:" utilVerifyInputProvidedRequiredArgumentCallingDoc:singleLine
					Describe "Alphanumeric" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLine:alphanumeric
						It "Upper case letter" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineAlphanumeric:upperCaseLetter
							When run verifyInputProvided "A" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "A"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Lower case letter" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineAlphanumeric:lowerCaseLetter
							When run verifyInputProvided "z" --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "z"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Single digit number" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineAlphanumeric:singleDigitNumber
							When run verifyInputProvided "5" -a= --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "5"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Sentence" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineAlphanumeric:sentence
							When run verifyInputProvided "bla4BLA" --arg= -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "bla4BLA"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "Symbols:" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLine:symbols
						It "'\`'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:backtick
							When run verifyInputProvided "\`" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "\`"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'~'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:tilde
							When run verifyInputProvided "~" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "~"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'!'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:exclamationMark
							When run verifyInputProvided "!" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "!"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'@'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:at
							When run verifyInputProvided "@" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "@"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'#'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:hashtag
							When run verifyInputProvided "#" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "#"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'$'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:dollar
							When run verifyInputProvided "$" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "$"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'%'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:percentSign
							When run verifyInputProvided "%" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "%"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'^'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:caret
							When run verifyInputProvided "^" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "^"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'&'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:ampersand
							When run verifyInputProvided "&" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "&"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'*'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:asterisk
							When run verifyInputProvided "*" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "*"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'('" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:openParentheses
							When run verifyInputProvided "(" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "("
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "')'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:closeParentheses
							When run verifyInputProvided ")" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include ")"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'-'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:hyphen
							When run verifyInputProvided "-" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "-"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'_'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:underscore
							When run verifyInputProvided "_" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "_"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'='" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:equal
							When run verifyInputProvided "=" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "="
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'+'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:plus
							When run verifyInputProvided "+" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "+"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'['" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:openSquareBracket
							When run verifyInputProvided "[" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "["
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'{'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:openCurlyBracket
							When run verifyInputProvided "{" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "{"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "']'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:closeSquareBracket
							When run verifyInputProvided "]" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "]"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'}'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:closeCurlyBracket
							When run verifyInputProvided "}" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "}"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\\'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:backslash
							When run verifyInputProvided "\\" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "\\"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'|'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:verticalBar
							When run verifyInputProvided "|" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "|"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "';'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:semicolon
							When run verifyInputProvided ";" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include ";"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "':'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:colon
							When run verifyInputProvided ":" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include ":"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'''" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:apostrophe
							When run verifyInputProvided "'" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "'"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It '"' utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:quotationMark
							When run verifyInputProvided '"' -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include '"'
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "','" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:comma
							When run verifyInputProvided "," -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include ","
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'<'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:lessThanSign
							When run verifyInputProvided "<" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "<"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'.'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:period
							When run verifyInputProvided "." -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "."
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'>'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:greaterThanSign
							When run verifyInputProvided ">" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include ">"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'/'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:forwardSlash
							When run verifyInputProvided "/" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "/"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'?'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSymbols:questionMark
							When run verifyInputProvided "?" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "?"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "Special character:" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLine:specialCharacter
						It "'\t'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:tab
							When run verifyInputProvided "\t" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should satisfy containsTab
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\v'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:verticalTab
							When run verifyInputProvided "\v" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should satisfy containsVerticalTab
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\f'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:formFeed
							When run verifyInputProvided "\f" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should satisfy containsFormFeed
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\r'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:carriageReturn
							When run verifyInputProvided "\r" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should satisfy containsCarriageReturn
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'EOF'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:eof
							When run verifyInputProvided "EOF" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should include "EOF"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\e'" utilVerifyInputProvidedRequiredArgumentCallingDocSingleLineSpecialCharacter:escapeSequence
							When run verifyInputProvided "\e" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR verifyInputProvided(): "
							The stderr line 2 should satisfy containsEscapeSequence
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
				Describe "Multiple lines:" utilVerifyInputProvidedRequiredArgumentCallingDoc:multipleLines
					It "Real doc" utilVerifyInputProvidedRequiredArgumentCallingDocMultipleLines:realDoc
						When run verifyInputProvided "$LOG_DOC" -a=
						The stdout should not be present
						The stderr line 1 should start with "ERROR verifyInputProvided(): "
						The stderr should include "$LOG_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
						Skip "TODO: Figure out why shellspec only returns first line of doc."
					End
				End
			End
		End
	End
End

