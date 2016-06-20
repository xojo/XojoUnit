#tag Window
Begin Window XojoUnitTestWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1919610602
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "XojoUnit"
   Visible         =   True
   Width           =   800
   Begin Listbox TestGroupList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   "*,55,30"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   580
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   274
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin GroupBox GroupBoxes
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Overview"
      Enabled         =   True
      Height          =   188
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   286
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   494
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   295
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Start:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   540
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Duration:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   295
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Total:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   76
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   295
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Passed:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   108
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   295
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Failed:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   295
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Skipped:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   68
      End
      Begin Label StartLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1/1/2012 12:00PM"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   145
      End
      Begin Label DurationLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   620
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0s"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   137
      End
      Begin Label TestCountLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "100 tests in 10 groups"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   76
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   382
      End
      Begin Label PassedCountLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0 (0%)"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   108
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   247
      End
      Begin Label FailedCountLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0 (0%)"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   140
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label SkippedCountLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$0"
         Italic          =   False
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0 (0%)"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin GroupBox GroupBoxes
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Selected Test Results"
      Enabled         =   True
      Height          =   366
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   286
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   214
      Underline       =   False
      Visible         =   True
      Width           =   500
      Begin Label TestNameLabel
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   304
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Test Name"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   245
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   242
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   304
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Duration:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   277
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label TestDurationLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   420
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "0s"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   277
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin TextArea TestResultsArea
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   214
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   306
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   0.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   346
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   463
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   7
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   304
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Messages:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   317
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label TestResultLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBoxes$1"
         Italic          =   False
         Left            =   667
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Passed"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   245
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin XojoUnitTestToolbar TestToolbar1
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Visible         =   True
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  mController = New DesktopTestController
		  mController.LoadTestGroups
		  
		  PopulateTestGroups
		  
		  // Run unit tests now and exit?
		  dim args(-1) as String
		  args = Split(System.CommandLine().Lowercase(), " ")
		  dim runUnitTest as Integer = args.IndexOf("--rununittests")
		  if runUnitTest > 0 and Ubound(args) > runUnitTest then
		    RunTests
		    ExportTests args(runUnitTest + 1)
		    Quit
		  end
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditClearAll() As Boolean Handles EditClearAll.Action
			SelectAll(False)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditSelectAll() As Boolean Handles EditSelectAll.Action
			SelectAll(True)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileRunTests() As Boolean Handles FileRunTests.Action
			RunTests
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function HelpAboutXojoUnit() As Boolean Handles HelpAboutXojoUnit.Action
			XojoUnitAboutWindow.Show
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub ExportTests(filePath As String)
		  mController.ExportTestResults filePath.ToText
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PopulateTestGroups()
		  // Add the test groups into the listbox
		  TestGroupList.DeleteAllRows
		  
		  For Each g As TestGroup In mController.TestGroups
		    TestGroupList.AddFolder(g.Name)
		    TestGroupList.CellType(TestGroupList.LastIndex, 2) = Listbox.TypeCheckbox
		    TestGroupList.CellCheck(TestGroupList.LastIndex, 2) = g.IncludeGroup
		    TestGroupList.RowTag(TestGroupList.LastIndex) = g
		  Next
		  
		  Dim testCount As Integer
		  testCount = mController.AllTestCount
		  TestCountLabel.Text = Str(testCount) + " tests in " + Str(mController.GroupCount) + " groups."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  Dim now As New Date
		  
		  StartLabel.Text = now.ShortDate + " " + now.ShortTime
		  
		  mController.Start
		  
		  DurationLabel.Text = Format(mController.Duration, "#,###.0000000") + "s"
		  
		  Dim testCount As Integer
		  testCount = mController.RunTestCount
		  TestCountLabel.Text = Str(testCount) + " tests in " + Str(mController.RunGroupCount) + " groups were run."
		  
		  PassedCountLabel.Text = Str(mController.PassedCount) + " (" + Format((mController.PassedCount / testCount) * 100, "##.00") + "%)"
		  FailedCountLabel.Text = Str(mController.FailedCount) + " (" + Format((mController.FailedCount / testCount) * 100, "##.00") + "%)"
		  SkippedCountLabel.Text = Str(mController.SkippedCount)
		  
		  Dim lastRow As Integer
		  
		  lastRow = TestGroupList.ListCount - 1
		  For row As Integer = lastRow DownTo 0
		    If TestGroupList.RowIsFolder(row) Then
		      TestGroupList.Expanded(row) = False
		    End If
		  Next
		  
		  lastRow = TestGroupList.ListCount - 1
		  For row As Integer = lastRow DownTo 0
		    Dim g As TestGroup = TestGroup(TestGroupList.RowTag(row))
		    If g.IncludeGroup Then
		      TestGroupList.Expanded(row) = True
		    End If
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectAll(value As Boolean)
		  For i As Integer = 0 To TestGroupList.ListCount - 1
		    If TestGroupList.RowTag(i) IsA TestGroup Then
		      Dim tg As TestGroup
		      tg = TestGroupList.RowTag(i)
		      tg.IncludeGroup = value
		      
		      TestGroupList.CellCheck(i, 2) = value
		    End If
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectInverse()
		  For i As Integer = 0 To TestGroupList.ListCount - 1
		    If TestGroupList.RowTag(i) IsA TestGroup Then
		      Dim tg As TestGroup = TestGroupList.RowTag(i)
		      tg.IncludeGroup = Not tg.IncludeGroup
		      
		      TestGroupList.CellCheck(i, 2) = tg.IncludeGroup
		    End If
		  Next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mController As TestController
	#tag EndProperty


