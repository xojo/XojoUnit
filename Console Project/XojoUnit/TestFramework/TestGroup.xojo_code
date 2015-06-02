#tag Class
Protected Class TestGroup
	#tag Method, Flags = &h21
		Private Sub ClearResults(skipped As Boolean = False)
		  For Each tr As TestResult In mResults
		    If skipped Then
		      tr.Result = TestResult.Skipped
		    Else
		      tr.Result = TestResult.NotImplemented
		    End If
		    tr.Message = ""
		    tr.Duration = 0
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(controller As TestController, groupName As String)
		  mController = controller
		  Name = groupName
		  
		  mController.AddGroup(Self)
		  
		  mAssert = New Assert
		  mAssert.Group = Self
		  
		  GetTestMethods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EndTimer()
		  Dim elapsed As Double
		  
		  elapsed = (Microseconds-mTimer) / 1000000
		  
		  CurrentTestResult.Duration = elapsed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIf(condition As Boolean, message As String)
		  Assert.IsFalse(condition, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetTestMethods()
		  Dim info As Introspection.TypeInfo
		  
		  info = Introspection.GetType(Self)
		  
		  Dim methods() As Introspection.MethodInfo
		  methods = info.GetMethods
		  
		  For Each m As Introspection.MethodInfo In methods
		    If m.Name.Right(4) = kTestSuffix Then
		      // Initialize test results
		      Dim tr As New TestResult
		      tr.TestName = m.Name.Left(m.Name.Len-Len(kTestSuffix))
		      tr.Result = TestResult.NotImplemented
		      
		      mResults.Append(tr)
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTestResult(testName As String) As TestResult
		  For Each tr As TestResult In mResults
		    If tr.TestName + kTestSuffix = testName Then
		      Return tr
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Results() As TestResult()
		  Return mResults
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  Dim info As Introspection.TypeInfo
		  
		  info = Introspection.GetType(Self)
		  
		  Dim methods() As Introspection.MethodInfo
		  methods = info.GetMethods
		  
		  For Each m As Introspection.MethodInfo In methods
		    Dim param() As Variant
		    Dim rv As Variant
		    
		    If m.Name.Right(4) = kTestSuffix Then
		      
		      Try
		        CurrentTestResult = GetTestResult(m.Name)
		        
		        StartTimer
		        rv = m.Invoke(Self, param)
		        EndTimer
		        
		      Catch e As RuntimeException
		        Dim eInfo As Introspection.TypeInfo
		        eInfo = Introspection.GetType(e)
		        
		        Dim errorMessage As String
		        errorMessage = "A " + eInfo.FullName + " occurred and was caught."
		        If e.Message <> "" Then
		          errorMessage = errorMessage + EndOfLine + "Message: " + e.Message
		        End If
		        Assert.Fail(errorMessage)
		      End Try
		      
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  If IncludeGroup Then
		    ClearResults
		    RaiseEvent Setup
		    RunTests
		    RaiseEvent TearDown
		  Else
		    ClearResults(True) // Mark tests as Skipped
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimer()
		  mTimer = Microseconds
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Setup()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TearDown()
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mAssert
			End Get
		#tag EndGetter
		Protected Assert As Assert
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		CurrentTestResult As TestResult
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim testCount As Integer
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Failed Then
			      testCount = testCount + 1
			    End If
			  Next
			  
			  Return testCount
			End Get
		#tag EndGetter
		FailedTestCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		IncludeGroup As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAssert As Assert
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mController As TestController
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResults() As TestResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim testCount As Integer
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Passed Then
			      testCount = testCount + 1
			    End If
			  Next
			  
			  Return testCount
			End Get
		#tag EndGetter
		PassedTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim testCount As Integer
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Passed Or tr.Result = TestResult.Failed Then
			      testCount = testCount + 1
			    End If
			  Next
			  
			  Return testCount
			End Get
		#tag EndGetter
		RunTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim testCount As Integer
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Skipped Then
			      testCount = testCount + 1
			    End If
			  Next
			  
			  Return testCount
			End Get
		#tag EndGetter
		SkippedTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mResults.Ubound + 1
			End Get
		#tag EndGetter
		TestCount As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kTestSuffix, Type = String, Dynamic = False, Default = \"Test", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="FailedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="PassedTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
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
			Name="TestCount"
			Group="Behavior"
			Type="Integer"
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
