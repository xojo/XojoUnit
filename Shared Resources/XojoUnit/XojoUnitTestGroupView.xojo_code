#tag MobileScreen
Begin MobileScreen XojoUnitTestGroupView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   ""
   Title           =   "XojoUnit"
   Top             =   0
   Begin iOSMobileTable TestGroupsTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   TestGroupsTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestGroupsTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, , True
      AutoLayout      =   TestGroupsTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestGroupsTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
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
   Begin iOSTestController Controller
      AllTestCount    =   0
      Duration        =   0.0
      FailedCount     =   0
      GroupCount      =   0
      IsRunning       =   False
      Left            =   0
      LockedInPosition=   False
      NotImplementedCount=   0
      PanelIndex      =   -1
      Parent          =   ""
      PassedCount     =   0
      RunGroupCount   =   0
      RunTestCount    =   0
      Scope           =   2
      SkippedCount    =   0
      Top             =   0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  RunButton = New MobileToolbarButton(MobileToolbarButton.Types.Plain, "Run")
		  Self.RightNavigationToolbar.AddButton(RunButton)
		  
		  Controller.LoadTestGroups
		  
		  PopulateTestGroups
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  #Pragma Unused button
		  
		  RunTests
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PopulateTestGroups()
		  // Add the test groups
		  TestGroupsTable.RemoveAllRows
		  TestGroupsTable.AddSection("")
		  
		  Var cellData As MobileTableCellData
		  For Each g As TestGroup In Controller.TestGroups
		    cellData = TestGroupsTable.CreateCell
		    cellData.Text = g.Name
		    cellData.DetailText = g.TestCount.ToString + " tests, " _
		    + g.PassedTestCount.ToString + " passed, " _
		    + g.FailedTestCount.ToString + " failed"
		    cellData.AccessoryType = MobileTableCellData.AccessoryTypes.Detail
		    cellData.Tag = g
		    
		    TestGroupsTable.AddRow(0, cellData)
		  Next
		  
		  If Self.ParentSplitView <> Nil And Self.ParentSplitView.Available Then
		    Var detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		    
		    Var testCount As Integer
		    testCount = Controller.AllTestCount
		    detail.TestCountLabel.Text = testCount.ToString + " tests in " + Controller.GroupCount.ToString + " groups."
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProgressWheelVisible(Assigns value As Boolean)
		  Var detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		  detail.ProgressWheel1.Visible = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  If Self.ParentSplitView.Available Then
		    Var detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		    detail.StartLabel.Text = DateTime.Now.ToString(DateTime.FormatStyles.Medium, DateTime.FormatStyles.Medium)
		    
		    Controller.Start
		    RunButton.Enabled = False
		    ProgressWheelVisible = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSummary()
		  Var detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		  
		  detail.DurationValueLabel.Text = Controller.Duration.ToString(Locale.Current, "#,##0.0000000") + "s"
		  
		  Var allTestCount As Integer = Controller.AllTestCount
		  Var runTestCount As Integer = Controller.RunTestCount
		  
		  Var groupsMessage As String = Controller.RunGroupCount.ToString + If(Controller.RunGroupCount = 1, " group was run", " groups were run")
		  Var testsMessage As String = If(allTestCount = 1, " test", " tests")
		  
		  If runTestCount = allTestCount Then
		    detail.TestCountLabel.Text = runTestCount.ToString + testsMessage + " in " + groupsMessage
		  Else
		    detail.TestCountLabel.Text = runTestCount.ToString + " of " + allTestCount.ToString + testsMessage + " in " + groupsMessage
		  End If
		  
		  Var pct As Double
		  pct = (Controller.PassedCount / runTestCount) * 100.0
		  detail.PassedCountLabel.Text = Controller.PassedCount.ToString + _
		  If(runTestCount = 0, "", " (" + pct.ToString(Locale.Current, "#0.00") + "%)")
		  
		  pct = (Controller.FailedCount / runTestCount) * 100.0
		  detail.FailedCountLabel.Text = Controller.FailedCount.ToString + _
		  If(runTestCount = 0, "", " (" + pct.ToString(Locale.Current, "#0.00") + "%)")
		  detail.SkippedCountLabel.Text = Controller.SkippedCount.ToString
		  detail.NotImplementedCountLabel.Text = Controller.NotImplementedCount.ToString
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private RunButton As MobileToolbarButton
	#tag EndProperty


#tag EndWindowCode

#tag Events TestGroupsTable
	#tag Event
		Sub AccessoryPressed(section As Integer, row As Integer)
		  // Display the test methods for the group
		  Var v As New XojoUnitTestMethodView
		  v.LoadTests(Me.RowCellData(section, row).Tag)
		  
		  Self.PushTo(v)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Controller
	#tag Event
		Sub AllTestsFinished()
		  UpdateSummary
		  RunButton.Enabled = True
		  ProgressWheelVisible = False
		End Sub
	#tag EndEvent
	#tag Event
		Sub GroupFinished(group As TestGroup)
		  #Pragma Unused group
		  
		  PopulateTestGroups
		  UpdateSummary
		  
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
