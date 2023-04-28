# TODO: Comment.
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
#/			- Note: Shouldn't be combined with any other title option.
#/			- Note: If no title option is given, then no prefix, postfis,
#/				header, or footer will be included in the resulting log text.
#/		(OPTIONAL)
#/	-t, --trace
#/		When given, the default *trace* formatting character will be used by
#/		prefix, postfix, header, and footer (if used). Providing this option
#/		will also cause a log message with the given text to be printed to
#/		stdout *if* the shell log level ($SHELL_LOG_LEVEL) is equal to, or
#/		higher than, *trace*. This includes: trace,debug, info, warn, and error.
#/			- Note: Shouldn't be combined with any other log level option.
#/			- Note: If multiple loge level options are given in a single call,
#/				the last one given will be used.
#/			- Note: When no log level option is provided, *trace* level is used.
#/		(DEFAULT)
#/
#/ RETURN CODE(S):
#/	- 0: Returned when:
#/		- Help message is requested and produced.
#/		- Processing is successful
#/			- No arguments are provided.
#/	- 3: Returned when something went wrong (like what's listed bellow) but a log will still be produced:
#/		- Call to output() returned a non-zero return code:
#/			- Log will still be produced, but output() formatting won't be used.
#/	- 140: Returned when given option name is invalid.
#/	- 142: Returned when a required option is not provided.
#/
#/ EXAMPLE(S):
#/	log --help
#/	log -c=${FUNCNAME[0]} -m="line1\nline2" -m="line3"
#/	log -d -c="$USER-terminal" -m="line1" -m="line2"
#/	log --error --line-title -m="line1" -m="line2"
EOF
)

Describe "Util:" util
	Describe "checkRequiredOpts():" util:checkRequiredOpts
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/util/checkRequiredOpts.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required argument:" utilCheckRequiredOpts:requiredArgument
			Describe "Calling doc:" utilCheckRequiredOptsRequiredArgument:callingDoc
				Describe "Single line:" utilCheckRequiredOptsRequiredArgumentCallingDoc:singleLine
					Describe "Alphanumeric" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLine:alphanumeric
						It "Upper case letter" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineAlphanumeric:upperCaseLetter
							When run checkRequiredOpts "A" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "A"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Lower case letter" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineAlphanumeric:lowerCaseLetter
							When run checkRequiredOpts "z" --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "z"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Single digit number" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineAlphanumeric:singleDigitNumber
							When run checkRequiredOpts "5" -a= --arg=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "5"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "Sentence" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineAlphanumeric:sentence
							When run checkRequiredOpts "bla4BLA" --arg= -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "bla4BLA"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "Symbols:" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLine:symbols
						It "'\`'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:backtick
							When run checkRequiredOpts "\`" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "\`"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'~'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:tilde
							When run checkRequiredOpts "~" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "~"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'!'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:exclamationMark
							When run checkRequiredOpts "!" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "!"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'@'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:at
							When run checkRequiredOpts "@" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "@"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'#'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:hashtag
							When run checkRequiredOpts "#" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "#"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'$'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:dollar
							When run checkRequiredOpts "$" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'%'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:percentSign
							When run checkRequiredOpts "%" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "%"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'^'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:caret
							When run checkRequiredOpts "^" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "^"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'&'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:ampersand
							When run checkRequiredOpts "&" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "&"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'*'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:asterisk
							When run checkRequiredOpts "*" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "*"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'('" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:openParentheses
							When run checkRequiredOpts "(" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "("
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "')'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:closeParentheses
							When run checkRequiredOpts ")" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include ")"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'-'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:hyphen
							When run checkRequiredOpts "-" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "-"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'_'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:underscore
							When run checkRequiredOpts "_" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "_"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'='" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:equal
							When run checkRequiredOpts "=" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "="
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'+'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:plus
							When run checkRequiredOpts "+" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "+"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'['" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:openSquareBracket
							When run checkRequiredOpts "[" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "["
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'{'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:openCurlyBracket
							When run checkRequiredOpts "{" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "{"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "']'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:closeSquareBracket
							When run checkRequiredOpts "]" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "]"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'}'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:closeCurlyBracket
							When run checkRequiredOpts "}" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "}"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\\'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:backslash
							When run checkRequiredOpts "\\" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "\\"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'|'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:verticalBar
							When run checkRequiredOpts "|" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "|"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "';'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:semicolon
							When run checkRequiredOpts ";" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include ";"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "':'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:colon
							When run checkRequiredOpts ":" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include ":"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'''" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:apostrophe
							When run checkRequiredOpts "'" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "'"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It '"' utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:quotationMark
							When run checkRequiredOpts '"' -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include '"'
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "','" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:comma
							When run checkRequiredOpts "," -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include ","
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'<'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:lessThanSign
							When run checkRequiredOpts "<" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "<"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'.'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:period
							When run checkRequiredOpts "." -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "."
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'>'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:greaterThanSign
							When run checkRequiredOpts ">" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include ">"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'/'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:forwardSlash
							When run checkRequiredOpts "/" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "/"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'?'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSymbols:questionMark
							When run checkRequiredOpts "?" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "?"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
					Describe "Special character:" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLine:specialCharacter
						It "'\t'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:tab
							When run checkRequiredOpts "\t" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should satisfy containsTab
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\v'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:verticalTab
							When run checkRequiredOpts "\v" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "$(echo '\v')"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\v'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:verticalTab
							When run checkRequiredOpts "\v" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should satisfy containsVerticalTab
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\f'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:formFeed
							When run checkRequiredOpts "\f" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should satisfy containsFormFeed
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\r'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:carriageReturn
							When run checkRequiredOpts "\r" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should satisfy containsCarriageReturn
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'EOF'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:eof
							When run checkRequiredOpts "EOF" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should include "EOF"
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
						It "'\e'" utilCheckRequiredOptsRequiredArgumentCallingDocSingleLineSpecialCharacter:escapeSequence
							When run checkRequiredOpts "\e" -a=
							The stdout should not be present
							The stderr line 1 should start with "ERROR checkRequiredOpts(): "
							The stderr line 2 should satisfy containsEscapeSequence
							The status should equal $MINOR_EXECUTION_FAILURE_RT
						End
					End
				End
				Describe "Multiple lines:" utilCheckRequiredOptsRequiredArgumentCallingDoc:multipleLines
					It "Real doc" utilCheckRequiredOptsRequiredArgumentCallingDocMultipleLines:realDoc
						When run checkRequiredOpts "$LOG_DOC" -a=
						The stdout should not be present
						The stderr line 1 should start with "ERROR checkRequiredOpts(): "
						The stderr should include "$LOG_DOC"
						The status should equal $MINOR_EXECUTION_FAILURE_RT
						Skip "TODO: Figure out why shellspec only returns first line of doc."
					End
				End
			End
		End
	End
End

