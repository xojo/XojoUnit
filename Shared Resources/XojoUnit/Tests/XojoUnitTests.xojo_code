#tag Class
Protected Class XojoUnitTests
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub AreDifferentObjectTest()
		  Dim d1 As New Date
		  Dim d2 As New Date(2001, 1, 1)
		  
		  Assert.AreDifferent(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferentStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "hello"
		  
		  // String matches with AreDifferent are case-sensitive
		  Assert.AreDifferent(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferentTextTest()
		  Dim t1 As Text = "Hello"
		  Dim t2 As Text = "hello"
		  
		  // Text matches with AreDifferent are case-sensitive
		  Assert.AreDifferent(t1, t2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualColorTest()
		  Dim c1 As Color = &c0000ff
		  Dim c2 As Color = &c0000ff
		  
		  Assert.AreEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualCurrencyTest()
		  Dim c1 As Currency = 42.38
		  Dim c2 As Currency = 40.00 + 2.38
		  
		  Assert.AreEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqualDateTest()
		  Dim d1 As New Date
		  d1.SQLDate = "2012-11-30"
		  
		  Dim d2 As New Date
		  d2.SQLDate = "2012-11-30"
		  
		  Assert.AreEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleDefaultTest()
		  Dim d1 As Double = 1.000000001
		  Dim d2 As Double = 1.000000002
		  
		  // Passes becaue the numbers are within the
		  // default tolerance of 0.00000001
		  Assert.AreEqual(d1, d2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualDoubleTest()
		  Dim d1 As Double = 1.01
		  Dim d2 As Double = 1.02
		  
		  // Passes because the numbers are within the tolerance of 0.01
		  Assert.AreEqual(d1, d2, 0.01)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualInt64Test()
		  Dim temp As UInt32 = 0
		  temp = temp - 1
		  
		  Dim i1 As Int64 = temp
		  Dim i2 As Int64 = temp
		  
		  Assert.AreEqual(i1, i2)
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
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualIntegerTest()
		  Dim i1 As Integer = 42
		  Dim i2 As Integer = 7 * 6
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualMemoryBlockTest()
		  Dim m1 As Global.MemoryBlock = "Hello"
		  Dim m2 As Global.MemoryBlock = "Hello"
		  
		  Assert.AreEqual(m1, m2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualNewDateTest()
		  Dim d1 As New Xojo.Core.Date(2013, 11, 12, Xojo.Core.TimeZone.Current)
		  
		  Dim d2 As New Xojo.Core.Date(2013, 11, 12, Xojo.Core.TimeZone.Current)
		  
		  Assert.AreEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualNewMemoryBlockTest()
		  Dim m1 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.ASCII.ConvertTextToData("Hello")
		  Dim m2 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData("Hello")
		  
		  Assert.AreEqual(m1, m2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualStringArrayTest()
		  Dim s1() As String = Array("A", "B", "C")
		  Dim s2() As String
		  s2.Append("A")
		  s2.Append("B")
		  s2.Append("C")
		  
		  Assert.AreEqual(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "hello"
		  
		  // Passes because string comparisons are case-insensitive
		  Assert.AreEqual(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualTextArrayTest()
		  Dim t1() As Text = Array("A", "B", "C")
		  Dim t2() As Text
		  t2.Append("A")
		  t2.Append("B")
		  t2.Append("C")
		  
		  Assert.AreEqual(t1, t2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqualUIntegerTest()
		  Dim i1 As UInteger = 42
		  Dim i2 As UInteger = 7 * 6
		  
		  Assert.AreEqual(i1, i2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualColorTest()
		  Dim c1 As Color = &c0000fe
		  Dim c2 As Color = &c0000ff
		  
		  Assert.AreNotEqual(c1, c2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqualDateTest()
		  Dim d1 As New Date
		  d1.SQLDate = "2012-11-29"
		  
		  Dim d2 As New Date
		  d2.SQLDate = "2012-11-30"
		  
		  Assert.AreNotEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualDoubleTest()
		  Dim d1 As Double = 1.01
		  Dim d2 As Double = 1.02
		  
		  // Passes because the numbers are not within the tolerance of 0.001
		  Assert.AreNotEqual(d1, d2, 0.001)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualMemoryBlockTest()
		  Dim m1 As Global.MemoryBlock = "hello"
		  Dim m2 As Global.MemoryBlock = "Hello"
		  
		  Assert.AreNotEqual(m1, m2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualNewDateTest()
		  Dim d1 As New Xojo.Core.Date(2013, 11, 15, Xojo.Core.TimeZone.Current)
		  
		  Dim d2 As New Xojo.Core.Date(2013, 11, 12, Xojo.Core.TimeZone.Current)
		  
		  Assert.AreNotEqual(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqualNewMemoryBlockTest()
		  Dim m1 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.ASCII.ConvertTextToData("Hello")
		  Dim m2 As Xojo.Core.MemoryBlock = Xojo.Core.TextEncoding.UTF8.ConvertTextToData("hello")
		  
		  Assert.AreNotEqual(m1, m2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameObjectTest()
		  Dim d1 As New Date
		  Dim d2 As Date
		  
		  d2 = d1
		  
		  Assert.AreSame(d1, d2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameStringArrayTest()
		  Dim s1() As String = Array("A", "B", "C")
		  Dim s2() As String
		  s2.Append("A")
		  s2.Append("B")
		  s2.Append("C")
		  
		  Assert.AreSame(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameStringTest()
		  Dim s1 As String = "Hello"
		  Dim s2 As String = "Hello"
		  
		  // String matches with AreSame are case-sensitive
		  Assert.AreSame(s1, s2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameTextArrayTest()
		  Dim t1() As Text = Array("A", "B", "C")
		  Dim t2() As Text
		  t2.Append("A")
		  t2.Append("B")
		  t2.Append("C")
		  
		  Assert.AreSame(t1, t2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSameTextTest()
		  Dim t1 As Text = "Hello"
		  Dim t2 As Text = "Hello"
		  
		  // Text matches with AreSame are case-sensitive
		  Assert.AreSame(t1, t2)
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
		Sub IsFalseTest()
		  Assert.IsFalse(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNilTest()
		  Dim d As Date
		  
		  Assert.IsNil(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNilTest()
		  Dim d As New Date
		  
		  Assert.IsNotNil(d)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrueTest()
		  Assert.IsTrue(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PassTest()
		  Assert.Pass("Passed!")
		End Sub
	#tag EndMethod


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
