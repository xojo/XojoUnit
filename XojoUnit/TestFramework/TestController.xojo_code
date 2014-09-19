#tag Class
Protected Class TestController
	#tag Method, Flags = &h0
		Sub AddGroup(group As TestGroup)
		  mTestGroups.Append(group)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EndTimer()
		  mDuration = (Microseconds-mTimer) / 1000000
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTestGroups()
		  InitializeTestGroups
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunTestGroups()
		  StartTimer
		  For Each tg As TestGroup In mTestGroups
		    tg.Start
		  Next
		  EndTimer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  RunTestGroups
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartTimer()
		  mTimer = Microseconds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestGroups() As TestGroup()
		  Return mTestGroups
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event InitializeTestGroups()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    totalCount = totalCount + tg.TestCount
			  Next
			  
			  Return totalCount
			End Get
		#tag EndGetter
		AllTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mDuration
			End Get
		#tag EndGetter
		Duration As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mFailedCount
			End Get
		#tag EndGetter
		FailedCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTestGroups.Ubound + 1
			End Get
		#tag EndGetter
		GroupCount As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDuration As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFailedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSkippedCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTestGroups() As TestGroup
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPassedCount
			End Get
		#tag EndGetter
		PassedCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim cnt As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    If tg.IncludeGroup Then cnt = cnt + 1
			  Next
			  
			  Return cnt
			End Get
		#tag EndGetter
		RunGroupCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  mPassedCount = 0
			  mFailedCount = 0
			  mSkippedCount = 0
			  
			  Dim totalCount As Integer
			  
			  For Each tg As TestGroup In mTestGroups
			    totalCount = totalCount + tg.RunTestCount
			    
			    mPassedCount = mPassedCount + tg.PassedTestCount
			    mFailedCount = mFailedCount + tg.FailedTestCount
			    mSkippedCount = mSkippedCount + tg.SkippedTestCount
			  Next
			  
			  Return totalCount
			End Get
		#tag EndGetter
		RunTestCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSkippedCount
			End Get
		#tag EndGetter
		SkippedCount As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Duration"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupCount"
			Group="Behavior"
			Type="Integer"
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
			Name="PassedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunGroupCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
