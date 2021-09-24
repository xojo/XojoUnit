#tag Class
Protected Class TestController
	#tag Method, Flags = &h0
		Sub AddGroup(group As TestGroup)
		  mTestGroups.Add(group)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CalculateDuration()
		  mFinishMS = System.Microseconds
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub ExportTestResults(filePath As String)
		  //
		  // Conforms to JUnit XML schema, found here:
		  //
		  // http://www.ibm.com/support/knowledgecenter/SSQ2R2_9.5.1/com.ibm.rsar.analysis.codereview.cobol.doc/topics/cac_useresults_junit.html
		  //
		  
		  #If TargetWindows Then
		    Const kEOL As String = &u0D + &u0A
		  #Else
		    Const kEOL As String = &u0A
		  #Endif
		  
		  Var now As DateTime = DateTime.Now
		  Var testId As String = now.SQLDateTime + "." + now.Nanosecond.ToString
		  
		  Var f As New FolderItem(filePath, FolderItem.PathModes.Shell)
		  If f IsA Object Then
		    Var stream As BinaryStream = BinaryStream.Create(f, True)
		    stream.Write "<?xml version=""1.0"" encoding=""UTF-8"" ?>" + kEOL
		    stream.Write "<testsuites id=""" + testId + _
		    """ tests=""" + RunTestCount.ToString + _
		    """ failures=""" + FailedCount.ToString + _
		    """ time=""" + Duration.ToString + """>" + kEOL
		    
		    For Each tg As TestGroup In mTestGroups
		      stream.Write "  <testsuite errors=""0"" skipped=""" + tg.SkippedTestCount.ToString + _
		      """ tests=""" + tg.TestCount.ToString + _
		      """ time=""" + tg.Duration.ToString + _
		      """ failures=""" + tg.FailedTestCount.ToString + _
		      """ name=""com.atlassian.bamboo.labels." + tg.Name + """>" + kEOL
		      
		      For Each tr As TestResult In tg.Results
		        stream.Write "    <testcase name=""" + tr.TestName + """ time=""" + tr.Duration.ToString + _
		        """ duration= """ + tr.Duration.ToString + """>" + kEOL // "time" is right, but "duration" is maintained for backwards compatibility
		        
		        If tr.Result = TestResult.Skipped Then
		          stream.Write "       <skipped />" + EndOfLine
		          
		        ElseIf tr.Result = TestResult.NotImplemented Then
		          stream.Write "       <not_implemented />" + EndOfLine
		          
		        ElseIf tr.Result = TestResult.Failed Then
		          Var failMessage As String = tr.Message
		          failMessage = failMessage.ReplaceAll("<", "&lt;")
		          failMessage = failMessage.ReplaceAll(">", "&gt;")
		          stream.Write "       <failure type=""xojo.AssertionFailedError"" message=""" + failMessage + """/>" + kEOL
		        End If
		        
		        stream.Write "    </testcase>" + kEOL
		      Next
		      
		      stream.Write "  </testsuite>" + kEOL
		    Next
		    
		    stream.Write "</testsuites>" + kEOL
		    stream.Close
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub FilterTests(includePatterns() As String, excludePatterns() As String)
		  // Filter the tests based on the include and exclude patterns
		  // These are simple patterns with * used as a wildcard
		  // A dot will indicate Group.Method
		  //
		  // Examples:
		  //  "My Test Group" = Match the group named "My Test Group"
		  //  "My T*" = Match any group that starts with "My T"
		  //  "*Group" = Match any group that ends with "Group"
		  //  "My Test Group.SomeTest" = Match the method in "My Test Group" named "SomeTest"
		  //  "*.SomeTest" = Match the method named "SomeTest" in any group
		  //  "*.Some" = Match the method named "SomeTest" in any group ("Test" is optional)
		  //  "My*Group" = Match any group that starts with "My" and ends with "Group"
		  
		  //
		  // Replace Nil with an empty array
		  //
		  If True Then // Scope
		    Var emptyArr() As String
		    
		    If includePatterns Is Nil Then
		      includePatterns = emptyArr
		    End If
		    If excludePatterns Is Nil Then
		      excludePatterns = emptyArr
		    End If
		  End If
		  
		  If includePatterns.LastIndex = -1 And excludePatterns.LastIndex = -1 Then
		    Var err As New RuntimeException
		    err.Message = "You must specify at least one include or exclude pattern"
		    Raise err
		  End If
		  
		  //
		  // Convert the patterns into regular expressions
		  //
		  For i As Integer = 0 To includePatterns.LastIndex
		    includePatterns(i) = SimplePatternToRegExPattern(includePatterns(i))
		  Next i
		  
		  For i As Integer = 0 To excludePatterns.LastIndex
		    excludePatterns(i) = SimplePatternToRegExPattern(excludePatterns(i))
		  Next i
		  
		  //
		  // Set up the RegEx
		  //
		  Var rx As New RegEx
		  
		  //
		  // Process includes
		  //
		  For Each group As TestGroup In TestGroups
		    //
		    // Turn all methods on and the group on/off
		    //
		    group.IncludeGroup = (includePatterns.LastIndex = -1) // If there are any includes, default to False
		    group.SetIncludeMethods(True)
		    Var methodsTurnedOff As Boolean
		    
		    For Each pattern As String In includePatterns
		      rx.SearchPattern = pattern
		      Var hasDot As Boolean = PatternHasDot(pattern)
		      
		      //
		      // See if this pattern matches any methods
		      //
		      If hasDot Then
		        For Each result As TestResult In group.Results
		          Var methodName As String = group.Name + "." + result.MethodInfo.Name
		          If rx.Search(methodName) IsA RegExMatch Then
		            group.IncludeGroup = True
		            
		            If Not methodsTurnedOff Then
		              group.SetIncludeMethods(False)
		              methodsTurnedOff = True
		            End If
		            
		            result.IncludeMethod = True
		          End If
		        Next result
		      End If
		      
		      If rx.Search(group.Name) IsA RegExMatch Then
		        group.IncludeGroup = True
		      End If
		    Next pattern
		  Next group
		  
		  //
		  // Process excludes
		  //
		  For Each group As TestGroup In TestGroups
		    //
		    // See if it's already excluded
		    //
		    If Not group.IncludeGroup Then
		      Continue For group
		    End If
		    
		    For Each pattern As String In excludePatterns
		      rx.SearchPattern = pattern
		      Var hasDot As Boolean = PatternHasDot(pattern)
		      
		      //
		      // See if this pattern matches any methods
		      //
		      If hasDot Then
		        For Each result As TestResult In group.Results
		          //
		          // See if it's already excluded
		          //
		          If Not result.IncludeMethod Then
		            Continue For result
		          End If
		          
		          Var methodName As String = group.Name + "." + result.MethodInfo.Name
		          If rx.Search(methodName) IsA RegExMatch Then
		            result.IncludeMethod = False
		          End If
		        Next result
		      End If
		      
		      If rx.Search(group.Name) IsA RegExMatch Then
		        group.IncludeGroup = False
		      End If
		    Next pattern
		  Next group
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Finish()
		  CalculateDuration
		  
		  Call RunTestCount // Updates all the counts
		  RaiseEvent AllTestsFinished
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTestGroups()
		  InitializeTestGroups
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Private Function PatternHasDot(pattern As String) As Boolean
		  Return pattern.Left(kHasDotComment.Length) = kHasDotComment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseGroupFinished(group As TestGroup)
		  RaiseEvent GroupFinished(group)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseTestFinished(result As TestResult, group As TestGroup)
		  RaiseEvent TestFinished(result, group)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetDuration()
		  mStartMS = System.Microseconds
		  mFinishMS = 0.0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Hidden )  Sub RunNextTest()
		  If TestQueue.LastIndex = -1 Then
		    Stop
		  Else
		    Var tg As TestGroup = TestQueue(0)
		    TestQueue.RemoveAt(0)
		    tg.Start
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTestGroups()
		  ResetDuration
		  
		  For Each tg As TestGroup In mTestGroups
		    If tg.IncludeGroup Then
		      TestQueue.Add tg
		      tg.ClearResults
		    Else
		      tg.ClearResults(True)
		    End If
		  Next
		  
		  RunNextTest
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Private Function SimplePatternToRegExPattern(pattern As String) As String
		  Const kPlaceholder As String = &u01
		  
		  Var hasDot As Boolean = pattern.IndexOf(".") <> -1
		  
		  pattern = pattern.ReplaceAll("*", kPlaceholder)
		  pattern = "^\Q" + pattern.ReplaceAllBytes("\E", "\E\\E\Q") + "\E"
		  pattern = pattern.ReplaceAll(kPlaceholder, "\E.*\Q")
		  
		  //
		  // If it may match a method (includs a dot), add the optional TestSuffix
		  //
		  If hasDot Then
		    pattern = kHasDotComment + pattern + "(?:" + TestGroup.kTestSuffix + ")?"
		  End If
		  
		  pattern = pattern + "$"
		  
		  Return pattern
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  RunTestGroups
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  For Each tg As TestGroup In mTestGroups
		    tg.Stop
		  Next
		  
		  TestQueue.RemoveAll
		  Finish
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestGroups() As TestGroup()
		  Return mTestGroups
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AllTestsFinished()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GroupFinished(group As TestGroup)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event InitializeTestGroups()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TestFinished(result As TestResult, group As TestGroup)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    If tg.IncludeGroup Then
			      totalCount = totalCount + tg.TestCount
			    End If
			  Next
			  
			  Return totalCount
			End Get
		#tag EndGetter
		AllTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var duration As Double
			  If mFinishMS = 0.0 Then
			    duration = System.Microseconds - mStartMS
			  Else
			    duration = mFinishMS - mStartMS
			  End If
			  
			  Return duration / 1000000.0
			End Get
		#tag EndGetter
		Duration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFailedCount
			End Get
		#tag EndGetter
		FailedCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTestGroups.LastIndex + 1
			End Get
		#tag EndGetter
		GroupCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  For Each group As TestGroup In mTestGroups
			    If group.IsRunning Then
			      Return True
			    End If
			  Next
			  
			  Return False
			  
			End Get
		#tag EndGetter
		IsRunning As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mFailedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFinishMS As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNotImplementedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSkippedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartMS As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTestGroups() As TestGroup
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mNotImplementedCount
			End Get
		#tag EndGetter
		NotImplementedCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPassedCount
			End Get
		#tag EndGetter
		PassedCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var cnt As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    If tg.IncludeGroup Then cnt = cnt + 1
			  Next
			  
			  Return cnt
			End Get
		#tag EndGetter
		RunGroupCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  mPassedCount = 0
			  mFailedCount = 0
			  mSkippedCount = 0
			  mNotImplementedCount = 0
			  
			  Var totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    If tg.IncludeGroup Then
			      totalCount = totalCount + tg.RunTestCount
			      
			      mPassedCount = mPassedCount + tg.PassedTestCount
			      mFailedCount = mFailedCount + tg.FailedTestCount
			      mSkippedCount = mSkippedCount + tg.SkippedTestCount
			      mNotImplementedCount = mNotImplementedCount + tg.NotImplementedCount
			    End If
			  Next
			  
			  Return totalCount
			End Get
		#tag EndGetter
		RunTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSkippedCount
			End Get
		#tag EndGetter
		SkippedCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TestQueue() As TestGroup
	#tag EndProperty


	#tag Constant, Name = kHasDotComment, Type = String, Dynamic = False, Default = \"(\?#HasDot)", Scope = Private, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
	#tag EndConstant

	#tag Constant, Name = XojoUnitVersion, Type = String, Dynamic = False, Default = \"6.7.1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunGroupCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
