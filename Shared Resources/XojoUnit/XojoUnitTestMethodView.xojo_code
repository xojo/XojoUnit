#tag MobileScreen
Begin MobileScreen XojoUnitTestMethodView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "Test Methods"
   Top             =   0
   Begin iOSMobileTable MethodTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   MethodTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   MethodTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, , True
      AutoLayout      =   MethodTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   MethodTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   503
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Method, Flags = &h0
		Sub LoadTests(g As TestGroup)
		  Self.Title = g.Name + " Methods"
		  
		  MethodTable.RemoveAllRows
		  
		  MethodTable.AddSection("")
		  
		  Var cellData As MobileTableCellData
		  
		  For Each t As TestResult In g.Results
		    cellData = MethodTable.CreateCustomCell(GetTypeInfo(XojoUnitMethodTableCell))
		    Var cell As XojoUnitMethodTableCell = XojoUnitMethodTableCell(cellData.Control)
		    
		    cell.MethodNameLabel.Text = t.TestName
		    cell.ResultLabel.Text = "Results: " + t.Result
		    If t.Result = TestResult.Failed Then
		      cell.MethodNameLabel.TextColor = Color.Red
		      cell.ResultLabel.TextColor = cell.MethodNameLabel.TextColor
		    End If
		    
		    cellData.Tag = t
		    MethodTable.AddRow(0, cellData)
		  Next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events MethodTable
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  If Me.RowCellData(section, row).Tag IsA TestResult Then
		    Var tr As TestResult
		    tr = Me.RowCellData(section, row).Tag
		    
		    If Self.ParentSplitView.Available Then
		      Var detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		      detail.TestNameLabel.Text = tr.TestName
		      detail.TestResultLabel.Text = tr.Result
		      detail.TestResultsArea.Text = tr.Message
		      detail.TestDurationLabel.Text = tr.Duration.ToString(Locale.Current, "#,##0.0000000") + "s"
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="TabIcon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
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