#tag EndWindowCode

#tag Events TestGroupList
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim g As TestGroup
		  g = Me.RowTag(row)
		  
		  If g <> Nil Then
		    For Each result As TestResult In g.Results
		      Me.AddRow(result.TestName)
		      Me.Cell(Me.LastIndex, 1) = result.Result
		      
		      Me.ColumnType(2) = ListBox.TypeCheckbox
		      Me.CellCheck(Me.LastIndex, 2) = result.IncludeMethod
		      
		      Me.RowTag(Me.LastIndex) = result
		    Next
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  Dim row As Integer = Me.ListIndex
		  
		  If row < 0 Then Return
		  
		  If Me.RowTag(row) IsA TestResult Then
		    Dim tr As TestResult
		    tr = Me.RowTag(row)
		    TestNameLabel.Text = tr.TestName
		    TestResultLabel.Text = tr.Result
		    TestResultsArea.Text = tr.Message
		    TestDurationLabel.Text = Format(tr.Duration, "#,###.0000000") + "s"
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Me.Expanded(Me.ListIndex) = Not Me.Expanded(Me.ListIndex)
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  If column = 2 Then
		    
		    Select Case Me.RowTag(row)
		    Case IsA TestGroup
		      Dim tg As TestGroup = Me.RowTag(row)
		      tg.IncludeGroup = Me.CellCheck(row, column)
		      
		    Case IsA TestResult
		      Dim tr As TestResult = Me.RowTag(row)
		      tr.IncludeMethod = Me.CellCheck(row, column)
		      
		    End Select
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  
		  #If TargetMacOS Then
		    If row Mod 2 = 0 And Not Me.Selected(row) Then
		      g.ForeColor = RGB(237, 243, 254) '&cD0D4FF
		      g.Fillrect(0, 0, g.Width, g.Height)
		    End If
		    
		    Return True
		  #Else
		    #Pragma Unused g
		    #Pragma Unused row
		  #Endif
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Select All"
		    SelectAll(True)
		    
		  Case "Select None"
		    SelectAll(False)
		    
		  Case "Select Inverse"
		    SelectInverse
		    
		  Case "Select Errors"
		    
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  base.Append(New MenuItem("Select All"))
		  base.Append(New MenuItem("Select Inverse"))
		  base.Append(New MenuItem("Select None"))
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused column
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  If Me.Cell(row, 1) = TestResult.Failed Then
		    g.ForeColor = &cFF0000
		    g.Bold = True
		  Else
		    g.ForeColor = &c000000
		    g.Bold = False
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TestToolbar1
	#tag Event
		Sub Action(item As ToolItem)
		  Select Case item.Name
		  Case "RunButton"
		    RunTests
		  Case "ExportButton"
		    Dim dlg as New SaveAsDialog
		    Dim f as FolderItem
		    dlg.InitialDirectory = SpecialFolder.Documents
		    dlg.promptText = "Save results as"
		    dlg.SuggestedFileName = "results.xml"
		    dlg.Title = "Save Results"
		    dlg.Filter = "xml"
		    f = dlg.ShowModal()
		    If f <> Nil then
		      ExportTests f.NativePath
		    End if
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
