#tag Class
Protected Class BenchmarkResult
	#tag Method, Flags = &h0
		Sub Constructor(copyFrom As BenchmarkResult)
		  Self.DurationMicroseconds = copyFrom.DurationMicroseconds
		  Self.Iterations = copyFrom.Iterations
		  Self.Name = copyFrom.Name
		  Self.IterationsPerSecond = copyFrom.IterationsPerSecond
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(parent As TestGroup)
		  ParentGroup = parent
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function N() As Integer
		  Var remaining As Integer = TargetMicroseconds - System.Microseconds
		  
		  Iterations = Iterations + 1
		  
		  If Remaining <= 0 Then
		    //
		    // We are done
		    //
		    DurationMicroseconds = (System.Microseconds - StartMicroseconds)
		    IterationsPerSecond = Iterations / DurationMicroseconds * 1000000
		    
		    Var parent As TestGroup = ParentGroup
		    
		    //
		    // Log It
		    //
		    'If Assert IsA Object Then
		    'Var durationMs As Double = DurationMicroseconds / 1000.0
		    '
		    'Assert.Pass Name + " -> " + _
		    '"Iter: " + Iterations.ToString("#,##0") + ", " + _
		    '"Dur: " + DurationMs.ToString("#,##0.00") + " ms, " + _
		    '"IPS: " + IterationsPerSecond.ToString("#,##0")
		    'End If
		    
		    //
		    // Add this to the TestResult
		    //
		    If parent IsA Object And parent.CurrentTestResult IsA Object Then
		      Parent.CurrentTestResult.Benchmarks.Add New BenchmarkResult(Self)
		    End If
		    
		    Reset
		    
		    Return -1
		  End If
		  
		  Return TargetMicroseconds
		  
		  'Name              ips        average  deviation         median         99th %
		  'keyword        5.69 M      175.88 ns ±10956.99%         150 ns         176 ns
		  'map            5.49 M      182.07 ns ±12943.82%         155 ns         210 ns
		  '
		  'Comparison: 
		  'keyword        5.69 M
		  'map            5.49 M - 1.04x slower +6.19 ns
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reset()
		  Name = ""
		  StartMicroseconds = 0.0
		  TargetMicroseconds = 0.0
		  
		  //
		  // We leave the other values intact in case the user
		  // wants to check them.
		  //
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start(name As String, durationMs As Integer = 200)
		  If TargetMicroseconds <> 0.0 Then
		    Raise New RuntimeException("Start was already called.")
		  End If
		  
		  Self.Name = name
		  StartMicroseconds = System.Microseconds
		  TargetMicroseconds = StartMicroseconds + (durationMs * 1000)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DurationMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Iterations As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		IterationsPerSecond As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentGroupWeakRef As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mParentGroupWeakRef Is Nil Or mParentGroupWeakRef.Value Is Nil Then
			    Return Nil
			  End If
			  
			  Return TestGroup(mParentGroupWeakRef.Value)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Is Nil Then
			    mParentGroupWeakRef = Nil
			  Else
			    mParentGroupWeakRef = New WeakRef(value)
			  End If
			  
			End Set
		#tag EndSetter
		Private ParentGroup As TestGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		StartMicroseconds As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TargetMicroseconds As Integer
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
		#tag ViewProperty
			Name="DurationMicroseconds"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Iterations"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IterationsPerSecond"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartMicroseconds"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
