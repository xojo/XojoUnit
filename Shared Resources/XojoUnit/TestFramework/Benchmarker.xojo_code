#tag Class
Protected Class Benchmarker
	#tag Method, Flags = &h0
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
		  
		  Const kInsanelyHighNumber As Integer = &h7FFFFFFFFFFFFFFF
		  Return kInsanelyHighNumber
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
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


	#tag Hook, Flags = &h0
		Event Finished(result As BenchmarkResult)
	#tag EndHook


	#tag Property, Flags = &h0
		Iterations As Integer
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
