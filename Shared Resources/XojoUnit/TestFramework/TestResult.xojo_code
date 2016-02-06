#tag Class
Protected Class TestResult
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
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeMethod"
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
			Name="Message"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Result"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestName"
			Group="Behavior"
			Type="Text"
			EditorType="MultiLineEditor"
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
