#tag Class
Protected Class Assert
	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Object, actual As Object, message As String = "")
		  If Not (expected Is actual) Then
		    Pass()
		  Else
		    Fail("Objects are the same", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferent(expected As String, actual As String, message As String = "")
		  If expected.Encoding <> actual.Encoding Or expected.Compare(actual, ComparisonOptions.CaseSensitive) <> 0 Then
		    Pass()
		  Else
		    Fail("String '" + actual + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated )  Sub AreDifferent(expected As Text, actual As Text, message As String = "")
		  If expected.Compare(actual, Text.CompareCaseSensitive) <> 0 Then
		    Pass()
		  Else
		    Fail("Text '" + actual + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Color, actual As Color, message As String = "")
		  Var expectedColor, actualColor As String
		  
		  If expected = actual Then
		    Pass()
		  Else
		    expectedColor = "RGB(" + expected.Red.ToString + ", " + expected.Green.ToString + ", " + expected.Blue.ToString + ")"
		    actualColor = "RGB(" + actual.Red.ToString + ", " + actual.Green.ToString + ", " + actual.Blue.ToString + ")"
		    Fail(FailEqualMessage(expectedColor, actualColor), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Currency, actual As Currency, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreEqual(expected As DateTime, actual As DateTime, message As String = "")
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given Date is Nil", message)
		  ElseIf expected Is actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.SQLDateTime , actual.SQLDateTime), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Double, actual() As Double, message As String = "")
		  Var expectedSize, actualSize As Double
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Integer array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i).ToString + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i).ToString + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, tolerance As Double, message As String = "")
		  Var diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff <= (Abs(tolerance) + 0.00000001) Then
		    Pass()
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToString(Locale.Current, "#########.##########"), actual.ToString(Locale.Current, "#########.##########")), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, message As String = "")
		  Var tolerance As Double = 0.00000001
		  
		  AreEqual(expected, actual, tolerance, message)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Attributes( Deprecated )  Sub AreEqual(expected As Global.Date, actual As Global.Date, message As String = "")
		  If expected Is actual Or expected.TotalSeconds = actual.TotalSeconds Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ShortDate + " " + expected.LongTime, actual.ShortDate + " " + actual.LongTime), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As String = "")
		  If expected = actual Then
		    Pass()
		    Return
		  End If
		  
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given MemoryBlock is Nil", message)
		    Return
		  End If
		  
		  Var expectedSize As Integer = expected.Size
		  Var actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  Var sExpected As String = expected.StringValue(0, expectedSize)
		  Var sActual As String = actual.StringValue(0, actualSize)
		  
		  If sExpected.Compare(sActual, ComparisonOptions.CaseSensitive) = 0 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(EncodeHex(sExpected, True), EncodeHex(sActual, True)), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int16, actual As Int16, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int32, actual As Int32, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int64, actual As Int64, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int8, actual As Int8, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Integer, actual() As Integer, message As String = "")
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Integer array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i).ToString + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i).ToString + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected() As String, actual() As String, message As String = "")
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected String array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i) <> actual(i) Then
		      Fail( FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As String, actual As String, message As String = "")
		  // This is a case-insensitive comparison
		  
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected() As Text, actual() As Text, message As String = "")
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i).Compare(actual(i)) <> 0 Then
		      Fail( FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated )  Sub AreEqual(expected As Text, actual As Text, message As String = "")
		  // This is a case-insensitive comparison
		  
		  If expected.Compare(actual) = 0 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt16, actual As UInt16, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt32, actual As UInt32, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt64, actual As UInt64, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt8, actual As UInt8, message As String = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Attributes( Deprecated )  Sub AreEqual(expected As Xojo.Core.Date, actual As Xojo.Core.Date, message As String = "")
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given Date is Nil", message)
		  ElseIf expected Is actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText , actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Attributes( Deprecated )  Sub AreEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As String = "")
		  If expected = actual Then
		    Pass()
		    Return
		  End If
		  
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given MemoryBlock is Nil", message)
		    Return
		  End If
		  
		  Var expectedSize As Integer = expected.Size
		  Var actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		  Else
		    Fail(FailEqualMessage(EncodeHexNewMB(expected), EncodeHexNewMB(actual)), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Color, actual As Color, message As String = "")
		  Var expectedColor, actualColor As String
		  
		  If expected <> actual Then
		    Pass()
		  Else
		    expectedColor = "RGB(" + expected.Red.ToString + ", " + expected.Green.ToString + ", " + expected.Blue.ToString + ")"
		    actualColor = "RGB(" + actual.Red.ToString + ", " + actual.Green.ToString + ", " + actual.Blue.ToString + ")"
		    Fail(FailEqualMessage(expectedColor, actualColor), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Currency, actual As Currency, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreNotEqual(expected As DateTime, actual As DateTime, message As String = "")
		  If expected Is Nil Xor actual Is Nil Then
		    Pass()
		  ElseIf expected Is Nil And actual Is Nil Then
		    Fail("Both Dates are Nil", message)
		  ElseIf expected = actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970 Then
		    Fail("Both Dates are the same", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Double, actual As Double, tolerance As Double, message As String = "")
		  Var diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff > (Abs(tolerance) + 0.00000001) Then
		    Pass()
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToString(Locale.Current, "#########.##########"), actual.ToString(Locale.Current, "#########.##########")), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Double, actual As Double, message As String = "")
		  Var tolerance As Double = 0.00000001
		  
		  AreNotEqual(expected, actual, tolerance, message)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Attributes( Deprecated )  Sub AreNotEqual(expected As Global.Date, actual As Global.Date, message As String = "")
		  //NCM-written
		  If expected Is Nil Xor actual Is Nil Then
		    Pass()
		  ElseIf expected Is Nil And actual Is Nil Then
		    Fail("Both Dates are Nil", message)
		  ElseIf expected = actual Or expected.TotalSeconds = actual.TotalSeconds Then
		    Fail("Both Dates are the same", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As String = "")
		  If expected = actual Then
		    Fail("The MemoryBlocks are the same", message)
		    
		  ElseIf expected Is Nil Xor actual Is Nil Then
		    Pass()
		    
		  Else
		    Var expectedSize As Integer = expected.Size
		    Var actualSize As Integer = actual.Size
		    
		    If expectedSize <> actualSize Then
		      Pass()
		      
		    Else
		      
		      Var sExpected As String = expected.StringValue(0, expectedSize)
		      Var sActual As String = actual.StringValue(0, actualSize)
		      
		      If sExpected.Compare(sActual, ComparisonOptions.CaseSensitive) <> 0 Then
		        Pass()
		      Else
		        Fail("The MemoryBlock is the same: " + EncodeHex(sExpected, True), message )
		      End If
		      
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int16, actual As Int16, message As String = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int32, actual As Int32, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int64, actual As Int64, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int8, actual As Int8, message As String = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqual(expected As String, actual As String, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail("The Strings '" + actual + " are equal but shouldn't be", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated )  Sub AreNotEqual(expected As Text, actual As Text, message As String = "")
		  If expected.Compare(actual) <> 0 Then
		    Pass()
		  Else
		    Fail("The Texts '" + actual + "' are equal but shouldn't be", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt16, actual As UInt16, message As String = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt32, actual As UInt32, message As String = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt64, actual As UInt64, message As String = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt8, actual As UInt8, message As String = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToString, actual.ToString), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Attributes( Deprecated )  Sub AreNotEqual(expected As Xojo.Core.Date, actual As Xojo.Core.Date, message As String = "")
		  If expected Is Nil Xor actual Is Nil Then
		    Pass()
		  ElseIf expected Is Nil And actual Is Nil Then
		    Fail("Both Dates are Nil", message)
		  ElseIf expected = actual Or expected.SecondsFrom1970 = actual.SecondsFrom1970 Then
		    Fail("Both Dates are the same", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Attributes( Deprecated )  Sub AreNotEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As String = "")
		  If expected Is Nil And actual Is Nil Then
		    Fail("The given MemoryBlocks are both Nil", message)
		  ElseIf expected Is Nil Xor actual Is Nil Then
		    Pass()
		  ElseIf expected = actual Then
		    Fail("The MemoryBlocks are the same: " + EncodeHexNewMB(expected), message)
		  Else
		    Pass()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As Object, actual As Object, message As String = "")
		  If expected Is actual Then
		    Pass()
		  Else
		    Fail("Objects are not the same", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected() As String, actual() As String, message As String = "")
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i).Compare(actual(i), ComparisonOptions.CaseSensitive) <> 0 Then
		      Fail(FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    ElseIf expected(i).Encoding <> actual(i).Encoding Then
		      Fail("The text encoding of item " + i.ToString + " ('" + expected(i) + "') differs", message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As String, actual As String, message As String = "")
		  If expected.Compare(actual, ComparisonOptions.CaseSensitive) = 0 Then
		    If expected.Encoding <> actual.Encoding Then
		      Fail("The bytes match but the text encoding does not", message)
		    Else
		      Pass()
		    End If
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated )  Sub AreSame(expected() As Text, actual() As Text, message As String = "")
		  Var expectedSize, actualSize As Integer
		  
		  expectedSize = expected.LastIndex
		  actualSize = actual.LastIndex
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected Text array Ubound [" + expectedSize.ToString + _
		    "] but was [" + actualSize.ToString + "].", _
		    message)
		    Return
		  End If
		  
		  For i As Integer = 0 To expectedSize
		    If expected(i).Compare(actual(i), Text.CompareCaseSensitive) <> 0 Then
		      Fail( FailEqualMessage("Array(" + i.ToString + ") = '" + expected(i) + "'", _
		      "Array(" + i.ToString + ") = '" + actual(i) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( Deprecated )  Sub AreSame(expected As Text, actual As Text, message As String = "")
		  If expected.Compare(actual, Text.CompareCaseSensitive) = 0 Then
		    Pass()
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

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub DoesNotMatch(regExPattern As String, actual As String, message As String = "")
		  If regExPattern = "" Then
		    Var err As New RegExException
		    err.Reason = "No pattern was specified"
		    Raise err
		  End If
		  
		  Var rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If rx.Search(actual) Is Nil Then
		    Pass()
		  Else
		    Fail("[" + actual + "]  matches the pattern /" + regExPattern + "/", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function EncodeHexNewMB(mb As Xojo.Core.MemoryBlock) As String
		  Var r() As String
		  
		  Var lastByteIndex As Integer = mb.Size - 1
		  For byteIndex As Integer = 0 To lastByteIndex
		    r.Add mb.Data.Byte(byteIndex).ToHex
		  Next
		  
		  Return String.FromArray(r, " " )
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Fail(failMessage As String, message As String = "")
		  Failed = True
		  Group.CurrentTestResult.Result = TestResult.Failed
		  
		  Message(message + ": " + failMessage)
		  
		  If Group.StopTestOnFail Then
		    #Pragma BreakOnExceptions False
		    Raise New XojoUnitTestFailedException
		    #Pragma BreakOnExceptions Default
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FailEqualMessage(expected As String, actual As String) As String
		  Var message As String
		  
		  message = "Expected [" + expected + "] but was [" + actual + "]."
		  
		  Return message
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsFalse(condition As Boolean, message As String = "")
		  If condition Then
		    Fail("[false] expected, but was [true].", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNil(anObject As Object, message As String = "")
		  If anObject = Nil Then
		    Pass()
		  Else
		    Fail("Object was expected to be [nil], but was not.", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNil(anObject As Object, message As String = "")
		  If anObject <> Nil Then
		    Pass()
		  Else
		    Fail("Expected value not to be [nil], but was [nil].", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrue(condition As Boolean, message As String = "")
		  If condition Then
		    Pass()
		  Else
		    Fail("[true] expected, but was [false].", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Matches(regExPattern As String, actual As String, message As String = "")
		  If regExPattern = "" Then
		    Var err As New RegExException
		    err.Reason = "No pattern was specified"
		    Raise err
		  End If
		  
		  Var rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If rx.Search(actual) Is Nil Then
		    Fail("[" + actual + "]  does not match the pattern /" + regExPattern + "/", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Message(msg As String)
		  msg = msg.Trim
		  If msg.IsEmpty Then
		    Return
		  End If
		  
		  If Group.CurrentTestResult.Message.IsEmpty Then
		    Group.CurrentTestResult.Message = msg
		  Else
		    Group.CurrentTestResult.Message = Group.CurrentTestResult.Message + &u0A + msg
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pass(message As String = "")
		  Failed = False
		  If Group.CurrentTestResult.Result <> TestResult.Failed Then
		    Group.CurrentTestResult.Result = TestResult.Passed
		    Message(message)
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
			  If value Is Nil Then
			    mGroupWeakRef = Nil
			  Else
			    mGroupWeakRef = new WeakRef(value)
			  End If
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
			Visible=false
			Group="Behavior"
			InitialValue=""
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
