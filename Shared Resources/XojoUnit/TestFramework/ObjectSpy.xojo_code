#tag Class
Protected Class ObjectSpy
	#tag Method, Flags = &h0
		Sub Constructor(base As Object)
		  If base Is Nil Then
		    Raise New NilObjectException
		  End If
		  
		  BaseObject = base
		  BaseTypeInfo = Introspection.GetType(base)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DoParametersMatch(methodInfo As Introspection.MethodInfo, givenParams() As Variant) As Boolean
		  Var methodParams() As Introspection.ParameterInfo = methodInfo.GetParameters
		  
		  If methodParams.Count <> givenParams.Count Then
		    //
		    // This method will take a different number of parameters than
		    // were given, so it can't be a match
		    //
		    Return False
		  End If
		  
		  Var numberTypes() As Int32 = Array( _
		  Variant.TypeInt32, _
		  Variant.TypeInt64, _
		  Variant.TypeSingle, _
		  Variant.TypeDouble _
		  )
		  
		  For index As Integer = 0 To givenParams.LastIndex
		    Var expectedType As Introspection.TypeInfo = methodParams(index).ParameterType
		    
		    If expectedType.Name = "Variant" Or ExpectedType.Name = "Auto" Then
		      //
		      // Will match anything
		      //
		      Continue
		    End If
		    
		    Var givenValue As Variant = givenParams(index)
		    Var givenType As Introspection.TypeInfo = Introspection.GetType(givenValue)
		    
		    If Not expectedType.IsPrimitive And givenType Is Nil Then
		      Return False
		    End If
		    
		    //
		    // Checklist for matching
		    // The first True result means a match
		    //
		    Select Case True
		    Case givenType = expectedType
		    Case expectedType.IsClass And givenValue Is Nil
		    Case expectedType.IsClass And givenType IsA Object And givenType.IsSubclassOf(expectedType)
		    Case expectedType.IsArray And givenType IsA Object And _
		      givenType.IsArray And expectedType.GetElementType = givenType.GetElementType
		      
		      //
		      // Primitives
		      //
		    Case IsNumberType(expectedType) And numberTypes.IndexOf(givenValue.Type) <> -1
		    Case expectedType.Name = "Boolean" And givenValue.Type = Variant.TypeBoolean
		    Case expectedType.Name = "String" And (givenValue.Type = Variant.TypeString Or givenValue.Type = Variant.TypeText)
		    Case expectedType.Name = "Color" and givenValue.Type = Variant.TypeColor
		    Case expectedType.Name = "Ptr" And givenValue.Type = Variant.TypePtr
		      
		    Case Else
		      //
		      // It failed all the tests
		      //
		      Return False
		    End Select
		  Next
		  
		  //
		  // If we get here,
		  // it matched
		  //
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsNumberType(ti As Introspection.TypeInfo) As Boolean
		  If Not ti.IsPrimitive Then
		    Return False
		  End If
		  
		  If ti.IsArray Then
		    Return False
		  End If
		  
		  If ti.Name.BeginsWith("Int") Then
		    Return True
		  End If
		  
		  Select Case ti.Name
		  Case "Double"
		  Case "Single"
		  Case Else
		    Return False
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MatchMethod(methodName As String, givenParams() As Variant, withReturn As Boolean) As Introspection.MethodInfo
		  //
		  // Cycle through the methods to find one that matches
		  // the given parameters.
		  //
		  
		  Var foundMethods() As Introspection.MethodInfo
		  
		  For Each methodInfo As Introspection.MethodInfo In BaseTypeInfo.GetMethods
		    If methodInfo.Name <> methodName Then
		      Continue
		    End If
		    
		    Var hasReturn As Boolean = Not (methodInfo.ReturnType Is Nil)
		    
		    If hasReturn <> withReturn Then
		      Continue
		    End If
		    
		    If DoParametersMatch(methodInfo, givenParams) Then
		      foundMethods.Add methodInfo
		    End If
		  Next
		  
		  
		  If foundMethods.Count = 1 Then
		    Return foundMethods(0)
		    
		  Else
		    //
		    // We couldn't identify the right method
		    //
		    Return Nil
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MatchProperty(propName As String) As Introspection.PropertyInfo
		  For Each propInfo As Introspection.PropertyInfo In BaseTypeInfo.GetProperties
		    If propInfo.Name = propName And propInfo.CanRead Then
		      Return propInfo
		    End If
		  Next
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Lookup(methodName As String, ParamArray params() As Variant)
		  Var methodInfo As Introspection.MethodInfo = MatchMethod(methodName, params, False)
		  
		  If methodInfo Is Nil Then
		    Raise New InvalidArgumentException("Could not locate a method named " + methodName + " that matches these parameters")
		  End If
		  
		  methodInfo.Invoke(BaseObject, params)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Lookup(methodOrPropertyName As String, ParamArray params() As Variant) As Variant
		  If params.Count = 0 Then
		    //
		    // Maybe it's a property
		    //
		    Var propInfo As Introspection.PropertyInfo = MatchProperty(methodOrPropertyName)
		    
		    If propInfo IsA Object Then
		      Return propInfo.Value(BaseObject)
		    End If
		  End If
		  
		  Var methodInfo As Introspection.MethodInfo = MatchMethod(methodOrPropertyName, params, True)
		  
		  If methodInfo Is Nil Then
		    Raise New InvalidArgumentException("Could not locate a method or property named " + methodOrPropertyName + " that matches these parameters")
		  End If
		  
		  Return methodInfo.Invoke(BaseObject, params)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Lookup(propertyName As String, Assigns value As Variant)
		  var propInfo As Introspection.PropertyInfo = MatchProperty(propertyName)
		  
		  If propInfo Is Nil Then
		    Raise New InvalidArgumentException("Could not locate a property named " + propertyName)
		  End If
		  
		  propInfo.Value(BaseObject) = value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private BaseObject As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BaseTypeInfo As Introspection.TypeInfo
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
