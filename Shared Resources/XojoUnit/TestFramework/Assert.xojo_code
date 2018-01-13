#tag Class
Protected Class Assert
	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Object, actual As Object, message As Text = "")
		  If Not (expected Is actual) Then
		    Pass()
		  Else
		    Fail("Objects are the same", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreDifferent(expected As String, actual As String, message As Text = "")
		  If expected.Encoding <> actual.Encoding Or StrComp(expected, actual, 0) <> 0 Then
		    Pass()
		  Else
		    Fail("String '" + StringToText(actual) + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreDifferent(expected As Text, actual As Text, message As Text = "")
		  If expected.Compare(actual, Text.CompareCaseSensitive) <> 0 Then
		    Pass()
		  Else
		    Fail("Text '" + actual + "' is the same", message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Color, actual As Color, message As Text = "")
		  Dim expectedColor, actualColor As Text
		  
		  If expected = actual Then
		    Pass()
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
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
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
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Double, actual As Double, tolerance As Double, message As Text = "")
		  Dim diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff <= (Abs(tolerance) + 0.00000001) Then
		    Pass()
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToText(Xojo.Core.Locale.Current, "#########.##########"), actual.ToText(Xojo.Core.Locale.Current, "#########.##########")), message)
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
		Sub AreEqual(expected As Global.Date, actual As Global.Date, message As Text = "")
		  If  expected Is actual Or expected.TotalSeconds = actual.TotalSeconds Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ShortDate.ToText + " " + expected.LongTime.ToText, actual.ShortDate.ToText + " " + actual.LongTime.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As Text = "")
		  If expected = actual Then
		    Pass()
		    Return
		  End If
		  
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given MemoryBlock is Nil", message)
		    Return
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		    Return
		  End If
		  
		  Dim sExpected As String = expected.StringValue(0, expectedSize)
		  Dim sActual As String = actual.StringValue(0, actualSize)
		  
		  If StrComp(sExpected, sActual, 0) = 0 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(EncodeHex(sExpected, True).ToText, EncodeHex(sActual, True).ToText), message )
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int16, actual As Int16, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int32, actual As Int32, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int64, actual As Int64, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Int8, actual As Int8, message As Text = "")
		  If expected = actual Then
		    Pass()
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
		  
		  Pass()
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
		      Fail( FailEqualMessage("Array(" + i.ToText + ") = '" + StringToText(expected(i)) + "'", _
		      "Array(" + i.ToText + ") = '" + StringToText(actual(i)) + "'"), _
		      message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreEqual(expected As String, actual As String, message As Text = "")
		  // This is a case-insensitive comparison
		  
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(StringToText(expected), StringToText(actual)), message )
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
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As Text, actual As Text, message As Text = "")
		  // This is a case-insensitive comparison
		  
		  If expected.Compare(actual) = 0 Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected, actual), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt16, actual As UInt16, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt32, actual As UInt32, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt64, actual As UInt64, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreEqual(expected As UInt8, actual As UInt8, message As Text = "")
		  If expected = actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreEqual(expected As Xojo.Core.Date, actual As Xojo.Core.Date, message As Text = "")
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
		Sub AreEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As Text = "")
		  If expected = actual Then
		    Pass()
		    Return
		  End If
		  
		  If expected Is Nil Xor actual Is Nil Then
		    Fail("One given MemoryBlock is Nil", message)
		    Return
		  End If
		  
		  Dim expectedSize As Integer = expected.Size
		  Dim actualSize As Integer = actual.Size
		  
		  If expectedSize <> actualSize Then
		    Fail( "Expected MemoryBlock Size [" + expectedSize.ToText + _
		    "] but was [" + actualSize.ToText + "].", _
		    message)
		  Else
		    Fail(FailEqualMessage(EncodeHexNewMB(expected), EncodeHexNewMB(actual)), message )
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Color, actual As Color, message As Text = "")
		  Dim expectedColor, actualColor As Text
		  
		  If expected <> actual Then
		    Pass()
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
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Double, actual As Double, tolerance As Double, message As Text = "")
		  Dim diff As Double
		  
		  diff = Abs(expected - actual)
		  If diff > (Abs(tolerance) + 0.00000001) Then
		    Pass()
		  Else
		    'Fail(FailEqualMessage(Format(expected, "-#########.##########"), Format(actual, "-#########.##########")), message)
		    Fail(FailEqualMessage(expected.ToText(Xojo.Core.Locale.Current, "#########.##########"), actual.ToText(Xojo.Core.Locale.Current, "#########.##########")), message)
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
		Sub AreNotEqual(expected As Global.Date, actual As Global.Date, message As Text = "")
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
		Sub AreNotEqual(expected As Global.MemoryBlock, actual As Global.MemoryBlock, message As Text = "")
		  If expected = actual Then
		    Fail("The MemoryBlocks are the same", message)
		    
		  ElseIf expected Is Nil Xor actual Is Nil Then
		    Pass()
		    
		  Else
		    Dim expectedSize As Integer = expected.Size
		    Dim actualSize As Integer = actual.Size
		    
		    If expectedSize <> actualSize Then
		      Pass()
		      
		    Else
		      
		      Dim sExpected As String = expected.StringValue(0, expectedSize)
		      dim sActual As String = actual.StringValue(0, actualSize)
		      
		      If StrComp(sExpected, sActual, 0) <> 0 Then
		        Pass()
		      Else
		        Fail("The MemoryBlock is the same: " + EncodeHex(sExpected, True).ToText, message )
		      End If
		      
		    End If
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int16, actual As Int16, message As Text = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int32, actual As Int32, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int64, actual As Int64, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Int8, actual As Int8, message As Text = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreNotEqual(expected As String, actual As String, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail("The Strings '" + StringToText(actual) + " are equal but shouldn't be", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As Text, actual As Text, message As Text = "")
		  If expected.Compare(actual) <> 0 Then
		    Pass()
		  Else
		    Fail("The Texts '" + actual + "' are equal but shouldn't be", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt16, actual As UInt16, message As Text = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt32, actual As UInt32, message As Text = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt64, actual As UInt64, message As Text = "")
		  //NCM-written
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreNotEqual(expected As UInt8, actual As UInt8, message As Text = "")
		  If expected <> actual Then
		    Pass()
		  Else
		    Fail(FailEqualMessage(expected.ToText, actual.ToText), message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI) or  (TargetIOS)
		Sub AreNotEqual(expected As Xojo.Core.Date, actual As Xojo.Core.Date, message As Text = "")
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
		Sub AreNotEqual(expected As Xojo.Core.MemoryBlock, actual As Xojo.Core.MemoryBlock, message As Text = "")
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
		Sub AreSame(expected As Object, actual As Object, message As Text = "")
		  If expected Is actual Then
		    Pass()
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
		      Fail(FailEqualMessage("Array(" + i.ToText + ") = '" + StringToText(expected(i)) + "'", _
		      "Array(" + i.ToText + ") = '" + StringToText(actual(i)) + "'"), _
		      message)
		      Return
		    ElseIf expected(i).Encoding <> actual(i).Encoding Then
		      Fail("The text encoding of item " + i.ToText + " ('" + StringToText(expected(i)) + "') differs", message)
		      Return
		    End If
		  Next
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Sub AreSame(expected As String, actual As String, message As Text = "")
		  If StrComp(expected, actual, 0) = 0 Then
		    If expected.Encoding <> actual.Encoding Then
		      Fail("The bytes match but the text encoding does not", message)
		    Else
		      Pass()
		    End If
		  Else
		    Fail(FailEqualMessage(StringToText(expected), StringToText(actual)), message )
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
		  
		  Pass()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AreSame(expected As Text, actual As Text, message As Text = "")
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
		Sub DoesNotMatch(regExPattern As String, actual As String, message As Text = "")
		  If regExPattern = "" Then
		    Dim err As New RegExException
		    err.Reason = "No pattern was specified"
		    Raise err
		  End If
		  
		  Dim rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If rx.Search(actual) Is Nil Then
		    Pass()
		  Else
		    Fail("[" + StringToText(actual) + "]  matches the pattern /" + StringToText(regExPattern) + "/", message)
		  End If
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
		  
		  Message(message + ": " + failMessage)
		  
		  If Group.StopTestOnFail Then
		    #Pragma BreakOnExceptions False
		    Raise New XojoUnitTestFailedException
		    #Pragma BreakOnExceptions Default
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
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNil(anObject As Object, message As Text = "")
		  If anObject = Nil Then
		    Pass()
		  Else
		    Fail("Object was expected to be [nil], but was not.", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNotNil(anObject As Object, message As Text = "")
		  If anObject <> Nil Then
		    Pass()
		  Else
		    Fail("Expected value not to be [nil], but was [nil].", message)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsTrue(condition As Boolean, message As Text = "")
		  If condition Then
		    Pass()
		  Else
		    Fail("[true] expected, but was [false].", message)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetConsole and (Target32Bit or Target64Bit)) or  (TargetWeb and (Target32Bit or Target64Bit)) or  (TargetDesktop and (Target32Bit or Target64Bit))
		Sub Matches(regExPattern As String, actual As String, message As Text = "")
		  If regExPattern = "" Then
		    Dim err As New RegExException
		    err.Reason = "No pattern was specified"
		    Raise err
		  End If
		  
		  Dim rx As New RegEx
		  rx.SearchPattern = regExPattern
		  
		  If rx.Search(actual) Is Nil Then
		    Fail("[" + StringToText(actual) + "]  does not match the pattern /" + StringToText(regExPattern) + "/", message)
		  Else
		    Pass()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Message(msg As Text)
		  msg = msg.Trim
		  If msg.Empty Then
		    Return
		  End If
		  
		  If Group.CurrentTestResult.Message.Empty Then
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
		    Message(message)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (not TargetHasGUI and not TargetWeb and not TargetIOS) or  (TargetWeb) or  (TargetHasGUI)
		Private Function StringToText(s As String) As Text
		  // Before a String can be converted to Text, it must have a valid encoding
		  // to avoid an exception. If the encoding is not valid, we will hex-encode the string instead.
		  
		  If s.Encoding Is Nil Or Not s.Encoding.IsValidData(s) Then
		    s = EncodeHex(s, True)
		    s = s.DefineEncoding(Encodings.UTF8) // Just to make sure
		  End If
		  
		  Return s.ToText
		  
		End Function
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
			    mGroupWeakRef = Xojo.Core.WeakRef.Create(value)
			  End If
			End Set
		#tag EndSetter
		Group As TestGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGroupWeakRef As Xojo.Core.WeakRef
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
