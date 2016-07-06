#tag Class
Protected Class TestGroup
	#tag Method, Flags = &h1
		Protected Sub AsyncAwait(maxSeconds As Integer)
		  If IsRunning Then
		    IsAwaitingAsync = True
		    RunTestsTimer.Period = maxSeconds * 1000
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AsyncComplete()
		  IsAwaitingAsync = False
		  If IsRunning Then
		    RunTestsTimer.Period = 1
		  End If
		  
		  
		End Sub
	#tag EndMethod

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
		  CurrentTestResult = Nil
		  CurrentResultIndex = 0
		  CurrentClone = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(controller As TestController, groupName As Text)
		  Name = groupName
		  Self.Controller = controller
		  
		  controller.AddGroup(Self)
		  
		  mAssert = New Assert
		  mAssert.Group = Self
		  
		  GetTestMethods
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(fromGroup As TestGroup)
		  //
		  // Clone from another group
		  //
		  // Only take the super's properties
		  //
		  
		  Static props() As Xojo.Introspection.PropertyInfo
		  If props.Ubound = -1 Then
		    Dim ti As Xojo.Introspection.TypeInfo
		    ti = Xojo.Introspection.GetType(Self)
		    While ti.BaseType IsA Object And Not (ti Is ti.BaseType)
		      ti = ti.BaseType
		    Wend
		    props = ti.Properties
		  End If
		  
		  //
		  // Skip certain props all the time
		  //
		  Dim skipProps() As Text = Array("CurrentClone")
		  
		  //
		  // Since computed properties can have side effects, do them first
		  //
		  Dim doComputed As Boolean = False // Will be flipped in the loop
		  
		  Do
		    doComputed = Not doComputed
		    
		    For Each prop As Xojo.Introspection.PropertyInfo In props
		      If prop.IsComputed <> doComputed Then
		        Continue For prop
		      End If
		      
		      If Not prop.CanRead Or Not prop.CanWrite Or skipProps.IndexOf(prop.Name) <> -1 Then
		        Continue For prop
		      End If
		      
		      Dim fromValue As Auto = prop.Value(fromGroup)
		      Dim propName As Text = prop.PropertyType.Name
		      
		      //
		      // Handle arrays specially
		      //
		      If propName.Right(2) = "()" Then
		        Dim toArr() As Object = prop.Value(Self)
		        Dim fromArr() As Object = fromValue
		        
		        For i As Integer = 0 To fromArr.Ubound
		          toArr.Append(fromArr(i))
		        Next i
		      Else
		        prop.Value(Self) = fromValue
		      End If
		    Next prop
		    
		  Loop Until doComputed = False
		  
		  IsClone = True
		  RaiseEvent Setup
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If IsClone Then
		    RaiseEvent TearDown
		  End If
		  
		  If Not IsClone And RunTestsTimer IsA Object Then
		    RunTestsTimer.Mode = Xojo.Core.Timer.Modes.Off
		    RemoveHandler RunTestsTimer.Action, WeakAddressOf RunTestsTimer_Action
		    RunTestsTimer = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EndTimer()
		  Dim elapsed As Double
		  
		  elapsed = (Microseconds-mTimer) / 1000000
		  
		  CurrentTestResult.Duration = elapsed
		  
		  Dim c As TestController = Controller
		  If c IsA Object Then
		    c.RaiseTestFinished CurrentTestResult, Self
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIf(condition As Boolean, message As Text)
		  Assert.IsFalse(condition, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetTestMethods()
		  Dim info As Xojo.Introspection.TypeInfo
		  
		  info = Xojo.Introspection.GetType(Self)
		  
		  Dim methods() As Xojo.Introspection.MethodInfo
		  methods = info.Methods
		  
		  For Each m As Xojo.Introspection.MethodInfo In methods
		    If m.Name.Right(kTestSuffix.Length) = kTestSuffix Then
		      // Initialize test results
		      Dim tr As New TestResult
		      tr.TestName = m.Name.Left(m.Name.Length - kTestSuffix.Length)
		      tr.MethodInfo = m
		      tr.Result = TestResult.NotImplemented
		      
		      mResults.Append(tr)
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTestResult(testName As Text) As TestResult
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
		Private Sub RunTestsTimer_Action(sender As Xojo.Core.Timer)
		  If UseConstructor Is Nil then
		    Dim myInfo As Xojo.Introspection.TypeInfo = Xojo.Introspection.GetType(Self)
		    Dim constructors() As Xojo.Introspection.ConstructorInfo = myInfo.Constructors
		    For Each c As Xojo.Introspection.ConstructorInfo In constructors
		      If c.Parameters.Ubound = 0 Then
		        UseConstructor = c
		        Exit For c
		      End If
		    Next c
		  End If
		  
		  Dim constructorParams() As Auto
		  constructorParams.Append Self
		  
		  If CurrentClone IsA Object Then
		    EndTimer
		    If CurrentClone.IsAwaitingAsync Then
		      Assert.Fail "Asynchronous test did not complete in time"
		    End If
		  End If
		  
		  While CurrentResultIndex <= mResults.Ubound
		    CurrentClone = Nil // Make sure TearDown happens
		    
		    Dim result As TestResult = mResults(CurrentResultIndex)
		    CurrentResultIndex = CurrentResultIndex + 1
		    
		    If Not result.IncludeMethod Then
		      result.Result = Result.Skipped
		      Continue While
		    End If
		    
		    //
		    // Handle any error after stopping the Timer
		    //
		    Dim err As RuntimeException
		    
		    Try
		      CurrentTestResult = result
		      Dim method As Xojo.Introspection.MethodInfo = result.MethodInfo
		      
		      //
		      // Get a clone
		      //
		      CurrentClone = useConstructor.Invoke(constructorParams)
		      
		      StartTimer
		      method.Invoke(CurrentClone)
		      If CurrentClone.IsAwaitingAsync Then
		        Return // The next round will resume testing
		      End If
		      
		    Catch e As RuntimeException
		      If e IsA EndException Or e IsA ThreadEndException Then
		        Raise e
		      End If
		      
		      //
		      // Process it below
		      //
		      err = e
		      
		    End Try
		    
		    EndTimer
		    
		    If err IsA Object Then
		      
		      If Not RaiseEvent UnhandledException(err, result.TestName) Then
		        
		        Dim eInfo As Xojo.Introspection.TypeInfo
		        eInfo = Xojo.Introspection.GetType(err)
		        
		        Dim errorMessage As Text
		        errorMessage = "A " + eInfo.FullName + " occurred and was caught."
		        If err.Reason <> "" Then
		          errorMessage = errorMessage + &u0A + "Message: " + err.Reason
		        End If
		        Assert.Fail(errorMessage)
		        
		      End If
		    End If
		  Wend
		  
		  CurrentClone = Nil
		  CurrentTestResult = Nil
		  sender.Mode = Xojo.Core.Timer.Modes.Off
		  
		  Dim c As TestController = Controller
		  If c IsA Object Then
		    c.RaiseGroupFinished Self
		  End if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIncludeMethods(value As Boolean)
		  For Each result As TestResult In Results
		    result.IncludeMethod = value
		  Next 
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  If IncludeGroup Then
		    ClearResults
		    If RunTestsTimer Is Nil Then
		      RunTestsTimer = New Xojo.Core.Timer
		      AddHandler RunTestsTimer.Action, WeakAddressOf RunTestsTimer_Action
		    End If
		    RunTestsTimer.Period = 1
		    RunTestsTimer.Mode = Xojo.Core.Timer.Modes.Multiple
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

	#tag Hook, Flags = &h0
		Event UnhandledException(err As RuntimeException, methodName As Text) As Boolean
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mAssert
			End Get
		#tag EndGetter
		Protected Assert As Assert
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mController Is Nil Then
			    Return Nil
			  Else
			    Return TestController(mController.Value)
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Is Nil Then
			    mController = Nil
			  Else
			    mController = Xojo.Core.WeakRef.Create(value)
			  End If
			  
			End Set
		#tag EndSetter
		Private Controller As TestController
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private CurrentClone As TestGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CurrentResultIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentTestResult As TestResult
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim _duration As Double = 0
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Passed Or tr.Result = TestResult.Failed Then
			      _duration = _duration + tr.Duration
			    End If
			  Next
			  
			  Return _duration
			End Get
		#tag EndGetter
		Duration As Double
	#tag EndComputedProperty

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

	#tag Property, Flags = &h1
		Protected IsAwaitingAsync As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsClone As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return RunTestsTimer Isa Object And RunTestsTimer.Mode <> Xojo.Core.Timer.Modes.Off
			  
			End Get
		#tag EndGetter
		IsRunning As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAssert As Assert
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mController As Xojo.Core.WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResults() As TestResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As Text
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim testCount As Integer
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.NotImplemented Then
			      testCount = testCount + 1
			    End If
			  Next
			  
			  Return testCount
			End Get
		#tag EndGetter
		NotImplementedCount As Integer
	#tag EndComputedProperty

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

	#tag Property, Flags = &h21
		Private RunTestsTimer As Xojo.Core.Timer
	#tag EndProperty

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

	#tag Property, Flags = &h21
		Private UseConstructor As Xojo.Introspection.ConstructorInfo
	#tag EndProperty


	#tag Constant, Name = kTestSuffix, Type = Text, Dynamic = False, Default = \"Test", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
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
