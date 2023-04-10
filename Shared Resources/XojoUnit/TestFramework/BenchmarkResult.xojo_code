#tag Class
Protected Class BenchmarkResult
	#tag Property, Flags = &h0, Description = 5468652061637475616C204D6963726F7365636F6E64732074686174207468652062656E63686D61726B207465737420636F6E73756D65642E
		DurationMicroseconds As Double
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206E756D626572206F6620726F756E647320706572666F726D656420647572696E67207468652062656E63686D61726B20746573742E
		Iterations As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0, Description = 41766572616765206E756D626572206F6620697465726174696F6E7320657870656374656420706572207365636F6E642E
		#tag Getter
			Get
			  Return (Iterations * 1000000.0) / DurationMicroseconds
			  
			End Get
		#tag EndGetter
		IterationsPerSecond As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return DurationMicroseconds / Iterations
			End Get
		#tag EndGetter
		MicrosecondsPerIteration As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0, Description = 42656E63686D61726B2074657374206E616D65207573656420746F206964656E746966792074686520746573742E
		Name As String
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
	#tag EndViewBehavior
End Class
#tag EndClass
