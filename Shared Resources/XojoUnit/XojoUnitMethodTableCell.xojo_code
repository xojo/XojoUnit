#tag IOSContainerControl
Begin iOSCustomTableCell XojoUnitMethodTableCell
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Height          =   54.0
   Left            =   0.0
   Top             =   0.0
   Visible         =   True
   Width           =   206.0
   Begin iOSLabel MethodNameLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   MethodNameLabel, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, 
      AutoLayout      =   MethodNameLabel, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, 
      AutoLayout      =   MethodNameLabel, 3, <Parent>, 3, False, +1.00, 1, 1, 0, 
      AutoLayout      =   MethodNameLabel, 8, , 0, False, +1.00, 1, 1, 30, 
      Enabled         =   True
      Height          =   30.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Untitled"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   0
      Visible         =   True
      Width           =   166.0
   End
   Begin iOSLabel ResultLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ResultLabel, 4, <Parent>, 4, False, +1.00, 1, 1, 0, 
      AutoLayout      =   ResultLabel, 8, , 0, False, +1.00, 1, 1, 20, 
      AutoLayout      =   ResultLabel, 1, MethodNameLabel, 1, False, +1.00, 1, 1, 10, 
      AutoLayout      =   ResultLabel, 2, MethodNameLabel, 2, False, +1.00, 1, 1, 0, 
      Enabled         =   True
      Height          =   20.0
      Left            =   30
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Untitled"
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   "System		"
      TextSize        =   12
      Top             =   34
      Visible         =   True
      Width           =   156.0
   End
End
#tag EndIOSContainerControl

#tag WindowCode
#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="AccessibilityHint"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		InitialValue="480"
		Type="Double"
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
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue="iOSCustomTableCell"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		InitialValue="320"
		Type="Double"
	#tag EndViewProperty
#tag EndViewBehavior
