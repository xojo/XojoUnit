#tag IOSView
Begin iosView XojoUnitTestDetailsView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabTitle        =   ""
   Title           =   ""
   Top             =   0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 1, 1, 100, 
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 35, 
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Overview"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   35
      Visible         =   True
      Width           =   100.0
   End
   Begin iOSRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   Rectangle1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Rectangle1, 1, Label1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Rectangle1, 8, , 0, False, +1.00, 1, 1, 218, 
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &cFFFFFF00
      Height          =   218.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
      Begin iOSLabel Label2
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Label2, 3, Rectangle1, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, 
         AutoLayout      =   Label2, 1, Rectangle1, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
         AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Start:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel StartLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   StartLabel, 11, Label2, 11, False, +1.00, 2, 1, 0, 
         AutoLayout      =   StartLabel, 1, Label2, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   StartLabel, 7, , 0, False, +1.00, 2, 1, 200, 300
         AutoLayout      =   StartLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "2015-01-01 12:00PM"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   200.0
      End
      Begin iOSLabel Label4
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label4, 1, Label2, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label4, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Label4, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Label4, 3, StartLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Total:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   131
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel TestCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestCountLabel, 7, , 0, False, +1.00, 1, 1, 187, 
         AutoLayout      =   TestCountLabel, 11, Label4, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   TestCountLabel, 1, Label4, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   TestCountLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "100 tests in 10 groups"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   131
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label6
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label6, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Label6, 3, TestCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   Label6, 1, Label4, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label6, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Passed:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   169
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel PassedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   PassedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, 
         AutoLayout      =   PassedCountLabel, 11, Label6, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   PassedCountLabel, 1, Label6, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   PassedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   169
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label8
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label8, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Label8, 3, PassedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   Label8, 1, Label6, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label8, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Failed:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   207
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel FailedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   FailedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, 
         AutoLayout      =   FailedCountLabel, 11, Label8, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   FailedCountLabel, 1, Label8, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   FailedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   207
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label10
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label10, 7, , 0, False, +1.00, 1, 1, 100, 
         AutoLayout      =   Label10, 3, FailedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   Label10, 1, Label8, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label10, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Skipped:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   245
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel SkippedCountLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   SkippedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, 
         AutoLayout      =   SkippedCountLabel, 11, Label10, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   SkippedCountLabel, 1, Label10, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   SkippedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   148
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0 (0%)"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   245
         Visible         =   True
         Width           =   187.0
      End
      Begin iOSLabel Label14
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label14, 1, Rectangle1, 1, False, +1.00, 1, 1, 347, 
         AutoLayout      =   Label14, 11, Label2, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label14, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Label14, 7, , 0, False, +1.00, 1, 1, 100, 
         Enabled         =   True
         Height          =   30.0
         Left            =   367
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "Duration:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel DurationLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   DurationLabel, 1, Label14, 2, False, +1.00, 1, 1, *kStdControlGapH, 
         AutoLayout      =   DurationLabel, 11, Label2, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   DurationLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   DurationLabel, 7, , 0, False, +1.00, 1, 1, 187, 
         Enabled         =   True
         Height          =   30.0
         Left            =   475
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   0
         Text            =   "0s"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   93
         Visible         =   True
         Width           =   187.0
      End
   End
   Begin iOSLabel Label11
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label11, 1, Rectangle1, 1, False, +1.00, 1, 1, 0, 
      AutoLayout      =   Label11, 8, , 0, False, +1.00, 1, 1, 30, 
      AutoLayout      =   Label11, 10, <Parent>, 10, False, +1.00, 1, 1, -29, 
      AutoLayout      =   Label11, 2, Label1, 2, False, +1.00, 1, 1, 194, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Selected Test Results"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   196
      Visible         =   True
      Width           =   294.0
   End
   Begin iOSRectangle Rectangle2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle2, 1, <Parent>, 1, False, +1.00, 1, 1, 20, 
      AutoLayout      =   Rectangle2, 3, Label11, 4, False, +1.00, 1, 1, *kStdControlGapV, 
      AutoLayout      =   Rectangle2, 8, , 0, False, +1.00, 1, 1, 370, 
      AutoLayout      =   Rectangle2, 2, Rectangle1, 2, False, +1.00, 1, 1, 0, 
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &cFFFFFF00
      Height          =   370.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      Top             =   234
      Visible         =   True
      Width           =   280.0
      Begin iOSLabel TestNameLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestNameLabel, 1, Rectangle2, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
         AutoLayout      =   TestNameLabel, 3, Rectangle2, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, 
         AutoLayout      =   TestNameLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   TestNameLabel, 7, , 0, False, +1.00, 1, 1, 190, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Test Name"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   254
         Visible         =   True
         Width           =   190.0
      End
      Begin iOSLabel TestResultLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestResultLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
         AutoLayout      =   TestResultLabel, 11, TestNameLabel, 11, False, +1.00, 1, 1, , 
         AutoLayout      =   TestResultLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   TestResultLabel, 7, , 0, False, +1.00, 1, 1, 100, 
         Enabled         =   True
         Height          =   30.0
         Left            =   180
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Passed"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   254
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSLabel Label13
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label13, 1, TestNameLabel, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label13, 3, TestResultLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   Label13, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Label13, 7, , 0, False, +1.00, 1, 1, 75, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Duration:"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   292
         Visible         =   True
         Width           =   75.0
      End
      Begin iOSLabel TestDurationLabel
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestDurationLabel, 11, Label13, 11, False, +1.00, 1, 1, 0, 
         AutoLayout      =   TestDurationLabel, 1, Label13, 2, False, +1.00, 2, 1, *kStdControlGapH, 
         AutoLayout      =   TestDurationLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdControlGapH, 
         AutoLayout      =   TestDurationLabel, 8, , 0, False, +1.00, 1, 1, 30, 
         Enabled         =   True
         Height          =   30.0
         Left            =   123
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "0s"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   292
         Visible         =   True
         Width           =   169.0
      End
      Begin iOSLabel Label12
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   Label12, 1, Label13, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   Label12, 3, TestDurationLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   Label12, 8, , 0, False, +1.00, 1, 1, 30, 
         AutoLayout      =   Label12, 7, , 0, False, +1.00, 1, 1, 100, 
         Enabled         =   True
         Height          =   30.0
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   "Messages"
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   330
         Visible         =   True
         Width           =   100.0
      End
      Begin iOSTextArea TestResultsArea
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   TestResultsArea, 1, Label12, 1, False, +1.00, 1, 1, 0, 
         AutoLayout      =   TestResultsArea, 3, Label12, 4, False, +1.00, 1, 1, *kStdControlGapV, 
         AutoLayout      =   TestResultsArea, 8, , 0, False, +1.00, 1, 1, 200, 
         AutoLayout      =   TestResultsArea, 2, TestResultLabel, 2, False, +1.00, 1, 1, 0, 
         Editable        =   True
         Height          =   200.0
         KeyboardType    =   "0"
         Left            =   40
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle2"
         Scope           =   0
         Text            =   ""
         TextAlignment   =   "0"
         TextColor       =   &c00000000
         TextFont        =   ""
         TextSize        =   0
         Top             =   368
         Visible         =   True
         Width           =   240.0
      End
   End
End
#tag EndIOSView

#tag WindowCode
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
