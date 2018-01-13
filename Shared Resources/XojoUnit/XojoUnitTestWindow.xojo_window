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
      ShowDropIndicator=   False
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
         Text            =   "(run tests first)"
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
         Width           =   100
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
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
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
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Not Implemented:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   172
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   135
      End
      Begin Label NotImplementedCountLabel
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
         Left            =   680
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
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
         ReadOnly        =   True
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
   Begin DesktopTestController Controller
      AllTestCount    =   0
      Duration        =   0.0
      FailedCount     =   0
      GroupCount      =   0
      Index           =   -2147483648
      IsRunning       =   False
      LockedInPosition=   False
      NotImplementedCount=   0
      PassedCount     =   0
      RunGroupCount   =   0
      RunTestCount    =   0
      Scope           =   2
      SkippedCount    =   0
      TabPanelIndex   =   0
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   764
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   7
      Visible         =   False
      Width           =   16
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Controller.LoadTestGroups
		  
		  PopulateTestGroups
		  
		  // Run unit tests now and exit?
		  //
		  // Note:
		  //   The '--rununittests path' argument must be last
		  
		  Dim argString As String = System.CommandLine
		  
		  Dim rx As New RegEx
		  rx.SearchPattern = "(?mi-Us)\s?--rununittests\b( (.+))?"
		  
		  Dim match As RegExMatch = rx.Search(argString)
		  
		  If match IsA Object Then
		    Try
		      #Pragma BreakOnExceptions False
		      ExportFilePath = match.SubExpressionString(2) // Let it raise an exception if needed
		      #Pragma BreakOnExceptions Default 
		    Catch err As OutOfBoundsException
		      err.Message = "A valid export file path was not provided"
		      Raise err
		    End Try
		    
		    If ExportFilePath.Encoding Is Nil Then
		      ExportFilePath = ExportFilePath.DefineEncoding(Encodings.UTF8)
		    Else
		      ExportFilePath = ExportFilePath.ConvertEncoding(Encodings.UTF8)
		    End If
		    
		    RunTests
		  End
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditSelectAllGroups() As Boolean Handles EditSelectAllGroups.Action
			SelectAllGroups(True, False)
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUnselectAllGroups() As Boolean Handles EditUnselectAllGroups.Action
			SelectAllGroups(False, False)
			
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
		  Controller.ExportTestResults filePath.ToText
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PopulateTestGroups()
		  // Add the test groups into the listbox
		  TestGroupList.DeleteAllRows
		  
		  For Each g As TestGroup In Controller.TestGroups
		    TestGroupList.AddFolder(g.Name)
		    TestGroupList.CellType(TestGroupList.LastIndex, ColInclude) = Listbox.TypeCheckbox
		    TestGroupList.CellCheck(TestGroupList.LastIndex, ColInclude) = g.IncludeGroup
		    TestGroupList.RowTag(TestGroupList.LastIndex) = g
		  Next
		  
		  Dim testCount As Integer
		  testCount = Controller.AllTestCount
		  TestCountLabel.Text = Str(testCount) + " tests in " + Str(Controller.GroupCount) + " groups"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetTestGroupList()
		  Dim lastRow As Integer
		  
		  Dim selectedRow As Integer = TestGroupList.ListIndex
		  Dim scroll As Integer = TestGroupList.ScrollPosition
		  
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
		  
		  TestGroupList.ListIndex = selectedRow
		  TestGroupList.ScrollPosition = scroll
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowOfTestGroup(tg As TestGroup) As Integer
		  For row As Integer = 0 To TestGroupList.ListCount - 1
		    If TestGroupList.RowTag(row) Is tg Then
		      Return row
		    End If
		  Next
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowOfTestResult(tr As TestResult) As Integer
		  For row As Integer = TestGroupList.ListCount - 1 DownTo 0
		    If TestGroupList.RowTag(row) Is tr Then
		      Return row
		    End If
		  Next
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTests()
		  Dim now As New Date
		  
		  StartLabel.Text = now.ShortDate + " " + now.ShortTime
		  
		  ProgressWheel1.Visible = True
		  TestToolbar1.RunButton.Enabled = False
		  TestToolbar1.StopButton.Enabled = True
		  TestToolbar1.ExportButton.Enabled = False
		  
		  Controller.Start
		  ResetTestGroupList
		  UpdateSummary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectAllGroups(value As Boolean, andTests As Boolean)
		  For i As Integer = 0 To TestGroupList.ListCount - 1
		    If TestGroupList.RowTag(i) IsA TestGroup Then
		      Dim tg As TestGroup
		      tg = TestGroupList.RowTag(i)
		      tg.IncludeGroup = value
		      
		      TestGroupList.CellCheck(i, ColInclude) = value
		      
		      If andTests Then
		        SelectAllTests(tg, value)
		      End If
		    End If
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectAllTests(tg As TestGroup, value As Boolean)
		  For Each tr As TestResult In tg.Results
		    tr.IncludeMethod = value
		  Next
		  
		  Dim tgRow As Integer = RowOfTestGroup(tg)
		  
		  If tgRow <> -1 Then
		    If TestGroupList.Expanded(tgRow) Then
		      
		      For row As Integer = tgRow + 1 To TestGroupList.ListCount - 1
		        If Not (TestGroupList.RowTag(row) IsA TestResult) Then
		          Exit For
		        End If
		        TestGroupList.CellCheck(row, ColInclude) = value
		      Next
		      
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectInverseGroups(andTests As Boolean)
		  For i As Integer = 0 To TestGroupList.ListCount - 1
		    If TestGroupList.RowTag(i) IsA TestGroup Then
		      Dim tg As TestGroup = TestGroupList.RowTag(i)
		      tg.IncludeGroup = Not tg.IncludeGroup
		      
		      TestGroupList.CellCheck(i, ColInclude) = tg.IncludeGroup
		      
		      If andTests Then
		        SelectInverseTests(tg)
		      End If
		    End If
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectInverseTests(tg As TestGroup)
		  For Each tr As TestResult In tg.Results
		    tr.IncludeMethod = Not tr.IncludeMethod
		  Next
		  
		  Dim tgRow As Integer = RowOfTestGroup(tg)
		  
		  If tgRow <> -1 And TestGroupList.Expanded(tgRow) Then
		    
		    For row As Integer = tgRow + 1 To TestGroupList.ListCount - 1
		      Dim tag As Variant = TestGroupList.RowTag(row)
		      If Not (tag IsA TestResult) Then
		        Exit For
		      End If
		      Dim tr As TestResult = tag
		      TestGroupList.CellCheck(row, ColInclude) = tr.IncludeMethod
		    Next
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StopTests()
		  Controller.Stop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestsFinished()
		  UpdateSummary
		  
		  // We were launched from the command-line, write out the results and quit
		  If ExportFilePath <> "" Then
		    ExportTests(ExportFilePath)
		    Quit
		  End If
		  
		  ProgressWheel1.Visible = False
		  TestToolbar1.RunButton.Enabled = True
		  TestToolbar1.StopButton.Enabled = False
		  TestToolbar1.ExportButton.Enabled = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSummary()
		  DurationLabel.Text = Format(Controller.Duration, "#,###.0000000") + "s"
		  
		  Dim allTestCount As Integer = Controller.AllTestCount
		  Dim runTestCount As Integer = Controller.RunTestCount
		  
		  Dim groupsMessage As String = Str(Controller.RunGroupCount) + If(Controller.RunGroupCount = 1, " group was run", " groups were run")
		  Dim testsMessage As String = If(allTestCount = 1, " test", " tests")
		  
		  If runTestCount = allTestCount Then
		    TestCountLabel.Text = Str(runTestCount) + testsMessage + " in " + groupsMessage
		  Else
		    TestCountLabel.Text = Str(runTestCount) + " of " + Str(allTestCount) + testsMessage + " in " + groupsMessage
		  End If
		  
		  Dim passedCount As Integer = Controller.PassedCount
		  Dim passedPercent As Double = passedCount / runTestCount
		  Dim passedPercentMessage As String = If(runTestCount = 0, "", " (" + Format(passedPercent, "#.00%") + ")")
		  
		  Dim failedCount As Integer = Controller.FailedCount
		  Dim failedPercent As Double = failedCount / runTestCount
		  Dim failedPercentMessage As String = If(runTestCount = 0, "", " (" + Format(failedPercent, "#.00%") + ")")
		  
		  PassedCountLabel.Text = Str(passedCount) + passedPercentMessage
		  FailedCountLabel.Text = Str(Controller.FailedCount) + failedPercentMessage
		  SkippedCountLabel.Text = Str(Controller.SkippedCount)
		  NotImplementedCountLabel.Text = Str(Controller.NotImplementedCount)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTestResult(tr As TestResult, row As Integer = -1)
		  If row < 0 Then
		    row = RowOfTestResult(tr)
		  End If
		  
		  If row <> -1 Then
		    TestGroupList.Cell(row, ColTestName) = tr.TestName
		    TestGroupList.Cell(row, ColResult) = tr.Result
		    TestGroupList.CellCheck(row, ColInclude) = tr.IncludeMethod
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTestResults(tg As TestGroup)
		  TestGroupList.Invalidate
		  
		  Dim tgRow As Integer = RowOfTestGroup(tg)
		  If tgRow = -1 Or TestGroupList.Expanded(tgRow) = False Then
		    Return
		  End If
		  
		  For row As Integer = tgRow + 1 To TestGroupList.ListCount - 1
		    Dim tag As Variant = TestGroupList.RowTag(row)
		    If Not (tag IsA TestResult) Then
		      //
		      // We have exhausted the group
		      //
		      Return
		    End If
		    
		    UpdateTestResult(TestResult(tag), row)
		  Next
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return Integer(Columns.Include)
			End Get
		#tag EndGetter
		Private ColInclude As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return Integer(Columns.Result)
			End Get
		#tag EndGetter
		Private ColResult As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Return Integer(Columns.TestName)
			End Get
		#tag EndGetter
		Private ColTestName As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ExportFilePath As String
	#tag EndProperty


	#tag Constant, Name = kCMSelectAllGroups, Type = String, Dynamic = False, Default = \"Select All Groups", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectAllGroupsAndTests, Type = String, Dynamic = False, Default = \"Select All Groups && Tests", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectAllTests, Type = String, Dynamic = False, Default = \"Select All Tests In This Group", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectInverseGroups, Type = String, Dynamic = False, Default = \"Select Inverse Goups", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectInverseGroupsAndTests, Type = String, Dynamic = False, Default = \"Select Inverse Groups && Tests", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectInverseTests, Type = String, Dynamic = False, Default = \"Select Inverse Tests In This Group", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMSelectThisGroup, Type = String, Dynamic = False, Default = \"Select This Group", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMUnselectAllGroups, Type = String, Dynamic = False, Default = \"Unselect All Groups", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMUnselectAllGroupsAndTests, Type = String, Dynamic = False, Default = \"Unselect All Groups && Tests", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMUnselectAllTests, Type = String, Dynamic = False, Default = \"Unselect All Tests In This Group", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCMUnselectThisGroup, Type = String, Dynamic = False, Default = \"Unselect This Group", Scope = Private
	#tag EndConstant


	#tag Enum, Name = Columns, Type = Integer, Flags = &h21
		TestName
		  Result
		Include
	#tag EndEnum


