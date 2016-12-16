#tag IOSView
Begin iosView XojoUnitTestMethodView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Test Methods"
   Top             =   0
   Begin iOSTable MethodTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   MethodTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, 
      AutoLayout      =   MethodTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   MethodTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   MethodTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
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
	#tag Method, Flags = &h0
		Sub LoadTests(g As TestGroup)
		  Self.Title = g.Name + " Methods"
		  
		  MethodTable.RemoveAll
		  
		  MethodTable.AddSection("")
		  
		  Dim cellData As iOSTableCellData
		  
		  For Each t As TestResult In g.Results
		    #If RBVersion < 2016.02
		      cellData = New iOSTableCellData
		      cellData.Text = t.TestName
		      cellData.DetailText = "Results: " + t.Result
		    #Else
		      cellData = MethodTable.CreateCustomCell(GetTypeInfo(XojoUnitMethodTableCell))
		      Dim cell As XojoUnitMethodTableCell = XojoUnitMethodTableCell(cellData.Control)
		      
		      cell.MethodNameLabel.Text = t.TestName
		      cell.ResultLabel.Text = "Results: " + t.Result
		      If t.Result = TestResult.Failed Then
		        cell.MethodNameLabel.TextColor = Color.Red
		        cell.ResultLabel.TextColor = cell.MethodNameLabel.TextColor
		      End If
		    #Endif
		    
		    cellData.Tag = t
		    MethodTable.AddRow(0, cellData)
		  Next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events MethodTable
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  If Me.RowData(section, row).Tag IsA TestResult Then
		    Dim tr As TestResult
		    tr = Me.RowData(section, row).Tag
		    
		    If Self.ParentSplitView.Available Then
		      Dim detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		      detail.TestNameLabel.Text = tr.TestName
		      detail.TestResultLabel.Text = tr.Result
		      detail.TestResultsArea.Text = tr.Message
		      detail.TestDurationLabel.Text = tr.Duration.ToText(Locale.Current, "#,##0.0000000") + "s"
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
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
