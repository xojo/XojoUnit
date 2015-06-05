#tag IOSView
Begin iosView XojoUnitTestMethodView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "Test Methods"
   Top             =   0
   Begin iOSTable MethodTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   MethodTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   MethodTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   MethodTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   MethodTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, 
      Format          =   "0"
      Height          =   415.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   65
      Visible         =   True
      Width           =   320.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGroup
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGroup = value
			  
			  MethodTable.RemoveAll
			  
			  MethodTable.AddSection("")
			  
			  Dim cellData As iOSTableCellData
			  For Each t As TestResult In mGroup.Results
			    cellData = New iOSTableCellData
			    cellData.Text = t.TestName
			    cellData.DetailText = "Results: " + t.Result
			    cellData.AccessoryType = iOSTableCellData.AccessoryTypes.Detail
			    cellData.Tag = t
			    
			    If t.Result = TestResult.Failed Then
			      
			    End If
			    
			    MethodTable.AddRow(0, cellData)
			  Next
			End Set
		#tag EndSetter
		Group As TestGroup
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mGroup As TestGroup
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
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
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
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
