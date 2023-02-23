#tag Class
Protected Class ObjectSpyTester
	#tag Method, Flags = &h21
		Private Function Add(x As Integer, y As Integer) As Integer
		  Return x + y
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Add(x As Integer, y As Integer, z As Integer) As Integer
		  Return x + y + z
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Add(x As Variant, y As Integer)
		  Result = Add(x, y)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function AddParams(ParamArray values() As Integer) As Integer
		  Var sum As Integer
		  
		  For Each value As Integer In values
		    sum = sum + value
		  Next
		  
		  Return sum
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function AddToArray(arr() As Dictionary) As Dictionary()
		  arr.Add New Dictionary
		  Return arr
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SharedAdd(x As Integer, y As Auto) As Integer
		  Return x + y
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Result As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared SharedResult As Integer
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
