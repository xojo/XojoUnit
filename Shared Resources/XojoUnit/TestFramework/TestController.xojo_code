#tag Class
Protected Class TestController
	#tag Method, Flags = &h0
		Sub AddGroup(group As TestGroup)
		  mTestGroups.Append(group)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EndTimer()
		  mDuration = (Microseconds-mTimer) / 1000000
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub ExportTestResults(filePath As Text)
		  #If TargetWin32 Then
		    Const kEOL As Text = &u0D + &u0A
		  #Else
		    Const kEOL As Text = &u0A
		  #Endif
		  
		  Dim f as FolderItem
		  f = New FolderItem(filePath, FolderItem.PathTypeShell)
		  Dim stream as BinaryStream
		  If f <> Nil Then
		    stream=BinaryStream.Create(f, True)
		    stream.Write "<?xml version=""1.0"" encoding=""UTF-8"" ?>" + kEOL
		    stream.Write "<testsuites>" + kEOL
		    For Each tg As TestGroup In mTestGroups
		      stream.Write "  <testsuite errors=""0"" skipped=""" + tg.SkippedTestCount.ToText + """ tests=""" + tg.TestCount.ToText + """ time=""" + tg.Duration.ToText + """ failures=""" + tg.FailedTestCount.ToText + """ name=""com.atlassian.bamboo.labels." + tg.Name + """>" + kEOL
		      For Each tr As TestResult In tg.Results
		        stream.Write "    <testcase name=""" + tr.TestName + """ duration=""" + tr.Duration.ToText + """>" + kEOL
		        if tr.Result = TestResult.Skipped then
		          stream.Write "       <skipped />" + EndOfLine
		        end
		        if tr.Result = TestResult.Failed then
		          dim failMessage As Text = tr.Message
		          failMessage = failMessage.ReplaceAll("<", "&lt;")
		          failMessage = failMessage.ReplaceAll(">", "&gt;")
		          stream.Write "       <failure type=""xojo.AssertionFailedError"" message=""" + failMessage + """/>" + kEOL
		        end
		        stream.Write "    </testcase>" + kEOL
		      Next
		      stream.Write "  </testsuite>" + kEOL
		    Next
		    stream.Write "</testsuites>" + kEOL
		    stream.Close
		  End if
		  
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
		  
		  
		  If includePatterns.Ubound = -1 And excludePatterns.Ubound = -1 Then
		    Dim err As New RuntimeException
		    err.Message = "You must specify at least one include or exclude pattern"
		    Raise err
		  End if
		  
		  //
		  // Convert the patterns into regular expressions
		  //
		  For i As Integer = 0 To includePatterns.Ubound
		    includePatterns(i) = SimplePatternToRegExPattern(includePatterns(i))
		  Next i
		  
		  For i As Integer = 0 To excludePatterns.Ubound
		    excludePatterns(i) = SimplePatternToRegExPattern(excludePatterns(i))
		  Next i
		  
		  //
		  // Set up the RegEx
		  //
		  Dim rx As New RegEx
		  
		  //
		  // Process includes
		  //
		  For Each group As TestGroup In TestGroups
		    //
		    // Turn all methods on and the group on/off
		    //
		    group.IncludeGroup = (includePatterns.Ubound = -1) // If there are any includes, default to False
		    group.SetIncludeMethods(True)
		    Dim methodsTurnedOff As Boolean
		    
		    For Each pattern As String In includePatterns
		      rx.SearchPattern = pattern
		      Dim hasDot As Boolean = PatternHasDot(pattern)
		      
		      //
		      // See if this pattern matches any methods
		      //
		      If hasDot Then
		        For Each result As TestResult In group.Results
		          Dim methodName As String = group.Name + "." + result.MethodInfo.Name
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
		      Dim hasDot As Boolean = PatternHasDot(pattern)
		      
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
		          
		          Dim methodName As String = group.Name + "." + result.MethodInfo.Name
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
		  EndTimer
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
		  Return pattern.Left(kHasDotComment.Len) = kHasDotComment
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseGroupFinished(group As TestGroup)
		  RaiseEvent GroupFinished(group)
		  If Not IsRunning Then
		    Finish
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RaiseTestFinished(result As TestResult, group As TestGroup)
		  RaiseEvent TestFinished(result, group)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTestGroups()
		  StartTimer
		  Dim excludeCount As Integer
		  For Each tg As TestGroup In mTestGroups
		    If Not tg.IncludeGroup Then
		      excludeCount = excludeCount + 1
		    Else
		      tg.Start
		    End If
		  Next
		  
		  If excludeCount = (mTestGroups.Ubound + 1) Then
		    //
		    // All excluded or no tests
		    //
		    Finish
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Private Function SimplePatternToRegExPattern(pattern As String) As String
		  Const kPlaceholder As String = &u01
		  
		  Dim hasDot As Boolean = pattern.InStr(".") <> 0
		  
		  pattern = pattern.ReplaceAll("*", kPlaceholder)
		  pattern = "^\Q" + pattern.ReplaceAllB("\E", "\E\\E\Q") + "\E"
		  pattern = pattern.ReplaceAll(kPlaceholder, "\E.*\Q")
		  
		  //
		  // If it may match a method (includs a dot), add the optional TestSuffix
		  //
		  If hasDot Then
		    pattern = kHasDotComment + pattern + "(?:" + TestGroup.kTestSuffix + ")?"
		  End If
		  
		  pattern = pattern + "$"
		  
		  return pattern
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  RunTestGroups
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimer()
		  mTimer = Microseconds
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
			  Dim totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    totalCount = totalCount + tg.TestCount
			  Next
			  
			  Return totalCount
			End Get
		#tag EndGetter
		AllTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDuration
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
			  Return mTestGroups.Ubound + 1
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
		Private mDuration As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFailedCount As Integer
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
		Private mTestGroups() As TestGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Double
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
			  Dim cnt As Integer
			  
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
			  
			  Dim totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    totalCount = totalCount + tg.RunTestCount
			    
			    mPassedCount = mPassedCount + tg.PassedTestCount
			    mFailedCount = mFailedCount + tg.FailedTestCount
			    mSkippedCount = mSkippedCount + tg.SkippedTestCount
			    mNotImplementedCount = mNotImplementedCount + tg.NotImplementedCount
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


	#tag Constant, Name = kHasDotComment, Type = String, Dynamic = False, Default = \"(\?#HasDot)", Scope = Private, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
	#tag EndConstant

	#tag Constant, Name = XojoUnitVersion, Type = Text, Dynamic = False, Default = \"6.0.1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunGroupCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
