#tag MobileScreen
Begin MobileScreen XojoUnitTestDetailsView
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 2
   HasNavigationBar=   False
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 1
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c00000000
   Title           =   ""
   Top             =   0
   Begin MobileRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 8, , 0, False, +1.00, 1, 1, 218, , True
      AutoLayout      =   Rectangle1, 3, Label1, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   Rectangle1, 1, Label1, 1, False, +1.00, 1, 1, 0, , True
      BorderColor     =   &c00000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   0.0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   218
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   73
      Visible         =   True
      Width           =   984
   End
   Begin MobileLabel Label2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label2, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label2, 3, Rectangle1, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, , True
      AutoLayout      =   Label2, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label2, 1, Rectangle1, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Start:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   93
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel StartLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   StartLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   StartLabel, 1, Label2, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      AutoLayout      =   StartLabel, 11, Label2, 11, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   StartLabel, 7, , 0, False, +1.00, 2, 1, 200, 300, True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   148
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "2015-01-01 12:00PM"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   93
      Visible         =   True
      Width           =   200
   End
   Begin MobileLabel Label4
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label4, 3, StartLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label4, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label4, 1, Label2, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label4, 7, , 0, False, +1.00, 1, 1, 100, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Total:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   131
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel TestCountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   TestCountLabel, 11, Label4, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   TestCountLabel, 7, , 0, False, +1.00, 1, 1, 828, , True
      AutoLayout      =   TestCountLabel, 1, Label4, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   148
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "(run tests first)"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   131
      Visible         =   True
      Width           =   828
   End
   Begin MobileLabel Label6
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label6, 1, Label4, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label6, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label6, 3, TestCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label6, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Passed:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   169
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel PassedCountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   PassedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   PassedCountLabel, 11, Label6, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   PassedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
      AutoLayout      =   PassedCountLabel, 1, Label6, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   148
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0 (0%)"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   169
      Visible         =   True
      Width           =   187
   End
   Begin MobileLabel Label8
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label8, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label8, 3, PassedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label8, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label8, 1, Label6, 1, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Failed:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   207
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel FailedCountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   FailedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   FailedCountLabel, 11, Label8, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   FailedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
      AutoLayout      =   FailedCountLabel, 1, Label8, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   148
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0 (0%)"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   207
      Visible         =   True
      Width           =   187
   End
   Begin MobileLabel SkippedLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   SkippedLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   SkippedLabel, 3, FailedCountLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   SkippedLabel, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   SkippedLabel, 1, Label8, 1, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Skipped:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   245
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel SkippedCountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   SkippedCountLabel, 1, SkippedLabel, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      AutoLayout      =   SkippedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
      AutoLayout      =   SkippedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   SkippedCountLabel, 11, SkippedLabel, 11, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   148
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   245
      Visible         =   True
      Width           =   187
   End
   Begin MobileLabel DurationLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   DurationLabel, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   DurationLabel, 11, Label2, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   DurationLabel, 1, Rectangle1, 1, False, +1.00, 1, 1, 347, , True
      AutoLayout      =   DurationLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   367
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Duration:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   93
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel DurationValueLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   DurationValueLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
      AutoLayout      =   DurationValueLabel, 11, Label2, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   DurationValueLabel, 1, DurationLabel, 2, False, +1.00, 1, 1, *kStdControlGapH, , True
      AutoLayout      =   DurationValueLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   475
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0s"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   93
      Visible         =   True
      Width           =   187
   End
   Begin MobileLabel NotImplementedCountLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   NotImplementedCountLabel, 1, Rectangle1, 1, False, +1.00, 1, 1, 516, , True
      AutoLayout      =   NotImplementedCountLabel, 7, , 0, False, +1.00, 1, 1, 187, , True
      AutoLayout      =   NotImplementedCountLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   NotImplementedCountLabel, 11, SkippedLabel, 11, False, +1.00, 1, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   536
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   245
      Visible         =   True
      Width           =   187
   End
   Begin MobileLabel NotImplementedLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   NotImplementedLabel, 11, SkippedLabel, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   NotImplementedLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   NotImplementedLabel, 1, DurationLabel, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   NotImplementedLabel, 7, , 0, False, +1.00, 1, 1, 132, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   367
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Not Implemented:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   245
      Visible         =   True
      Width           =   132
   End
   Begin MobileLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label1, 3, <Parent>, 3, False, +1.00, 1, 1, 35, , True
      AutoLayout      =   Label1, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label1, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Overview"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   20
      TintColor       =   &c000000
      Top             =   35
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel Label11
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label11, 2, Label1, 2, False, +1.00, 1, 1, 194, , True
      AutoLayout      =   Label11, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Label11, 1, Rectangle1, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label11, 10, <Parent>, 10, False, +1.00, 1, 1, -29, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Selected Test Results"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   20
      TintColor       =   &c000000
      Top             =   340
      Visible         =   True
      Width           =   294
   End
   Begin MobileRectangle Rectangle2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle2, 2, Rectangle1, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Rectangle2, 3, Label11, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Rectangle2, 1, <Parent>, 1, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   Rectangle2, 8, , 0, False, +1.00, 1, 1, 370, , True
      BorderColor     =   &c00000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   0.0
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   370
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   378
      Visible         =   True
      Width           =   984
   End
   Begin MobileLabel TestNameLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   TestNameLabel, 7, , 0, False, +1.00, 1, 1, 190, , True
      AutoLayout      =   TestNameLabel, 3, Rectangle2, 3, False, +1.00, 1, 1, *kStdGapCtlToViewV, , True
      AutoLayout      =   TestNameLabel, 1, Rectangle2, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   TestNameLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Test Name"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   398
      Visible         =   True
      Width           =   190
   End
   Begin MobileLabel TestResultLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   TestResultLabel, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   TestResultLabel, 11, TestNameLabel, 11, False, +1.00, 1, 1, , , True
      AutoLayout      =   TestResultLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   TestResultLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   884
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Passed"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   398
      Visible         =   True
      Width           =   100
   End
   Begin MobileLabel Label13
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label13, 7, , 0, False, +1.00, 1, 1, 75, , True
      AutoLayout      =   Label13, 3, TestResultLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label13, 1, TestNameLabel, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label13, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Duration:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   436
      Visible         =   True
      Width           =   75
   End
   Begin MobileLabel TestDurationLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   TestDurationLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   TestDurationLabel, 1, Label13, 2, False, +1.00, 2, 1, *kStdControlGapH, , True
      AutoLayout      =   TestDurationLabel, 11, Label13, 11, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestDurationLabel, 2, Rectangle2, 2, False, +1.00, 1, 1, -*kStdControlGapH, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   123
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "0s"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   436
      Visible         =   True
      Width           =   873
   End
   Begin MobileLabel Label12
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AutoLayout      =   Label12, 7, , 0, False, +1.00, 1, 1, 100, , True
      AutoLayout      =   Label12, 3, TestDurationLabel, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   Label12, 1, Label13, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label12, 8, , 0, False, +1.00, 1, 1, 30, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   30
      Left            =   40
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Messages:"
      TextColor       =   &c00000000
      TextFont        =   "System Bold		"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   474
      Visible         =   True
      Width           =   100
   End
   Begin MobileTextArea TestResultsArea
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   0
      AllowAutoCorrection=   False
      AllowSpellChecking=   False
      AutoCapitalizationType=   0
      AutoLayout      =   TestResultsArea, 2, TestResultLabel, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestResultsArea, 3, Label12, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      AutoLayout      =   TestResultsArea, 1, Label12, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TestResultsArea, 8, , 0, False, +1.00, 1, 1, 200, , True
      BorderStyle     =   0
      ControlCount    =   0
      Enabled         =   True
      Height          =   200
      Left            =   40
      LockedInPosition=   False
      ReadOnly        =   True
      Scope           =   0
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "Custom	Menlo	Menlo-Regular"
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   512
      Visible         =   True
      Width           =   944
   End
   Begin MobileProgressWheel ProgressWheel1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ProgressWheel1, 2, Rectangle2, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ProgressWheel1, 7, , 0, True, +1.00, 4, 1, 24, , True
      AutoLayout      =   ProgressWheel1, 3, Label1, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ProgressWheel1, 8, , 0, True, +1.00, 4, 1, 24, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   24
      Left            =   980
      LockedInPosition=   False
      Scope           =   0
      Shade           =   0
      TintColor       =   &c000000
      Top             =   35
      Visible         =   False
      Width           =   24
   End
End
#tag EndMobileScreen

#tag WindowCode
#tag EndWindowCode

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
