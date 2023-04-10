#tag Class
Protected Class Benchmarker
	#tag Method, Flags = &h0, Description = 52657475726E73207468652063757272656E74207465737420697465726174696F6E206F72202D31206F6E6365206120746573742068617320636F6D706C657465642E2055736167653A2060466F722069203D203120546F2042656E63682E4E60206F7220605768696C652042656E63682E4E203E2030602E
		Function N() As Integer
		  Iterations = Iterations + 1
		  
		  Var currentMicroseconds As Double = System.Microseconds
		  
		  Var remaining As Double = TargetMicroseconds - currentMicroseconds
		  
		  If remaining <= 0.0 Then
		    //
		    // We are done
		    //
		    Var result As New BenchmarkResult
		    
		    result.Name = Name
		    result.Iterations = Iterations
		    result.DurationMicroseconds = (currentMicroseconds - StartMicroseconds)
		    
		    RaiseEvent Finished(result)
		    
		    //
		    // Reset
		    //
		    StartMicroseconds = 0.0
		    TargetMicroseconds = 0.0
		    
		    Return -1
		  End If
		  
		  Return Iterations
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 496E697469616C697A652061206E65772062656E63686D61726B20746573742E2043616C6C206F6E6365206265666F7265207374617274696E672074686520746573742E
		Sub Start(name As String, durationMs As Integer = 200)
		  If TargetMicroseconds <> 0.0 Then
		    Raise New RuntimeException("Start was already called.")
		  End If
		  
		  Self.Name = name
		  StartMicroseconds = System.Microseconds
		  TargetMicroseconds = StartMicroseconds + (durationMs * 1000.0)
		  
		  Iterations = 0
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0, Description = 5468652062656E63686D61726B2068617320636F6D706C657465642E
		Event Finished(result As BenchmarkResult)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Iterations As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TargetMicroseconds As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
