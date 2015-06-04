#tag Class
Protected Class Assert
	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Object, actual As Object, message As Text = "")
		  If Not (expected Is actual) Then
		    Pass(message)
		  Else
		    Fail("Objects are the same", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreDifferent(expected As String, actual As String, message As Text = "")
		  If StrComp(expected, actual, 0) <> 0 Then
		    Pass(message)
		  Else
		    Fail("String '" + actual.ToText + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Text, actual As Text, message As Text = "")
		  If expected.Compare(actual, Text.CompareCaseSensitive) <> 0 Then
		    Pass(message)
		  Else
		    Fail("Text '" + actual + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Color, actual As Color, message As Text = "")
		  Dim expectedColor, actualColor As Text
		  
		  If expected = actual Then
		    Pass(message)
		  Else
		    expectedColor = "RGB(" + expected.Red.ToText + ", " + expected.Green.ToText + ", " + expected.Blue.ToText + ")"
		    actualColor = "RGB(" + actual.Red.ToText + ", " + actual.Green.ToText + ", " + actual.Blue.ToText + ")"
		    Fail(FailEqualMessage(expectedColor, actualColor), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Currency, actual As Currency, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Date, actual As Date, message As String = "")
		  If  expected Is actual Or expected.TotalSeconds = actual.TotalSeconds Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ShortDate + " " + expected.LongTime, actual.ShortDate + " " + actual.LongTime), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Double, actual() As Double, message As Text = "")
		  Dim expectedSize, actualSize As Double
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Integer array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i).ToText + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i).ToText + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, tolerance As Double, message As Text = "")
		  Dim diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff <= (Abs(tolerance) + 0.00000001) Then
		    Pass(message)
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToText(Xojo.Core.Locale.Current, "-#########.##########"), actual.ToText(Xojo.Core.Locale.Current, "-#########.##########")), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, message As Text = "")
		  Dim tolerance As Double = 0.00000001
		  
		  AreEqual(expected, actual, tolerance, message)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As String = "")
		  If expected IsA Global.MemoryBlock And expected Is actual Then
		    Pass(message)
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		  End If
		  
		  Dim sExpected As String = expected.StringValue(0, expectedSize)
		  Dim sActual As String = actual.StringValue(0, actualSize)
		  
		  If StrComp(sExpected, sActual, 0) = 0 Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(EncodeHex(sExpected, True).ToText, EncodeHex(sActual, True).ToText), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int16, actual As Int16, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int32, actual As Int32, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int64, actual As Int64, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int8, actual As Int8, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Integer, actual() As Integer, message As Text = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Integer array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i).ToText + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i).ToText + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected() As String, actual() As String, message As Text = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected String array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i).ToText + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i).ToText + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As String, actual As String, message As Text = "")
		  // This is a case-insensitive comparison
		  
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Text, actual() As Text, message As Text = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i).Compare(actual(i)) <> 0 Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Text, actual As Text, message As Text = "")
		  // This is a case-insensitive comparison
		  
		  If expected.Compare(actual) = 0 Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As String = "")
		  If expected IsA Xojo.Core.MemoryBlock And expected Is actual Then
		    Pass(message)
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + Str(expectedSize) + _
		    "] but was [" + Str(actualSize) + "].", _
		    message)
		  End If
		  
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(EncodeHexNewMB(expected), EncodeHexNewMB(actual)), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt32, actual As UInt32, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt64, actual As UInt64, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt8, actual As UInt8, message As Text = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt8, actual As UInt8, message As String = "")
		  If expected = actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Color, actual As Color, message As Text = "")
		  Dim expectedColor, actualColor As Text
		  
		  If expected <> actual Then
		    Pass(message)
		  Else
		    expectedColor = "RGB(" + expected.Red.ToText + ", " + expected.Green.ToText + ", " + expected.Blue.ToText + ")"
		    actualColor = "RGB(" + actual.Red.ToText + ", " + actual.Green.ToText + ", " + actual.Blue.ToText + ")"
		    Fail(FailEqualMessage(expectedColor, actualColor), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Currency, actual As Currency, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Date, actual As Date, message As String = "")
		  //NCM-written
		  If Not (expected Is actual) And expected.TotalSeconds <> actual.TotalSeconds Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected.TotalSeconds), Str(actual.TotalSeconds)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Double, actual As Double, tolerance As Double, message As Text = "")
		  Dim diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff > (Abs(tolerance) + 0.00000001) Then
		    Pass(message)
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToText(Xojo.Core.Locale.Current, "-#########.##########"), actual.ToText(Xojo.Core.Locale.Current, "-#########.##########")), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Double, actual As Double, message As Text = "")
		  Dim tolerance As Double = 0.00000001
		  
		  AreNotEqual(expected, actual, tolerance, message)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As String = "")
		  If expected IsA Global.MemoryBlock And expected Is actual Then
		    Fail("The MemoryBlocks are the same", message)
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Pass(message)
		  End If
		  
		  Dim sExpected As String = expected.StringValue(0, expectedSize)
		  dim sActual As String = actual.StringValue(0, actualSize)
		  
		  If StrComp(sExpected, sActual, 0) <> 0 Then
		    Pass(message)
		  Else
		    Fail("The MemoryBlock is the same: " + EncodeHex(sExpected, True).ToText, message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int16, actual As Int16, message As Text = "")
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int32, actual As Int32, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int64, actual As Int64, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int8, actual As Int8, message As Text = "")
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqual(expected As String, actual As String, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail("Text '" + actual.ToText + "' is equal to '" + expected.ToText + "'", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Text, actual As Text, message As Text = "")
		  If expected.Compare(actual) <> 0 Then
		    Pass(message)
		  Else
		    Fail("Text '" + actual + "' is equal to '" + expected + "'", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreNotEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As String = "")
		  If expected IsA Xojo.Core.MemoryBlock And expected Is actual Then
		    Fail("The MemoryBlocks are the same", message)
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Pass(message)
		  End If
		  
		  Dim lastByteIndex As Integer = actualSize - 1
		  For byteIndex As Integer = 0 To lastByteIndex
		    If expected.Data.Byte(byteIndex) <> actual.Data.Byte(byteIndex) Then
		      Pass(message)
		      Return
		    End If
		  Next byteIndex
		  
		  //
		  // If we get here, it's the same
		  //
		  Fail("The MemoryBlock is the same: " + EncodeHexNewMB(expected), message )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt32, actual As UInt32, message As Text = "")
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt32, actual As UInt32, message As String = "")
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt64, actual As UInt64, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt8, actual As UInt8, message As String = "")
		  If expected <> actual Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(Str(expected), Str(actual)), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As Object, actual As Object, message As Text = "")
		  If expected Is actual Then
		    Pass(message)
		  Else
		    Fail("Objects are not the same", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSame(expected() As String, actual() As String, message As Text = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If StrComp(expected(i), actual(i), 0) <> 0 Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i).ToText + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i).ToText + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSame(expected As String, actual As String, message As Text = "")
		  If StrComp(expected, actual, 0) = 0 Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected() As Text, actual() As Text, message As Text = "")
		  Dim expectedSize, actualSize As Integer
		  
		  expectedSize = UBound(expected)
		  actualSize = UBound(actual)
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i).Compare(actual(i), Text.CompareCaseSensitive) <> 0 Then
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToText + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass(message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As Text, actual As Text, message As Text = "")
		  If expected.Compare(actual, Text.CompareCaseSensitive) = 0 Then
		    Pass(message)
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  Group = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeHexNewMB(mb As Xojo.Core.MemoryBlock) As Text
		  Dim r() As Text
		  
		  Dim lastByteIndex As Integer = mb.Size - 1
		  For byteIndex As Integer = 0 To lastByteIndex
		    r.Append mb.Data.Byte(byteIndex).ToHex
		  Next
		  
		  Return Text.Join(r, " " )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Fail(failMessage As Text, message As Text = "")
		  Failed = True
		  Group.CurrentTestResult.Result = TestResult.Failed
		  
		  If Group.CurrentTestResult.Message = "" Then
		    Group.CurrentTestResult.Message = message + ": " + failMessage
		  Else
		    Group.CurrentTestResult.Message = Group.CurrentTestResult.Message + &u0A + message + ": " + failMessage
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FailEqualMessage(expected As Text, actual As Text) As Text
		  Dim message As Text
		  
		  message = "Expected [" + expected + "] but was [" + actual + "]."
		  
		  Return message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsFalse(condition As Boolean, message As Text = "")
		  If condition Then
		    Fail("[false] expected, but was [true].", message)
		  Else
		    Pass(message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNil(anObject As Object, message As Text = "")
		  If anObject = Nil Then
		    Pass(message)
		  Else
		    Fail("Object was expected to be [nil], but was not.", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNil(anObject As Object, message As Text = "")
		  If anObject <> Nil Then
		    Pass(message)
		  Else
		    Fail("Expected value not to be [nil], but was [nil].", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrue(condition As Boolean, message As Text = "")
		  If condition Then
		    Pass(message)
		  Else
		    Fail("[true] expected, but was [false].", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Message(msg As Text)
		  If Group.CurrentTestResult.Message = "" Then
		    Group.CurrentTestResult.Message = msg
		  Else
		    Group.CurrentTestResult.Message = Group.CurrentTestResult.Message + &u0A + msg
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pass(message As Text = "")
		  Failed = False
		  If Group.CurrentTestResult.Result <> TestResult.Failed Then
		    Group.CurrentTestResult.Result = TestResult.Passed
		    Group.CurrentTestResult.Message = message
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Failed As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mGroupWeakRef Is Nil Then
			    Return Nil
			  Else
			    Return TestGroup(mGroupWeakRef.Value)
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGroupWeakRef = New WeakRef(value)
			End Set
		#tag EndSetter
		Group As TestGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGroupWeakRef As WeakRef
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Failed"
			Group="Behavior"
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
