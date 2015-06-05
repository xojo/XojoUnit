#tag IOSView
Begin iosView XojoUnitTestGroupView
   BackButtonTitle =   "Test Groups"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabTitle        =   ""
   Title           =   "XojoUnit"
   Top             =   0
   Begin iOSTable TestGroupsTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TestGroupsTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TestGroupsTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, 
      AutoLayout      =   TestGroupsTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   TestGroupsTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, 
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
	#tag Event
		Sub Open()
		  Self.LeftNavigationToolbar.Add(iOSToolButton.NewPlain("Run"))
		  
		  mController = New iOSTestController
		  mController.LoadTestGroups
		  
		  PopulateTestGroups
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  RunTests
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PopulateTestGroups()
		  // Add the test groups
		  TestGroupsTable.RemoveAll
		  TestGroupsTable.AddSection("")
		  
		  Dim cellData As iOSTableCellData
		  For Each g As TestGroup In mController.TestGroups
		    cellData = New iOSTableCellData
		    cellData.Text = g.Name
		    cellData.DetailText = g.TestCount.ToText + " tests, " _
		    + g.PassedTestCount.ToText + " passed, " _
		    + g.FailedTestCount.ToText + " failed"
		    cellData.AccessoryType = iOSTableCellData.AccessoryTypes.Detail
		    cellData.Tag = g
		    
		    TestGroupsTable.AddRow(0, cellData)
		  Next
		  
		  If Self.ParentSplitView <> Nil And Self.ParentSplitView.Available Then
		    Dim detail As TestDetailsView = TestDetailsView(Self.ParentSplitView.Detail)
		    
		    Dim testCount As Integer
		    testCount = mController.AllTestCount
		    detail.TestCountLabel.Text = testCount.ToText + " tests in " + mController.GroupCount.ToText + " groups."
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  If Self.ParentSplitView.Available Then
		    Dim detail As TestDetailsView = TestDetailsView(Self.ParentSplitView.Detail)
		    detail.StartLabel.Text = Date.Now.ToText(Locale.Current, Date.FormatStyles.Medium)
		    
		  End If
		  
		  mController.Start
		  PopulateTestGroups
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mController As TestController
	#tag EndProperty


#tag EndWindowCode

#tag Events TestGroupsTable
	#tag Event
		Sub Action(section As Integer, row As Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub AccessoryAction(section As Integer, row As Integer)
		  // Display the test methods for the group
		  Dim v As New XojoUnitTestMethodView
		  v.Group = Me.RowData(section, row).Tag
		  
		  Self.PushTo(v)
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
