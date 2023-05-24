Describe "ShellName:" shellName
	Describe "Util:" shellName:util
		Describe "Constants:" shellNameUtil:constants
			# Makes test easier to read and maintain.
			constants=$PWD/src/shell/functions/shellName/util/constants.sh
			
			Describe "Shell compatibility:" shellNameUtilConstants:shellCompatibility
				It "Source file" shellNameUtilConstantsShellCompatibility:sourceFile
					When run source $constants
					The stderr should not be present
					The stdout should not be present
					The status should be success
				End
			End
			Describe "Environment variable:" shellNameUtilConstants:environmentVariable
				Describe "RECOGNIZED_SHELL_NAMES:" shellNameUtilConstantsEnvironmentVariable:recognizedShellNames
					Describe
						# Environment setup that works for most tests and shells.
						sourceCut() { . $constants; }
						BeforeAll 'sourceCut'
						
						It "Set" shellNameUtilConstantsEnvironmentVariableRecognizedShellNames:set
							The value "$RECOGNIZED_SHELL_NAMES" should be present
						End
					End
					Describe
						# No idea why, but some shells require `Include` for this test to pass (like zsh)...
						Include $constants
						
						It "Readonly" shellNameUtilConstantsEnvironmentVariableRecognizedShellNames:readonly
							The variable RECOGNIZED_SHELL_NAMES should be readonly
						End
						It "Not exported" shellNameUtilConstantsEnvironmentVariableRecognizedShellNames:notExported
							The variable RECOGNIZED_SHELL_NAMES should not be exported
						End
					End
				End
			End
		End
	End
End

