#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
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
		  outputFile = GetFolderItem("XojoUnitResults.txt")
		  
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


	#tag Property, Flags = &h21
		Private mController As TestController
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
