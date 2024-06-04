#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  mOptions = SetOptions
		  mOptions.Parse args
		  
		  If mOptions.HelpRequested Then
		    PrintHelp
		    Return 0
		  End If
		  
		  // Initialize Groups
		  Print "Initializing Test Groups..."
		  mController = New ConsoleTestController
		  mController.LoadTestGroups
		  
		  // Filter Tests
		  FilterTests
		  
		  // Run Tests
		  Print "Running Tests..."
		  mController.Start
		  While mController.IsRunning
		    App.DoEvents
		  Wend
		  
		  // Output Results
		  Print "Saving Results..."
		  
		  Var outputFile As FolderItem
		  outputFile = OutputResults
		  
		  PrintSummary(StdOut, mController)
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub FilterTests()
		  // Filter the tests based on the Include and Exclude options
		  
		  Var includeOption As Option = mOptions.OptionValue(kOptionInclude)
		  Var excludeOption As Option = mOptions.OptionValue(kOptionExclude)
		  
		  If includeOption.WasSet Or excludeOption.WasSet Then
		    Print "Filtering Tests..."
		  Else
		    Return
		  End If
		  
		  Var includes() As String
		  If Not includeOption.Value.IsNull Then
		    Var v() As Variant = includeOption.Value
		    For Each pattern As String In v
		      includes.Add pattern
		    Next
		  End If
		  
		  Var excludes() As String
		  If not excludeOption.Value.IsNull Then
		    Var v() As Variant = excludeOption.Value
		    For Each pattern As String In v
		      excludes.Add pattern
		    Next
		  End If
		  
		  mController.FilterTests(includes, excludes)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OutputResults() As FolderItem
		  Const kIndent = "   "
		  Const kFailIndent = " * "
		  
		  Var outputFile As FolderItem
		  If mOptions.Extra.LastIndex = -1 Then
		    outputFile = new FolderItem(kDefaultExportFileName, FolderItem.PathModes.Native)
		  Else
		    outputFile = New FolderItem(mOptions.Extra(0), FolderItem.PathModes.Native)
		    If outputFile.IsFolder Then
		      outputFile = outputFile.Child(kDefaultExportFileName)
		    End If
		  End If
		  
		  Var output As TextOutputStream = TextOutputStream.Create(outputFile)
		  
		  PrintSummary(output, mController)
		  
		  #If DebugBuild
		    Var debugOutput As String
		  #Endif
		  
		  For Each tg As TestGroup In mController.TestGroups
		    output.WriteLine("")
		    output.WriteLine(tg.Name)
		    #If DebugBuild
		      debugOutput = debugOutput + EndOfLine + tg.Name + EndOfLine
		    #Endif
		    
		    For Each tr As TestResult In tg.Results
		      Var useIndent As String = If(tr.Result = tr.Failed, kFailIndent, kIndent)
		      Var outLine As String = useIndent + tr.TestName + ": " + tr.Result + " (" + tr.Duration.ToString("#,##0.0000000") + "s)"
		      output.WriteLine(outLine)
		      #If DebugBuild
		        debugOutput = debugOutput + outLine + EndOfLine
		      #Endif
		      
		      Var msg As String = tr.Message
		      If msg <> "" Then
		        msg = msg.ReplaceLineEndings(EndOfLine)
		        Var msgs() As String = msg.Split(EndOfLine)
		        
		        For i As Integer = 0 To msgs.LastIndex
		          msg = msgs(i)
		          outLine  = kIndent + kIndent + msg
		          output.WriteLine(outLine)
		          #If DebugBuild
		            debugOutput = debugOutput + outLine + EndOfLine
		          #Endif
		        Next i
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
		Private Sub PrintSummary(output As Writeable, controller As TestController)
		  Var now As DateTime = DateTime.Now
		  
		  Var allTestCount As Integer = controller.AllTestCount
		  Var runTestCount As Integer = controller.RunTestCount
		  Var passedPercent As Double = controller.PassedCount / runTestCount
		  Var failedPercent As Double = controller.FailedCount / runTestCount
		  
		  WriteLine(output, "Start: " + now.ToString(DateTime.FormatStyles.Short, DateTime.FormatStyles.Short))
		  WriteLine(output, "Duration: " + controller.Duration.ToString("#,##0.0000000") + "s")
		  WriteLine(output, "Groups: " + controller.RunGroupCount.ToString("#,##0"))
		  WriteLine(output, "Total: " + Str(runTestCount) + If(allTestCount <> runTestCount, " of " + allTestCount.ToString, "") + " tests were run")
		  WriteLine(output, "Passed: " + controller.PassedCount.ToString + _
		  If(runTestCount = 0, "", " (" + passedPercent.ToString("#,##0.00%") + ")"))
		  WriteLine(output, "Failed: " + controller.FailedCount.ToString + _
		  If(runTestCount = 0, "", " (" + failedPercent.ToString("#,##0.00%") + ")"))
		  WriteLine(output, "Skipped: " + controller.SkippedCount.ToString)
		  WriteLine(output, "Not Implemented: " + controller.NotImplementedCount.ToString)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SetOptions() As OptionParser
		  Var parser As New OptionParser
		  
		  Var o As Option
		  
		  o = New Option("i", kOptionInclude, "Include a Group[.Method] (* is wildcard)", Option.OptionType.String)
		  o.IsArray = True
		  parser.AddOption o
		  
		  o = New Option("x", kOptionExclude, "Exclude a Group[.Method] (* is wildcard)", Option.OptionType.String)
		  o.IsArray = True
		  parser.AddOption o
		  
		  parser.AdditionalHelpNotes = "If an export path is not specified, a default file named `" + kDefaultExportFileName + _
		  "' will be created next to the app. If the path is a directory, a file of that name will be created within it."
		  
		  Return parser
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteLine(output As Writeable, s As String)
		  output.Write s
		  output.Write EndOfLine
		End Sub
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
