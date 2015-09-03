#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  mOptions = SetOptions(args)
		  mOptions.Parse args
		  
		  If mOptions.HelpRequested Then
		    PrintHelp
		    Return 0
		  End If
		  
		  // Initialize Groups
		  Print "Initializing Test Groups..."
		  mController = New ConsoleTestController
		  mController.LoadTestGroups
		  
		  // Run Tests
		  Print "Running Tests..."
		  mController.Start
		  
		  // Output Results
		  Print "Saving Results..."
		  
		  Dim outputFile As FolderItem
		  outputFile = OutputResults
		  
		  Dim testCount As Integer
		  testCount = mController.RunTestCount
		  
		  Dim now As New Date
		  
		  Print "Start: " + now.ShortDate + " " + now.ShortTime
		  Print "Duration: " + Format(mController.Duration, "#,###.0000000") + "s"
		  Print "Total: " + Str(testCount) + " tests in " + Str(mController.GroupCount) + " groups were run."
		  Print "Passed: " + Str(mController.PassedCount) + " (" + Format((mController.PassedCount / testCount) * 100, "##.00") + "%)"
		  Print "Failed: " + Str(mController.FailedCount) + " (" + Format((mController.FailedCount / testCount) * 100, "##.00") + "%)"
		  Print "Skipped: " + Str(mController.SkippedCount)
		  Print "Results file: " + outputFile.NativePath
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function OutputResults() As FolderItem
		  Const kIndent = "   "
		  
		  Dim outputFile As FolderItem
		  If mOptions.Extra.Ubound = -1 Then
		    outputFile = GetFolderItem(kDefaultExportFileName)
		  Else
		    outputFile = GetFolderItem(mOptions.Extra(0), FolderItem.PathTypeNative)
		    If outputFile.Directory Then
		      outputFile = outputFile.Child(kDefaultExportFileName)
		    End If
		  End If
		  
		  Dim output As TextOutputStream
		  
		  output = TextOutputStream.Create(outputFile)
		  
		  Dim testCount As Integer
		  testCount = mController.RunTestCount
		  
		  Dim now As New Date
		  
		  output.WriteLine("Start: " + now.ShortDate + " " + now.ShortTime)
		  output.WriteLine("Duration: " + Format(mController.Duration, "#,###.0000000") + "s")
		  output.WriteLine("Total: " + Str(testCount) + " tests in " + Str(mController.GroupCount) + " groups were run.")
		  output.WriteLine("Passed: " + Str(mController.PassedCount) + " (" + Format((mController.PassedCount / testCount) * 100, "##.00") + "%)")
		  output.WriteLine("Failed: " + Str(mController.FailedCount) + " (" + Format((mController.FailedCount / testCount) * 100, "##.00") + "%)")
		  output.WriteLine("Skipped: " + Str(mController.SkippedCount))
		  output.WriteLine("")
		  
		  For Each tg As TestGroup In mController.TestGroups
		    output.WriteLine(tg.Name)
		    
		    For Each tr As TestResult In tg.Results
		      output.WriteLine(kIndent + tr.TestName + ": " + tr.Result + " (" + Format(tr.Duration, "#,###.0000000") + "s)")
		      If tr.Message <> "" Then
		        output.WriteLine(kIndent + kIndent + tr.Message)
		      End If
		    Next
		  Next
		  
		  output.Close
		  
		  Return outputFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrintHelp()
		  Print ""
		  Print "Usage: " + mOptions.AppName + " [params] [/path/to/export/file]"
		  Print ""
		  mOptions.ShowHelp
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetOptions(args() As String) As OptionParser
		  Dim parser As New OptionParser
		  
		  Dim o As Option
		  
		  o = New Option("i", kOptionInclude, "Include a group[.method] (* is wildcard)", Option.OptionType.String)
		  o.IsArray = True
		  parser.AddOption o
		  
		  o = New Option("x", kOptionExclude, "Exclude a group[.method] (* is wildcard)", Option.OptionType.String)
		  o.IsArray = True
		  parser.AddOption o
		  
		  parser.AdditionalHelpNotes = "If an export path is not specified, a default file named `" + kDefaultExportFileName + _
		  "' will be created next to the app. If the path is a directory, a file of that name will be created within it."
		  
		  Return parser
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mController As TestController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOptions As OptionParser
	#tag EndProperty


	#tag Constant, Name = kDefaultExportFileName, Type = String, Dynamic = False, Default = \"XojoUnitResults.txt", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kOptionExclude, Type = String, Dynamic = False, Default = \"exclude", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kOptionInclude, Type = String, Dynamic = False, Default = \"include", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
