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
		    RunTestsTimer.Period = kTimerPeriod
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CalculateTestDuration()
		  If CurrentTestResult Is Nil Then
		    //
		    // Don't do anything
		    //
		    Return
		  End If
		  
		  Var elapsed As Double
		  
		  If CurrentClone Is Nil Then
		    elapsed = 0.0
		  Else
		    elapsed = (System.Microseconds - TestDuration) / 1000000.0
		  End If
		  
		  CurrentTestResult.Duration = elapsed
		  
		  Var c As TestController = Controller
		  If c IsA Object Then
		    c.RaiseTestFinished CurrentTestResult, Self
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearResults(skipped As Boolean = False)
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
		Sub Constructor(controller As TestController, groupName As String = "")
		  groupName = groupName.Trim
		  
		  //
		  // If groupName was not given, use the name of the class
		  //
		  If groupName = "" Then
		    Var ti As Introspection.TypeInfo = Introspection.GetType(Self)
		    groupName = ti.FullName
		  End If
		  
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
		  
		  Static props() As Introspection.PropertyInfo
		  If props.LastIndex = -1 Then
		    Var ti As Introspection.TypeInfo
		    ti = Introspection.GetType(Self)
		    While ti.BaseType IsA Object And Not (ti Is ti.BaseType)
		      ti = ti.BaseType
		    Wend
		    props = ti.GetProperties
		  End If
		  
		  //
		  // Skip certain props all the time
		  //
		  Var skipProps() As String = Array("CurrentClone", "TestTimers")
		  
		  //
		  // Since computed properties can have side effects, do them first
		  //
		  Var doComputed As Boolean = False // Will be flipped in the loop
		  
		  Do
		    doComputed = Not doComputed
		    
		    For Each prop As Introspection.PropertyInfo In props
		      If prop.IsComputed <> doComputed Then
		        Continue For prop
		      End If
		      
		      Var propName As String = prop.Name
		      
		      If prop.IsShared Or Not prop.CanRead Or Not prop.CanWrite Or skipProps.IndexOf(propName) <> -1 Then
		        Continue For prop
		      End If
		      
		      Var propType As String = prop.PropertyType.Name
		      Var fromValue As Variant = prop.Value(fromGroup)
		      
		      //
		      // Handle arrays specially
		      //
		      If propType.Right(2) = "()" Then
		        Var toArr() As Object = prop.Value(Self)
		        Var fromArr() As Object = fromValue
		        
		        For i As Integer = 0 To fromArr.LastIndex
		          toArr.Add(fromArr(i))
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
		    RunTestsTimer.RunMode = Timer.RunModes.Off
		    #If TargetiOS Then
		      RemoveHandler RunTestsTimer.Run, WeakAddressOf RunTestsTimer_Action
		    #Else
		      RemoveHandler RunTestsTimer.Action, WeakAddressOf RunTestsTimer_Action
		    #EndIf
		    RunTestsTimer = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ErrorIf(condition As Boolean, message As String)
		  Assert.IsFalse(condition, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetTestMethods()
		  Var info As Introspection.TypeInfo
		  
		  info = Introspection.GetType(Self)
		  
		  Var methods() As Introspection.MethodInfo
		  methods = info.GetMethods
		  
		  //
		  // Get the unique set of methods
		  //
		  Var methodsDict As New Dictionary
		  For i As Integer = 0 To methods.LastIndex
		    Var m As Introspection.MethodInfo = methods(i)
		    If m.Name.Length > kTestSuffix.Length And m.Name.Right(kTestSuffix.Length) = kTestSuffix And _
		      m.GetParameters.LastIndex = -1 Then
		      methodsDict.Value(m.Name) = m // Will replace overridden methods
		    End If
		  Next 
		  
		  For Each entry As DictionaryEntry In methodsDict
		    // Initialize test results
		    Var m As Introspection.MethodInfo = entry.Value
		    Var tr As New TestResult
		    tr.TestName = m.Name.Left(m.Name.Length - kTestSuffix.Length)
		    tr.MethodInfo = m
		    tr.Result = TestResult.NotImplemented
		    
		    mResults.Add(tr)
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

	#tag Method, Flags = &h1
		Protected Function GetTestTimer(key As String = "") As Double
		  Var endTime As Double = System.Microseconds
		  Var startTime As Double = TestTimers.Value(key)
		  Var duration As Double = endTime - startTime
		  
		  Return duration
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LogTestTimer(key As String = "", stage As String = "")
		  //
		  // StartTestTimer must be called first.
		  //
		  // If not used properly, this will raise an exception, intentionally.
		  //
		  
		  Var duration As Double = GetTestTimer(key)
		  
		  Var durationText As String
		  Var unit As String = "µs"
		  Var useFormat As String = "#,###,##0"
		  
		  Const kSeconds As Double = 1000000.0
		  
		  If duration > (60.0 * kSeconds) Then
		    duration = duration / (60.0 * kSeconds)
		    unit = "m"
		    useFormat = "#,###,##0.0##"
		    
		  ElseIf duration > (1.0 * kSeconds) Then
		    duration = duration / (1.0 * kSeconds)
		    unit = "s"
		    useFormat = "#,###,##0.0###"
		    
		  ElseIf duration > 1000.0 Then
		    duration = duration / 1000.0
		    unit = "ms"
		    useFormat = "#,###,##0.0##"
		    
		  End If
		  
		  durationText = duration.ToString(Locale.Current, useFormat) + " " + unit
		  stage = stage.Trim
		  
		  Assert.Message "Test Timer " + _
		  If(key.IsEmpty, "", key + " ") + _
		  If(stage.IsEmpty, "", "[" + stage + "] ") + _
		  "took " + durationText
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetTestDuration()
		  TestDuration = System.Microseconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Results() As TestResult()
		  Return mResults
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTestsTimer_Action(sender As Timer)
		  #Pragma Unused sender
		  
		  Static isTestRunning As Boolean
		  
		  //
		  // If DoEvents is called in a test, we could get here before the method is complete,
		  // so we have to prevent that
		  //
		  If isTestRunning Then
		    Return
		  End If
		  
		  If UseConstructor Is Nil Then
		    Var myInfo As Introspection.TypeInfo = Introspection.GetType(Self)
		    Var constructors() As Introspection.ConstructorInfo = myInfo.GetConstructors
		    For Each c As Introspection.ConstructorInfo In constructors
		      If c.GetParameters.LastIndex = 0 Then
		        UseConstructor = c
		        Exit For c
		      End If
		    Next c
		  End If
		  
		  Var constructorParams() As Variant
		  constructorParams.Add Self
		  
		  If CurrentClone IsA Object Then
		    CalculateTestDuration
		    If CurrentClone.IsAwaitingAsync Then
		      Assert.Fail "Asynchronous test did not complete in time"
		    End If
		  End If
		  
		  If CurrentResultIndex <= mResults.LastIndex Then
		    RunTestsTimer.Period = kTimerPeriod
		    CurrentClone = Nil // Make sure TearDown happens
		    
		    Var result As TestResult = mResults(CurrentResultIndex)
		    CurrentResultIndex = CurrentResultIndex + 1
		    
		    If Not result.IncludeMethod Then
		      result.Result = Result.Skipped
		      Return
		    End If
		    
		    //
		    // Handle any error after stopping the Timer
		    //
		    Var err As RuntimeException
		    
		    Try
		      CurrentTestResult = result
		      Var method As Introspection.MethodInfo = result.MethodInfo
		      
		      //
		      // Get a clone
		      //
		      CurrentClone = useConstructor.Invoke(constructorParams)
		      
		      ResetTestDuration
		      Assert.FailCount = 0
		      IsTestRunning = True
		      method.Invoke(CurrentClone)
		      IsTestRunning = False
		      
		      If CurrentClone Is Nil Then
		        //
		        // Can happen if DoEvents is invoked and the test stopped
		        //
		        Return
		      End If
		      
		      If CurrentClone.IsAwaitingAsync Then
		        Return // The next round will resume testing
		      End If
		      
		    Catch failedErr As XojoUnitTestFailedException
		      //
		      // The exception is raised because the group was set to StopTestOnFail
		      //
		      
		    Catch e As RuntimeException
		      If e IsA EndException Or e IsA ThreadEndException Then
		        Raise e
		      End If
		      
		      //
		      // Process it below
		      //
		      err = e
		      
		    End Try
		    
		    IsTestRunning = False // Again, just in case
		    CalculateTestDuration
		    
		    If err IsA Object Then
		      
		      If Not RaiseEvent UnhandledException(err, result.TestName) Then
		        
		        Var eInfo As Introspection.TypeInfo
		        eInfo = Introspection.GetType(err)
		        
		        Var errorMessage As String = "A " + eInfo.FullName + " occurred and was caught"
		        If CurrentClone Is Nil Then
		          errorMessage = errorMessage + " – something in the Setup event failed"
		        End If
		        errorMessage = errorMessage + "."
		        
		        If err.Message <> "" Then
		          errorMessage = errorMessage + &u0A + "Message: " + err.Message
		        End If
		        Assert.Fail(errorMessage)
		        
		      End If
		    End If
		    
		    Return
		  End If
		  
		  Stop
		  
		  Var c As TestController = Controller
		  If c IsA Object Then
		    c.RaiseGroupFinished Self
		  End If
		  
		  Controller.RunNextTest
		  
		  
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
		    If RunTestsTimer Is Nil Then
		      RunTestsTimer = New Timer
		      #If TargetiOS Then
		        AddHandler RunTestsTimer.Run, WeakAddressOf RunTestsTimer_Action
		      #Else
		        AddHandler RunTestsTimer.Action, WeakAddressOf RunTestsTimer_Action
		      #EndIf
		    End If
		    RunTestsTimer.Period = kTimerPeriod
		    RunTestsTimer.RunMode = Timer.RunModes.Multiple
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StartTestTimer(key As String = "")
		  If TestTimers Is Nil Then
		    TestTimers = New Dictionary
		  End If
		  
		  TestTimers.Value(key) = System.Microseconds
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  CurrentClone = Nil
		  CurrentTestResult = Nil
		  If RunTestsTimer IsA Object Then
		    RunTestsTimer.RunMode = Timer.RunModes.Off
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Setup()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TearDown()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UnhandledException(err As RuntimeException, methodName As String) As Boolean
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
			    mController = new WeakRef(value)
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
			  Var duration As Double
			  
			  For Each tr As TestResult In mResults
			    If tr.Result = TestResult.Passed Or tr.Result = TestResult.Failed Then
			      duration = duration + tr.Duration
			    End If
			  Next
			  
			  Return duration
			End Get
		#tag EndGetter
		Duration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var testCount As Integer
			  
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
			  Return RunTestsTimer Isa Object And RunTestsTimer.RunMode <> Timer.RunModes.Off
			  
			End Get
		#tag EndGetter
		IsRunning As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAssert As Assert
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mController As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResults() As TestResult
	#tag EndProperty

	#tag Property, Flags = &h21
		Attributes( hidden ) Private mStopTestOnFail As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var testCount As Integer
			  
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
			  Var testCount As Integer
			  
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
			  Var testCount As Integer
			  
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
		Private RunTestsTimer As Timer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var testCount As Integer
			  
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
			  If Not IsClone And CurrentClone IsA Object Then
			    Return CurrentClone.StopTestOnFail
			  Else
			    Return mStopTestOnFail
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not IsClone And CurrentClone IsA Object Then
			    CurrentClone.StopTestOnFail = value
			  Else
			    mStopTestOnFail = value
			  End If
			End Set
		#tag EndSetter
		StopTestOnFail As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mResults.LastIndex + 1
			End Get
		#tag EndGetter
		TestCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TestDuration As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TestTimers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UseConstructor As Introspection.ConstructorInfo
	#tag EndProperty


	#tag Constant, Name = kTestSuffix, Type = String, Dynamic = False, Default = \"Test", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTimerPeriod, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="PassedTestCount"
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
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
