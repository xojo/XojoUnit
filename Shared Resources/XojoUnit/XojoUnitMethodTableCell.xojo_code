#tag IOSContainerControl
Begin MobileTableCustomCell XojoUnitMethodTableCell
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Height          =   54.0
   Left            =   0.0
   Top             =   0.0
   UseDynamicHeight=   False
   Visible         =   True
   Width           =   206.0
   Begin MobileLabel MethodNameLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   ""
      AutoLayout      =   MethodNameLabel, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   MethodNameLabel, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   MethodNameLabel, 3, <Parent>, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   MethodNameLabel, 8, , 0, False, +1.00, 1, 1, 30, , True
      Enabled         =   True
      Height          =   30
      Left            =   20
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Untitled"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   0
      Visible         =   True
      Width           =   166
   End
   Begin MobileLabel ResultLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   ""
      AutoLayout      =   ResultLabel, 4, <Parent>, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ResultLabel, 8, , 0, False, +1.00, 1, 1, 20, , True
      AutoLayout      =   ResultLabel, 1, MethodNameLabel, 1, False, +1.00, 1, 1, 10, , True
      AutoLayout      =   ResultLabel, 2, MethodNameLabel, 2, False, +1.00, 1, 1, 0, , True
      Enabled         =   True
      Height          =   20
      Left            =   30
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Untitled"
      TextColor       =   &c00000000
      TextFont        =   "System		"
      TextSize        =   12
      Top             =   34
      Visible         =   True
      Width           =   156
   End
End
#tag EndIOSContainerControl

#tag WindowCode
#tag EndWindowCode

#tag ViewBehavior
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
		Name="Enabled"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowDynamicHeight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="480"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
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
		InitialValue="iOSCustomTableCell"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="320"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
