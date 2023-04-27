# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% LINE_TITLE:2
readonly LINE_TITLE
% INFO:3
readonly INFO
% TRACE:5
readonly TRACE
% SHELL_LOG_LEVEL:$INFO

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
			Describe "--line-title and info:" logLogUtilOptionMix:lineTitleAndInfo
				output() {
					# Track that required option(s) are provided.
					lvlGiven=false
					titleGiven=false
					# Processed provided option(s).
					for fullArg in "$@"; do
						case $fullArg in
							--info | -i)
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
				
				It "--info" logLogUtilOptionMixLineTitleAndInfo:info
					When run log -m=m --line-title --info
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO :	# m #"
					The status should be success
				End
				It "-i" logLogUtilOptionMixLineTitleAndInfo:i
					When run log -m=m --line-title -i
					The stderr should not be present
					The lines of stdout should equal 1
					The stdout line 1 should equal "INFO :	# m #"
					The status should be success
				End
			End
		End
	End
End

