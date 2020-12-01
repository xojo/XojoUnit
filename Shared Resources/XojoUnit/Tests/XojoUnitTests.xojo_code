#tag Class
Protected Class XojoUnitTests
Inherits XojoUnitSuperClassTests
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  If AsyncTestTimer IsA Object Then
		    AsyncTestTimer.RunMode = Timer.RunModes.Off
		    #If TargetiOS Then
		      RemoveHandler AsyncTestTimer.Run, WeakAddressOf AsyncTestTimer_Action
		    #Else
		      RemoveHandler AsyncTestTimer.Action, WeakAddressOf AsyncTestTimer_Action
		    #EndIf
		    AsyncTestTimer = Nil
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As String) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As String = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AreDifferentObjectTest()
		  Var d1 As DateTime = DateTime.Now
		  Var d2 As New DateTime(2001, 1, 1, 0, 0, 0, 0, TimeZone.Current)
		  
		  Assert.AreDifferent(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreDifferentStringTest()
		  Var s1 As String = "Hello"
		  Var s2 As String = "hello"
		  
		  // String matches with AreDifferent are case-sensitive
		  Assert.AreDifferent(s1, s2)
		  
		  s1 = s2
		  s1 = s1.DefineEncoding(Nil)
		  Assert.AreDifferent(s1, s2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualColorTest()
		  Var c1 As Color = &c0000ff
		  Var c2 As Color = &c0000ff
		  
		  Assert.AreEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualCurrencyTest()
		  Var c1 As Currency = 42.38
		  Var c2 As Currency = 40.00 + 2.38
		  
		  Assert.AreEqual(c1, c2)
		  
		  c1 = 1.02
		  c2 = 1.99
		  
		  Assert.AreNotEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualDateTimeTest()
		  Var d1 As New DateTime(2012, 11, 30)
		  Var d2 As New DateTime(2012, 11, 30)
		  
		  Assert.AreEqual(d1, d2)
		  
		  d1 = Nil
		  d2 = Nil
		  
		  Assert.AreEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleDefaultTest()
		  Var d1 As Double = 1.000000001
		  Var d2 As Double = 1.000000002
		  
		  // Passes becaue the numbers are within the
		  // default tolerance of 0.00000001
		  Assert.AreEqual(d1, d2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleTest()
		  Var d1 As Double = 1.01
		  Var d2 As Double = 1.02
		  
		  // Passes because the numbers are within the tolerance of 0.01
		  Assert.AreEqual(d1, d2, 0.01)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualInt64Test()
		  Var temp As UInt32 = 0
		  temp = temp - 1
		  
		  Var i1 As Int64 = temp
		  Var i2 As Int64 = temp
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualIntegerArrayTest()
		  Var i1() As Integer = Array(1, 2, 3, 4, 5)
		  Var i2() As Integer
		  i2.Add(1)
		  i2.Add(2)
		  i2.Add(3)
		  i2.Add(4)
		  i2.Add(5)
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualIntegerTest()
		  Var i1 As Integer = 42
		  Var i2 As Integer = 7 * 6
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualMemoryBlockTest()
		  Var m1 As Global.MemoryBlock = "Hello"
		  Var m2 As Global.MemoryBlock = "Hello"
		  
		  Assert.AreEqual(m1, m2)
		  
		  m1 = Nil
		  m2 = Nil
		  
		  Assert.AreEqual(m1, m2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualStringArrayTest()
		  Var s1() As String = Array("A", "B", "C")
		  Var s2() As String
		  s2.Add("A")
		  s2.Add("B")
		  s2.Add("C")
		  Assert.AreEqual(s1, s2)
		  
		  s2(1) = s2(1).DefineEncoding(Nil)
		  Assert.AreEqual(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualStringTest()
		  Var s1 As String = "Hello"
		  Var s2 As String = "hello"
		  
		  // Passes because string comparisons are case-insensitive
		  Assert.AreEqual(s1, s2)
		  
		  s1 = s1.DefineEncoding(Nil)
		  Assert.AreEqual(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualUIntegerTest()
		  Var i1 As UInteger = 42
		  Var i2 As UInteger = 7 * 6
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualColorTest()
		  Var c1 As Color = &c0000fe
		  Var c2 As Color = &c0000ff
		  
		  Assert.AreNotEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqualDateTimeTest()
		  Var d1 As New DateTime(2012, 11, 29)
		  Var d2 As New DateTime(2012, 11, 30)
		  
		  Assert.AreNotEqual(d1, d2)
		  
		  d2 = Nil
		  
		  Assert.AreNotEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualDoubleTest()
		  Var d1 As Double = 1.01
		  Var d2 As Double = 1.02
		  
		  // Passes because the numbers are not within the tolerance of 0.001
		  Assert.AreNotEqual(d1, d2, 0.001)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqualMemoryBlockTest()
		  Var m1 As Global.MemoryBlock = "hello"
		  Var m2 As Global.MemoryBlock = "Hello"
		  
		  Assert.AreNotEqual(m1, m2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameObjectTest()
		  Var d1 As DateTime = DateTime.Now
		  Var d2 As DateTime
		  
		  d2 = d1
		  
		  Assert.AreSame(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSameStringArrayTest()
		  Var s1() As String = Array("A", "B", "C")
		  Var s2() As String
		  s2.Add("A")
		  s2.Add("B")
		  s2.Add("C")
		  Assert.AreSame(s1, s2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSameStringTest()
		  Var s1 As String = "Hello"
		  Var s2 As String = "Hello"
		  
		  // String matches with AreSame are case-sensitive
		  Assert.AreSame(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AssertFailedTest()
		  Assert.IsTrue(True)
		  Assert.IsFalse(Assert.Failed)
		  
		  If CurrentTestResult.Result = TestResult.Passed Then
		    Assert.IsTrue(False) // Intentional Fail
		    CurrentTestResult.Result = TestResult.Passed
		    Assert.IsTrue(Assert.Failed)
		    Assert.IsFalse(Assert.Failed)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AsyncTest()
		  If AsyncTestTimer Is Nil Then
		    AsyncTestTimer = New Timer
		    #If TargetiOS Then
		      AddHandler AsyncTestTimer.Run, WeakAddressOf AsyncTestTimer_Action
		    #Else
		      AddHandler AsyncTestTimer.Action, WeakAddressOf AsyncTestTimer_Action
		    #EndIf
		  End If
		  
		  AsyncTestTimer.RunMode = Timer.RunModes.Single
		  AsyncTestTimer.Period = 500
		  AsyncAwait 3
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AsyncTestTimer_Action(sender As Timer)
		  #Pragma Unused sender
		  
		  AsyncComplete
		  Assert.Pass "Async timer action ran as scheduled"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanSlate1Test()
		  Assert.AreEqual(0, Prop1)
		  Prop1 = Prop1 + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CleanSlate2Test()
		  Assert.AreEqual(0, Prop1)
		  Prop1 = Prop1 + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DoesNotMatchStringTest()
		  Var actual As String = "abcde"
		  Var pattern As String = "^\d+$"
		  
		  Assert.DoesNotMatch(pattern, actual)
		  
		  actual = "abcd"
		  pattern = "^(?-i)[A-Z]+$"
		  
		  Assert.DoesNotMatch(pattern, actual)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DoEventsTest()
		  //
		  // Ensures that calling DoEvents will not short-circuit the test
		  //
		  
		  //**********************************************************/
		  //*                                                        */
		  //*   DO NOT USE DoEvents OTHER THAN IN A CONSOLE APP!     */
		  //*                                                        */
		  //**********************************************************/
		  
		  //
		  // Use DoEvents in a console app if you must, but otherwise,
		  // avoid it like it's not even there. Use Threads, events, Timers,
		  // or anything else instead.
		  //
		  // If you think it's the only way to do what you want, you're wrong,
		  // it's not, it's just the easy way, but it can cause intermittent
		  // problems in your app that you may not even spot during testing,
		  // just like the ones that showed up here in XojoUnit that required 
		  // a workaround.
		  //
		  // But keep in mind that, while you may not use DoEvents directly,
		  // some Xojo functions may.
		  //
		  
		  Assert.Message "Starting test"
		  
		  Var targetTicks As Integer = System.Ticks + 60 // One second
		  While System.Ticks < targetTicks
		    App.DoEvents // Without the workaround introduced in 6.6, this would crash the entire app
		  Wend
		  
		  Assert.Pass "DoEvents test complete"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsFalseTest()
		  Assert.IsFalse(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNilTest()
		  Var d As DateTime
		  
		  Assert.IsNil(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNilTest()
		  Var d As New Dictionary
		  
		  Assert.IsNotNil(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrueTest()
		  Assert.IsTrue(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub MatchesStringTest()
		  Var actual As String = "12345"
		  Var pattern As String = "^\d+$"
		  
		  Assert.Matches(pattern, actual)
		  
		  actual = "abcd"
		  pattern = "^[A-Z]+$"
		  
		  Assert.Matches(pattern, actual)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotImplementedTest()
		  // Tests will only return a result if one of the Assert methods
		  // are called. This test intentionally does nothing useful to 
		  // simulate those times when a developer forgets to do this.
		  //
		  // It should report as "not implemented".
		  //
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OverriddenMethodTest()
		  Assert.Pass "This subclass method executed as intended"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PassTest()
		  Assert.Pass("Passed!")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup1Test()
		  Assert.AreEqual(1, Prop2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup2Test()
		  Assert.AreEqual(1, Prop2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestMethodWithParamTest(param As String)
		  #Pragma Unused param
		  
		  Assert.Fail "A test method with a param should have been ignored"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestTimersTest()
		  //
		  // Demonstrates the use of Test Timers
		  // 
		  
		  StartTestTimer // key is optional
		  StartTestTimer("Part1")
		  StartTestTimer("Part2")
		  StartTestTimer("Part3")
		  StartTestTimer("Unused")
		  
		  Var target As Double = System.Microseconds + 250000.0
		  While System.Microseconds < target
		    //
		    // Wait
		    //
		  Wend
		  
		  LogTestTimer("Part1", "initial")
		  LogTestTimer("Part3", "before reset")
		  StartTestTimer("Part3") // A Test Timer can be restarted at any time, even if not logged
		  
		  target = System.Microseconds + 500.0
		  While System.Microseconds < target
		    //
		    // Wait
		    //
		  Wend
		  
		  LogTestTimer("Part1", "done") // Reusing this as a way to creating a lap
		  LogTestTimer("Part2")
		  LogTestTimer("Part3", "after reset")
		  
		  //
		  // Timer "Unused" is never logged, and that's ok
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UnhandledExceptionTest()
		  //
		  // Create an exception
		  //
		  
		  Var d As Dictionary // Nil!
		  
		  #Pragma BreakOnExceptions False
		  call d.Value(1)
		  #Pragma BreakOnExceptions Default 
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private AsyncTestTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


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
