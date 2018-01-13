#tag IOSView
Begin iosView XojoUnitTestGroupView
   BackButtonTitle =   "Groups"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "XojoUnit"
   Top             =   0
   Begin iOSTable TestGroupsTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TestGroupsTable, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestGroupsTable, 2, <Parent>, 2, False, +1.00, 1, 1, -0, , True
      AutoLayout      =   TestGroupsTable, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestGroupsTable, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   "0"
      Height          =   703.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   65
      Visible         =   True
      Width           =   1024.0
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
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  RunButton = iOSToolButton.NewPlain("Run")
		  Self.RightNavigationToolbar.Add(RunButton)
		  
		  Controller.LoadTestGroups
		  
		  PopulateTestGroups
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  #Pragma Unused button
		  
		  RunTests
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub PopulateTestGroups()
		  // Add the test groups
		  TestGroupsTable.RemoveAll
		  TestGroupsTable.AddSection("")
		  
		  Dim cellData As iOSTableCellData
		  For Each g As TestGroup In Controller.TestGroups
		    #If RBVersion < 2016.02
		      cellData = New iOSTableCellData
		    #Else
		      cellData = TestGroupsTable.CreateCell
		    #Endif
		    cellData.Text = g.Name
		    cellData.DetailText = g.TestCount.ToText + " tests, " _
		    + g.PassedTestCount.ToText + " passed, " _
		    + g.FailedTestCount.ToText + " failed"
		    cellData.AccessoryType = iOSTableCellData.AccessoryTypes.Detail
		    cellData.Tag = g
		    
		    TestGroupsTable.AddRow(0, cellData)
		  Next
		  
		  If Self.ParentSplitView <> Nil And Self.ParentSplitView.Available Then
		    Dim detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		    
		    Dim testCount As Integer
		    testCount = Controller.AllTestCount
		    detail.TestCountLabel.Text = testCount.ToText + " tests in " + Controller.GroupCount.ToText + " groups."
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  If Self.ParentSplitView.Available Then
		    Dim detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		    detail.StartLabel.Text = Date.Now.ToText(Locale.Current, Date.FormatStyles.Medium)
		    
		    Controller.Start
		    RunButton.Enabled = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSummary()
		  Dim detail As XojoUnitTestDetailsView = XojoUnitTestDetailsView(Self.ParentSplitView.Detail)
		  
		  detail.DurationValueLabel.Text = Controller.Duration.ToText(Locale.Current, "#,##0.0000000") + "s"
		  
		  Dim allTestCount As Integer = Controller.AllTestCount
		  Dim runTestCount As Integer = Controller.RunTestCount
		  
		  Dim groupsMessage As Text = Controller.RunGroupCount.ToText + If(Controller.RunGroupCount = 1, " group was run", " groups were run")
		  Dim testsMessage As Text = If(allTestCount = 1, " test", " tests")
		  
		  If runTestCount = allTestCount Then
		    detail.TestCountLabel.Text = runTestCount.ToText + testsMessage + " in " + groupsMessage
		  Else
		    detail.TestCountLabel.Text = runTestCount.ToText + " of " + allTestCount.ToText + testsMessage + " in " + groupsMessage
		  End If
		  
		  Dim pct As Double
		  pct = (Controller.PassedCount / runTestCount) * 100.0
		  detail.PassedCountLabel.Text = Controller.PassedCount.ToText + _
		  If(runTestCount = 0, "", " (" + pct.ToText(Locale.Current, "#0.00") + "%)")
		  
		  pct = (Controller.FailedCount / runTestCount) * 100.0
		  detail.FailedCountLabel.Text = Controller.FailedCount.ToText + _
		  If(runTestCount = 0, "", " (" + pct.ToText(Locale.Current, "#0.00") + "%)")
		  detail.SkippedCountLabel.Text = Controller.SkippedCount.ToText
		  detail.NotImplementedCountLabel.Text = Controller.NotImplementedCount.ToText
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private RunButton As iOSToolButton
	#tag EndProperty


#tag EndWindowCode

#tag Events TestGroupsTable
	#tag Event
		Sub AccessoryAction(section As Integer, row As Integer)
		  // Display the test methods for the group
		  Dim v As New XojoUnitTestMethodView
		  v.LoadTests(Me.RowData(section, row).Tag)
		  
		  Self.PushTo(v)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Controller
	#tag Event
		Sub AllTestsFinished()
		  UpdateSummary
		  RunButton.Enabled = True
		  
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
