# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% FULL_TITLE:1
readonly FULL_TITLE
% LINE_TITLE:2
readonly LINE_TITLE
% ERROR:1
readonly ERROR
% WARN:2
readonly WARN
% INFO:3
readonly INFO
% DEBUG:4
readonly DEBUG
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$WARN

Describe "Log:" log
	Describe "log():" log:log
		# Track path to file that contains CUT.
		cutPath=$PWD/src/shell/functions/log/log.sh
		# Source CUT function file so function may be called directly.
		sourceCut() { . $cutPath; }
		BeforeAll 'sourceCut'
		# Mock out.
		checkRequiredOpts() { :; }
		
		Describe "Option mix:" logLog:optionMix
			Describe "--line-title and warn:" logLogUtilOptionMix:lineTitleAndWarn
				output() {
					# Track that required option(s) are provided.
					lvlGiven=false
					titleGiven=false
					# Processed provided option(s).
					for fullArg in "$@"; do
						case $fullArg in
							--warn | -w)
								lvlGiven=true
								;;
							--pp | --pre-post-fix)
								titleGiven=true
								;;
							*) ;;
						esac
					done
					# Ensure required option(s) were provided.
					if $lvlGiven && $titleGiven; then
						echo "# m #"
						return 0
					fi
					# Required option(s) not provided.
					return 3
				}
				
				It "--warn" logLogUtilOptionMixLineTitleAndWarn:warn
					When run log -m=m --line-title --warn
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN :	# m #"
					The status should be success
				End
				It "-w" logLogUtilOptionMixLineTitleAndWarn:w
					When run log -m=m --line-title -w
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "WARN :	# m #"
					The status should be success
				End
			End
		End
	End
End

