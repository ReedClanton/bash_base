# Setup required environment variable(s).
% NO_TITLE:0
readonly NO_TITLE
% FULL_TITLE:1
readonly FULL_TITLE
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
			Describe "--full-title and info:" logLogUtilOptionMix:fullTitleAndInfo
				output() {
					# Track that required option(s) are provided.
					lvlGiven=false
					titleGiven=false
					headerGiven=false
					preGiven=false
					# Processed provided option(s).
					for fullArg in "$@"; do
						case $fullArg in
							--info | -i)
								lvlGiven=true
								;;
							-p | --pretty)
								titleGiven=true
								;;
							--header-footer)
								headerGiven=true
								;;
							--pp | --pre-post-fix)
								preGiven=true
								;;
							*) ;;
						esac
					done
					# Ensure required option(s) were provided.
					if $lvlGiven && ($titleGiven || ($headerGiven && $preGiven)); then
						echo " ###"
						echo "# m #"
						echo " ###"
						return 0
					fi
					# Required option(s) not provided.
					return 3
				}
				
				It "--info" logLogUtilOptionMixFullTitleAndInfo:info
					When run log -m=m --full-title --info
					The stderr should not be present
					The lines of stdout should equal 4
					The stdout line 1 should equal "INFO :	"
					The stdout line 2 should equal " ###"
					The stdout line 3 should equal "# m #"
					The stdout line 4 should equal " ###"
					The status should be success
				End
				It "-i" logLogUtilOptionMixFullTitleAndInfo:i
					When run log -m=m --full-title -i
					The stderr should not be present
					The lines of stdout should equal 4
					The stdout line 1 should equal "INFO :	"
					The stdout line 2 should equal " ###"
					The stdout line 3 should equal "# m #"
					The stdout line 4 should equal " ###"
					The status should be success
				End
			End
		End
	End
End

