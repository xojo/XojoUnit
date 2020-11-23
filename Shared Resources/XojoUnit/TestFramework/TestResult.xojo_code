#tag Class
Protected Class TestResult
	#tag Method, Flags = &h0
		Shared Function toCliString(tr As TestResult) As String
		  Var TotalTestResult As String 
		  
		  TotalTestResult =  TotalTestResult + "     name=""" + tr.TestName + """ time=""" + tr.Duration.ToText + _
		  """ duration= """ + tr.Duration.ToText + """" + EndOfLine // "time" is right, but "duration" is maintained for backwards compatibility
		  
		  If tr.Result = TestResult.Skipped Then
		    TotalTestResult =  TotalTestResult +  "       <skipped />" + EndOfLine
		    
		  ElseIf tr.Result = TestResult.NotImplemented Then
		    TotalTestResult =  TotalTestResult +  "       <not_implemented />" + EndOfLine
		    
		  ElseIf tr.Result = TestResult.Failed Then
		    Dim failMessage As Text = tr.Message
		    failMessage = failMessage.ReplaceAll("<", "&lt;")
		    failMessage = failMessage.ReplaceAll(">", "&gt;")
		    TotalTestResult =  TotalTestResult + "       <failure type=""xojo.AssertionFailedError"" message=""" + failMessage + """/>" + EndOfLine
		  End If
		  
		  TotalTestResult =  TotalTestResult + "    " + EndOfLine
		  
		  Return TotalTestResult
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Duration As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		IncludeMethod As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		MethodInfo As Xojo.Introspection.MethodInfo
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		TestName As Text
	#tag EndProperty


	#tag Constant, Name = Failed, Type = Text, Dynamic = False, Default = \"Failed", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NotImplemented, Type = Text, Dynamic = False, Default = \"n/a", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Passed, Type = Text, Dynamic = False, Default = \"Passed", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Skipped, Type = Text, Dynamic = False, Default = \"Skipped", Scope = Public
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
			Name="IncludeMethod"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
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
			Name="Result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
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
			Name="TestName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType="MultiLineEditor"
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
