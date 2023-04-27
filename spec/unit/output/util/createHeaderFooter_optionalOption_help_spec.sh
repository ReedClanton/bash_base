# Setup required environment variable(s).
% CREATE_HEADER_FOOTER_DOC:"#/ DESCRIPTION:"

Describe "Output:" output
	Describe "Util:" output:util
		Describe "createHeaderFooter():" outputUtil:createHeaderFooter
			# Source CUT function file so function may be called directly.
			sourceCut() { . $PWD/src/shell/functions/output/util/createHeaderFooter.sh; }
			BeforeAll 'sourceCut'
			
			Describe "Optional option:" outputUtilCreateHeaderFooter:optionalOption
				Describe "Help:" outputUtilCreateHeaderFooterOptionalOption:help
					It "-h" outputUtilCreateHeaderFooterOptionalOptionHelp:h
						When run createHeaderFooter -h
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "$CREATE_HEADER_FOOTER_DOC"
						The status should be success
					End
					It "--help" outputUtilCreateHeaderFooterOptionalOptionHelp:help
						When run createHeaderFooter --help
						The stderr should not be present
						The lines of stdout should equal 1
						The stdout line 1 should equal "$CREATE_HEADER_FOOTER_DOC"
						The status should be success
					End
				End
			End
		End
	End
End

