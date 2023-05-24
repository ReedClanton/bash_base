# Setup required environment variable(s).
#% DEFAULT_LINE_LENGTH:60
#readonly DEFAULT_LINE_LENGTH
#% DEFAULT_INDENT:0
#readonly DEFAULT_INDENT

Describe "ShellName:" shellName
	Describe "shellName():" shellName:shellName
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/shellName/shellName.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		
		Describe "Required option:" shellNameShellName:requiredOption
			Describe "None:" shellNameShellNameRequiredOption:none
				Todo "Check current shell and ensure returned value matchs it."
			End
		End
	End
End

