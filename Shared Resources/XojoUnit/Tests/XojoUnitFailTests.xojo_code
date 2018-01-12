#tag Class
Protected Class XojoUnitFailTests
Inherits TestGroup
	#tag Event
		Sub TearDown()
		  If IsAsyncTest Then
		    PassIfFailed
		  End If
		  
		  StopTestOnFail = True
		  //
		  // Why is this here?
		  // Because this property, when set in the middle of a test
		  // should not carry over to the next test.
		  // If it does, all of the subsequent tests will truly
		  // fail.
		  //
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AreDifferentObjectTest()
		  Dim d1 As Xojo.Core.Date = Xojo.Core.Date.Now
		  Dim d2 As Xojo.Core.Date = d1
		  
		  Assert.AreDifferent(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreDifferentStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "Hello"
		  
		  // String matches with AreDifferent are case-sensitive
		  Assert.AreDifferent(s1, s2)
		  IncrementFailCountIfFail
		  
		  s1 = s1.DefineEncoding(nil)
		  s2 = s1
		  Assert.AreDifferent(s1, s2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferentTextTest()
		  Dim t1 As Text = "Hello"
		  Dim t2 As Text = "Hello"
		  
		  // Text matches with AreDifferent are case-sensitive
		  Assert.AreDifferent(t1, t2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualColorTest()
		  Dim c1 As Color = &c0000ff
		  Dim c2 As Color = &c0000aa
		  
		  Assert.AreEqual(c1, c2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualCurrencyTest()
		  Dim c1 As Currency = 42.38
		  Dim c2 As Currency = 40.00 + 2.30
		  
		  Assert.AreEqual(c1, c2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualDateTest()
		  Dim d1 As New Date
		  d1.SQLDate = "2012-11-30"
		  
		  Dim d2 As New Date
		  d2.SQLDate = "2012-11-29"
		  
		  Assert.AreEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleDefaultTest()
		  Dim d1 As Double = 1.000001
		  Dim d2 As Double = 1.000002
		  
		  // Fails becaue the numbers are outside the
		  // default tolerance of 0.00000001
		  Assert.AreEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleTest()
		  Dim d1 As Double = 1.01
		  Dim d2 As Double = 1.02
		  Assert.AreEqual(d1, d2, 0.0001)
		  
		  d1 = 1.00001
		  d2 = 1.00002
		  Assert.AreEqual(d1, d2, 0.000001)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualInt64Test()
		  Dim temp As UInt32 = 0
		  temp = temp - 1
		  
		  Dim i1 As Int64 = temp
		  Dim i2 As Int64 = temp + 1
		  
		  Assert.AreEqual(i1, i2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualIntegerArrayTest()
		  Dim i1() As Integer = Array(1, 2, 3, 4, 5)
		  Dim i2() As Integer
		  i2.Append(1)
		  i2.Append(2)
		  i2.Append(3)
		  i2.Append(4)
		  i2.Append(5)
		  i2(4) = 6
		  
		  Assert.AreEqual(i1, i2)
		  IncrementFailCountIfFail
		  
		  i2(4) = 5
		  i2.Append(6)
		  
		  Assert.AreEqual(i1, i2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualIntegerTest()
		  Dim i1 As Integer = 42
		  Dim i2 As Integer = 7 * 7
		  
		  Assert.AreEqual(i1, i2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualMemoryBlockTest()
		  Dim m1 As Global.MemoryBlock = "Hello"
		  Dim m2 As Global.MemoryBlock = "hello"
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m2 = "Hello1"
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m1 = Nil
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualNewDateTest()
		  Dim d1 As New Xojo.Core.Date(2014, 11, 12, Xojo.Core.TimeZone.Current)
		  
		  Dim d2 As New Xojo.Core.Date(2013, 11, 12, Xojo.Core.TimeZone.Current)
		  
		  Assert.AreEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  d2 = Nil
		  
		  Assert.AreEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualNewMemoryBlockTest()
		  Dim m1 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.ASCII.ConvertTextToData("Hello")
		  Dim m2 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData("hello")
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m2 = Xojo.Core.TextEncoding.ASCII.ConvertTextToData("Hello1")
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m2 = Nil
		  
		  Assert.AreEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualStringArrayTest()
		  Dim s1() As String = Array("A", "B", "C")
		  Dim s2() As String
		  s2.Append("A")
		  s2.Append("B")
		  s2.Append("D")
		  Assert.AreEqual(s1, s2)
		  IncrementFailCountIfFail
		  
		  s2(2) = "C"
		  s2.Append "D"
		  Assert.AreEqual(s1, s2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "hello1"
		  
		  Assert.AreEqual(s1, s2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualTextArrayTest()
		  Dim t1() As Text = Array("A", "B", "C")
		  Dim t2() As Text
		  t2.Append("A")
		  t2.Append("B")
		  t2.Append("D")
		  
		  Assert.AreEqual(t1, t2)
		  IncrementFailCountIfFail
		  
		  t2(2) = "C"
		  t2.Append "D"
		  
		  Assert.AreEqual(t1, t2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualUIntegerTest()
		  Dim i1 As UInteger = 42
		  Dim i2 As UInteger = 7 * 7
		  
		  Assert.AreEqual(i1, i2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualColorTest()
		  Dim c1 As Color = &c0000ff
		  Dim c2 As Color = &c0000ff
		  
		  Assert.AreNotEqual(c1, c2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqualDateTest()
		  Dim d1 As New Date
		  d1.SQLDate = "2012-11-29"
		  
		  Dim d2 As New Date
		  d2.SQLDate = "2012-11-29"
		  
		  Assert.AreNotEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  d1 = Nil
		  d2 = Nil
		  
		  Assert.AreNotEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualDoubleTest()
		  Dim d1 As Double = 1.01
		  Dim d2 As Double = 1.01
		  
		  Assert.AreNotEqual(d1, d2, 0.001)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqualMemoryBlockTest()
		  Dim m1 As Global.MemoryBlock = "Hello"
		  Dim m2 As Global.MemoryBlock = "Hello"
		  
		  Assert.AreNotEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m1 = Nil
		  m2 = Nil
		  
		  Assert.AreNotEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualNewDateTest()
		  Dim d1 As New Xojo.Core.Date(2013, 11, 15, Xojo.Core.TimeZone.Current)
		  
		  Dim d2 As New Xojo.Core.Date(2013, 11, 15, Xojo.Core.TimeZone.Current)
		  
		  Assert.AreNotEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  d1 = Nil
		  d2 = Nil
		  
		  Assert.AreNotEqual(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualNewMemoryBlockTest()
		  Dim m1 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.ASCII.ConvertTextToData("Hello")
		  Dim m2 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData("Hello")
		  
		  Assert.AreNotEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  m1 = Nil
		  m2 = Nil
		  
		  Assert.AreNotEqual(m1, m2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameObjectTest()
		  Dim d1 As Xojo.Core.Date = Xojo.Core.Date.Now
		  Dim d2 As New Xojo.Core.Dictionary
		  
		  Assert.AreSame(d1, d2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSameStringArrayTest()
		  Dim s1() As String = Array("A", "B", "C")
		  Dim s2() As String
		  s2.Append("A")
		  s2.Append("B")
		  s2.Append("D")
		  Assert.AreSame(s1, s2)
		  IncrementFailCountIfFail
		  
		  s2(2) = "C"
		  s2.Append "D"
		  Assert.AreSame(s1, s2)
		  IncrementFailCountIfFail
		  
		  s2 = Array("A", "B", "c")
		  Assert.AreSame(s1, s2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSameStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "hello"
		  
		  // String matches with AreSame are case-sensitive
		  Assert.AreSame(s1, s2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameTextArrayTest()
		  Dim t1() As Text = Array("A", "B", "C")
		  Dim t2() As Text
		  t2.Append("A")
		  t2.Append("B")
		  t2.Append("D")
		  
		  Assert.AreSame(t1, t2)
		  IncrementFailCountIfFail
		  
		  t2(2) = "c"
		  
		  Assert.AreSame(t1, t2)
		  IncrementFailCountIfFail
		  
		  t2(2) = "C"
		  t2.Append "D"
		  
		  Assert.AreSame(t1, t2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameTextTest()
		  Dim t1 As Text = "Hello"
		  Dim t2 As Text = "hello"
		  
		  // Text matches with AreSame are case-sensitive
		  Assert.AreSame(t1, t2)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AsyncTest()
		  IsAsyncTest = True
		  AsyncAwait 1
		  Assert.Fail "No async method started"
		  IncrementFailCountIfFail
		  
		  //
		  // TearDown will finish this up
		  //
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DoesNotMatchStringTest()
		  Dim actual As String = "12345"
		  Dim pattern As String = "^\d+$"
		  
		  Assert.DoesNotMatch(pattern, actual)
		  IncrementFailCountIfFail
		  
		  actual = "abcd"
		  pattern = "^[A-Z]+$"
		  
		  Assert.DoesNotMatch(pattern, actual)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FailTest()
		  Assert.Fail("Failed!")
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub IncrementFailCountIfFail()
		  If Assert.Failed Then
		    FailCount = FailCount + 1
		  End If
		  ExpectedFailCount = ExpectedFailCount + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsFalseTest()
		  Assert.IsFalse(True)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNilTest()
		  Dim d As New Dictionary
		  
		  Assert.IsNil(d)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNilTest()
		  Dim d As Xojo.Core.Dictionary
		  
		  Assert.IsNotNil(d)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrueTest()
		  Assert.IsTrue(False)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub MatchesStringTest()
		  Dim actual As String = "1234a"
		  Dim pattern As String = "^\d+$"
		  
		  Assert.Matches(pattern, actual)
		  IncrementFailCountIfFail
		  
		  actual = "abcd"
		  pattern = "^(?-i)[A-Z]+$"
		  
		  Assert.Matches(pattern, actual)
		  IncrementFailCountIfFail
		  
		  PassIfFailed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PassIfFailed()
		  If FailCount = ExpectedFailCount Then
		    Assert.Group.CurrentTestResult.Result = TestResult.Passed
		    If FailCount = 1 Then
		      Assert.Pass("One test has failed, as expected")
		    Else
		      Assert.Pass(FailCount.ToText + " tests have failed, as expected")
		    End If
		  Else
		    If ExpectedFailCount = 1 Then
		      Assert.Fail("Expected one failure, but had " + FailCount.ToText)
		    Else
		      Assert.Fail("Expected " + ExpectedFailCount.ToText + " failures, but had " + FailCount.ToText)
		    End If
		  End If
		  
		  //
		  // Reset the counters
		  //
		  FailCount = 0
		  ExpectedFailCount = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WillTrulyFailTest()
		  Assert.Fail("Yup it failed", "We expect this to fail")
		  
		  StopTestOnFail = True
		  
		  Assert.AreEqual(3, 4, "Another test that should fail")
		  
		  //
		  // StopTestOnFail should prevent us from ever getting to this point
		  //
		  Break
		  Assert.Fail("This should not have happened, so StopTestOnFail did not work!")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ExpectedFailCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FailCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsAsyncTest As Boolean
	#tag EndProperty


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
			Name="StopTestOnFail"
			Group="Behavior"
			Type="Boolean"
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
