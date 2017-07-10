#tag Class
Protected Class XojoUnitWebControlTest
Inherits TestGroup
	#tag Method, Flags = &h0
		Sub HTMLTest()
		  // will raise SessionNotAvailableException
		  dim cc as new CustomControl
		  
		  cc.SetHTML("<div>Test</div>")
		  Assert.AreSame("<div>Test</div>", cc.GetHTML)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