#tag EndWindowCode

#tag Events TestGroupList
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim g As TestGroup
		  g = Me.RowTag(row)
		  
		  If g <> Nil Then
		    For Each result As TestResult In g.Results
		      Me.AddRow("")
		      Me.ColumnType(ColInclude) = ListBox.TypeCheckbox
		      Me.RowTag(Me.LastIndex) = result
		      
		      UpdateTestResult(result, Me.LastIndex)
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
		  If column = ColInclude Then
		    
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
		      g.FillRect(0, 0, g.Width, g.Height)
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
		  Case kCMSelectAllGroups
		    SelectAllGroups(True, False)
		    
		  Case kCMUnselectAllGroups
		    SelectAllGroups(False, False)
		    
		  Case kCMSelectInverseGroups
		    SelectInverseGroups(False)
		    
		  Case kCMSelectAllTests
		    SelectAllTests(hitItem.Tag, True)
		    
		  Case kCMSelectInverseTests
		    SelectInverseTests(hitItem.Tag)
		    
		  Case kCMUnselectAllTests
		    SelectAllTests(hitItem.Tag, False)
		    
		  Case kCMSelectThisGroup
		    Dim tg As TestGroup = hitItem.Tag
		    tg.IncludeGroup = True
		    TestGroupList.CellCheck(RowOfTestGroup(tg), ColInclude) = tg.IncludeGroup
		    
		  Case kCMUnselectThisGroup
		    Dim tg As TestGroup = hitItem.Tag
		    tg.IncludeGroup = False
		    TestGroupList.CellCheck(RowOfTestGroup(tg), ColInclude) = tg.IncludeGroup
		    
		  Case kCMSelectAllGroupsAndTests
		    SelectAllGroups(True, True)
		    
		  Case kCMUnselectAllGroupsAndTests
		    SelectAllGroups(False, True)
		    
		  Case kCMSelectInverseGroupsAndTests
		    SelectInverseGroups(True)
		    
		  Case "Select Errors"
		    
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  base.Append(New MenuItem(kCMSelectAllGroups))
		  base.Append(New MenuItem(kCMSelectInverseGroups))
		  base.Append(New MenuItem(kCMUnselectAllGroups))
		  
		  If Me.ListIndex <> -1 Then
		    Dim tg As TestGroup
		    For row As Integer = Me.ListIndex DownTo 0
		      If Me.RowTag(row) IsA TestGroup Then
		        tg = Me.RowTag(row)
		        Exit For row
		      End If
		    Next
		    
		    base.Append(New MenuItem(MenuItem.TextSeparator))
		    
		    base.Append(New MenuItem(kCMSelectAllTests, tg))
		    base.Append(New MenuItem(kCMSelectInverseTests, tg))
		    base.Append(New MenuItem(kCMUnselectAllTests, tg))
		    
		    base.Append(New MenuItem(MenuItem.TextSeparator))
		    
		    base.Append(New MenuItem(kCMSelectThisGroup, tg))
		    base.Append(New MenuItem(kCMUnselectThisGroup, tg))
		  End If
		  
		  base.Append(New MenuItem(MenuItem.TextSeparator))
		  
		  base.Append(New MenuItem(kCMSelectAllGroupsAndTests))
		  base.Append(New MenuItem(kCMSelectInverseGroupsAndTests))
		  base.Append(New MenuItem(kCMUnselectAllGroupsAndTests))
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused column
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  If Me.Cell(row, ColResult) = TestResult.Failed Then
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
		  Select Case item
		  Case TestToolbar1.RunButton
		    RunTests
		    
		  Case TestToolbar1.StopButton
		    StopTests
		    
		  Case TestToolbar1.ExportButton
		    Dim dlg As New SaveAsDialog
		    Dim f As FolderItem
		    dlg.InitialDirectory = SpecialFolder.Documents
		    dlg.promptText = "Save results as"
		    dlg.SuggestedFileName = "results.xml"
		    dlg.Title = "Save Results"
		    dlg.Filter = "xml"
		    f = dlg.ShowModal()
		    If f <> Nil Then
		      ExportTests f.NativePath
		    End If
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.RunButton.Enabled = True
		  Me.StopButton.Enabled = False
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Controller
	#tag Event
		Sub AllTestsFinished()
		  TestsFinished()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub TestFinished(result As TestResult, group As TestGroup)
		  #Pragma Unused group
		  
		  UpdateTestResult(result)
		End Sub
	#tag EndEvent
	#tag Event
		Sub GroupFinished(group As TestGroup)
		  //
		  // A final update in case something changed after the test ran
		  //
		  
		  UpdateTestResults(group)
		  UpdateSummary
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
