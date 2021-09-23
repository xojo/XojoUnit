#tag Class
Protected Class OptionParser
	#tag Method, Flags = &h0
		Sub AddOption(o As Option)
		  // Add an option to the parser.
		  //
		  // ### Parameters
		  // * `o` - `Option` to add
		  //
		  // ### Exceptions
		  //
		  // `OptionParserException` can be thrown if one attempts to add an option with the same
		  // short or long key as an existing option.
		  
		  // Validation
		  If o.ShortKey <> "" And Dict.HasKey(o.ShortKey.Asc) Then
		    Raise New OptionParserException("You can't add the same short key more than once: " + o.ShortKey)
		  End If
		  If o.LongKey <> "" And Dict.HasKey(o.LongKey) Then
		    Raise New OptionParserException("You can't add the same long key more than once: " + o.LongKey)
		  End If
		  If o.ShortKey = "?" Then
		    Raise New OptionParserException("You can't add the key ""?"" This means ""help"" and has already been added for you")
		  End If
		  
		  Options.Add o
		  
		  If o.ShortKey <> "" Then
		    Dict.Value(o.ShortKey.Asc) = o
		  End If
		  
		  If o.LongKey <> "" Then
		    Dict.Value(o.LongKey) = o
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Arguments() As String()
		  // Get the original arguments passed to the `OptionParser` as
		  // a `String` array.
		  
		  Return CopyStringArray(OriginalArgs)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ArrayValue(key As Variant) As Variant()
		  //
		  // Retrieve the contents of an option as a `Variant` array. The contents
		  // of the array are of course a `Variant` however the actual value assigned to the
		  // `Variant` is that of the options `OptionType`. For example, if this option is
		  // of the `OptionType.Integer` value, then the resulting array will be an array
		  // containing parsed `Integer` values from the command line. The same is true for
		  // any of the `OptionType` values.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  //
		  // ### Notes
		  //
		  // The option needs to have the `IsArray` property set to `True` to utilize this method.
		  //
		  
		  Var v() As Variant
		  Var o As Option = OptionValue(key)
		  
		  If Not (o Is Nil) Then
		    v = o.Value
		  End If
		  
		  Return v
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BooleanValue(key As Variant, defaultValue As Boolean = False) As Boolean
		  //
		  // Retrieve the contents of an option as a `Boolean` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.Boolean`.
		  //
		  
		  Var o As Option = OptionValue(key)
		  Return If(o Is Nil Or o.WasSet = False, defaultValue, o.Value.BooleanValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetHasGUI)
		Shared Function CommandLineArgs() As String()
		  // Return an array of command-line arguments
		  
		  const kDebugDeclares = false
		  
		  Var args() as string
		  
		  #if DebugBuild and not kDebugDeclares then 
		    //
		    // Not perfect, but will emulate what you'll get in the built app
		    //
		    
		    args = ParseStringValue(System.CommandLine)
		    
		  #elseif TargetMacOS then
		    const kCocoaLib = "Cocoa.framework"
		    
		    declare function NSClassFromString lib kCocoaLib (aClassName as CFStringRef) as Ptr
		    declare function defaultCenter lib kCocoaLib selector "processInfo" (class_id as Ptr) as Ptr
		    declare function arguments lib kCocoaLib selector "arguments" (obj_id as Ptr) as Ptr
		    declare function m_count lib kCocoaLib selector "count" (obj as Ptr) as UInteger
		    declare function objectAtIndex lib kCocoaLib selector "objectAtIndex:" (theArray as Ptr, idx as Integer) as CFStringRef
		    
		    static c as Ptr = defaultCenter(NSClassFromString("NSProcessInfo"))
		    Var nsArrayRef as Ptr = arguments(c)
		    Var ub as integer = m_count(nsArrayRef) - 1
		    for i as integer = 0 to ub
		      Var s as string = objectAtIndex(nsArrayRef, i)
		      args.Add s
		    next
		    
		  #elseif TargetWin32 then
		    //
		    // Windows and Linux code from Thomas Tempelmann
		    //
		    
		    declare function GetCommandLineW lib "kernel32.dll" () as Ptr
		    declare function CommandLineToArgvW lib "shell32.dll" (lpCmdLine As Ptr, ByRef pNumArgs As Integer) As Ptr
		    declare sub LocalFree Lib "kernel32.dll" (p as Ptr)
		    
		    Var cl as Ptr = GetCommandLineW()
		    Var n as Integer
		    Var argList as Ptr = CommandLineToArgvW (cl, n)
		    for idx as Integer = 0 to n-1
		      Var mb as MemoryBlock = argList.Ptr(idx*4)
		      // mb points to a UTF16 0-terminated string. It seems we have to scan its length ourselves now.
		      Var len as Integer
		      while mb.UInt16Value(len) <> 0
		        len = len + 2
		      wend
		      Var s as String = mb.StringValue(0,len).DefineEncoding(Encodings.UTF16)
		      s = s.ConvertEncoding(Encodings.UTF8)
		      args.Add s
		    next
		    LocalFree(argList)
		    
		  #elseif TargetLinux then
		    // read from "/proc/self/cmdline", each item is 0-terminated
		    
		    const SystemLib = "libc.so"
		    declare function open lib SystemLib (path as CString, flags as Integer) As Integer
		    declare function read lib SystemLib (fd as Integer, data as Ptr, n as Integer) as Integer
		    
		    // first, read the entire cmdline into a string
		    Var fd as Integer = open ("/proc/self/cmdline", 0)
		    Var s as String
		    do
		      Var mb as new MemoryBlock(1000)
		      Var n as Integer = read (fd, mb, mb.Size)
		      s = s + mb.StringValue (0, n)
		      if n < mb.Size then exit
		    loop
		    args = s.Split(Chr(0))
		    call args.Pop // remove last array item because of extra 00 byte at end of string
		    
		    for i as integer = 0 to args.LastIndex
		      Var thisArg as string = args(i)
		      if Encodings.UTF8.IsValidData(thisArg) then
		        args(i) = thisArg.DefineEncoding(Encodings.UTF8)
		      else
		        args(i) = thisArg.DefineEncoding(Encodings.ISOLatin1)
		      end if
		    next
		    
		  #endif
		  
		  return args
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(appName As String = "", appDescription As String = "")
		  //
		  // Construct a new `OptionParser`
		  //
		  // ### Parameters
		  //
		  // * `appName` - Name of the application to display when showing help.
		  // * `appDescription` - Description of the application to display when showing help.
		  //
		  // For more inforation on the parameters, see the two properties `AppName` and `AppDescription`.
		  //
		  // ### Notes
		  //
		  // When creating a new `OptionParser` the "Help" option is added automatically. The "Help"
		  // option uses the short key `h` and the long key `help`, thus they can not be used by
		  // the application.
		  //
		  
		  Dict = New Dictionary
		  
		  Self.AppName = If(appName = "", App.ExecutableFile.Name, appName)
		  Self.AppDescription = appDescription
		  
		  Var helpOption As New Option("h", "help", "Show help", Option.OptionType.Boolean)
		  AddOption  helpOption
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CopyStringArray(arr() As String) As String()
		  Var result() As String
		  If arr.LastIndex = -1 Then Return result
		  
		  ReDim result(arr.LastIndex)
		  For i As Integer = 0 to arr.LastIndex
		    result(i) = arr(i)
		  Next i
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateValue(key As Variant, defaultValue As Date = Nil) As Date
		  //
		  // Retrieve the contents of an option as a `Date` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.Date`.
		  //
		  // **WARNING**:
		  // If the `Option.IsValidDateRequired` is set to `True` then the value supplied must
		  // pass the test of `ParseDate()`. If, however, `Option.IsValidDateRequired` is
		  // set to `False` and `ParseDate()` can not handle the date properly, the value is
		  // recorded as a `String` not a `Date`.
		  //
		  // This behavior is likely to change in the future. If one requests the type be a
		  // valid date, then the value will have to pass as a valid date or a `OptionInvalidKeyValueException`
		  // will be raised to indicate that an invalid option value has been supplied.
		  //
		  
		  Var v As Variant = Value(key)
		  Return If(v Is Nil, defaultValue, v.DateValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleValue(key As Variant, defaultValue As Double = 0.0) As Double
		  //
		  // Retrieve the contents of an option as a `Double` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.Double`.
		  //
		  
		  Var v As Variant = Value(key)
		  Return If(v Is Nil, defaultValue, v.DoubleValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExpandArgs(args() As String) As String()
		  // Takes arguments that may be chained and expands them
		  
		  Var expandedArgs() As String
		  
		  For argIndex As Integer = 0 To args.LastIndex
		    Var arg As String = args(argIndex)
		    
		    If arg = "--" Then
		      // Start of our "forced" extras
		      For i As Integer = argIndex To args.LastIndex
		        expandedArgs.Add args(i)
		      Next
		      
		      Exit For argIndex
		      
		    ElseIf arg.Left(2) = "--" Then
		      expandedArgs.Add arg
		      
		    ElseIf arg.Left(1) = "-" And arg.Length > 2 Then
		      arg = arg.Middle(1) // Chop off the hyphen
		      Var value As String
		      Var equalIndex As Integer = arg.IndexOf(1, "=") // If they started the switch with "=", that doesn't count
		      
		      If equalIndex <> -1 Then
		        value = arg.Middle(equalIndex)
		        arg = arg.Left(equalIndex)
		      End if
		      
		      Var switches() As String = arg.Split("")
		      Var lastIndex As Integer = switches.LastIndex - 1
		      For i As Integer = 0 To lastIndex
		        expandedArgs.Add "-" + switches(i)
		      Next i
		      expandedArgs.Add "-" + switches(switches.LastIndex) + value
		      
		    Else // Append as-is
		      expandedArgs.Add arg
		      
		    End If
		  Next argIndex
		  
		  Return expandedArgs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileValue(key As Variant, defaultValue As FolderItem = Nil) As FolderItem
		  //
		  // Retrieve the contents of an option as a `FolderItem` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.File` or `OptionType.Folder`.
		  //
		  // **WARNING**:
		  // This will likely be renamed to `FolderItemValue` in the future.
		  //
		  
		  Var v As Variant = Value(key)
		  Return If(v Is Nil, defaultValue, FolderItem(v))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetRelativeFolderItem(path As String, relativeTo As FolderItem = Nil) As FolderItem
		  Var prefix As String = ""
		  
		  #If TargetWin32 Then
		    Const pathSep = "\"
		    
		    //
		    // Maybe what is passed isn't actually a relative path
		    //
		    
		    If path.Middle(1, 1) = ":" Then
		      Return New FolderItem(path, FolderItem.PathModes.Shell)
		    End If
		    
		    If path.Left(1) = pathSep Then
		      relativeTo = New FolderItem(SpecialFolder.CurrentWorkingDirectory.NativePath.Left(3))
		    End If
		    
		  #Else
		    Const pathSep = "/"
		    
		    //
		    // Resolve home
		    //
		    if path.Left(2) = "~/" then
		      path = SpecialFolder.UserHome.NativePath + path.Middle(1)
		    end if
		    
		    //
		    // Maybe what is passed isn't actually a relative path
		    //
		    
		    If path.Left(1) = pathSep Then
		      Return new FolderItem(path, FolderItem.PathModes.Shell)
		    End If
		    
		    prefix = pathSep
		  #EndIf
		  
		  //
		  // OK, seems to be a relative path
		  //
		  
		  If relativeTo = Nil Then
		    relativeTo = SpecialFolder.CurrentWorkingDirectory
		  End If
		  
		  path = relativeTo.NativePath + pathSep + path
		  Var newParts() As String
		  
		  Var pathParts() As String = path.Split(pathSep)
		  For i As Integer = 0 to pathParts.LastIndex
		    Var p As String = pathParts(i)
		    If p = "" Then
		      // Can happen on Windows since it appends a pathSep onto the end of NativePath
		      // if relativeTo is a folder.
		      
		    ElseIf p = "." Then
		      // Skip this path component
		      
		    ElseIf p = ".." Then
		      // Remove the last path component from newParts
		      If newParts.LastIndex > -1 Then
		        newParts.RemoveAt newParts.LastIndex
		      End If
		      
		    Else
		      // Nothing special about this path component
		      newParts.Add p
		    End If
		  Next
		  
		  path = prefix + String.FromArray(newParts, pathSep)
		  
		  Return New FolderItem(path, FolderItem.PathModes.Shell)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerValue(key As Variant, defaultValue As Integer = 0) As Integer
		  //
		  // Retrieve the contents of an option as a `Integer` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.Integer`.
		  //
		  
		  Var v As Variant = Value(key)
		  Return If(v Is Nil, defaultValue, v.IntegerValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetHasGUI)
		Private Shared Function IsQuoteCharacter(char As String) As Boolean
		  #if TargetWin32 then
		    return (char = """")
		  #else
		    return (char = """" or char = "'")
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function KeyWithDashes(key As String) As String
		  // Takes a key and converts it back to its single or double-dash version
		  
		  key = key.Trim
		  
		  If key = "" Then
		    Return ""
		    
		  ElseIf key.Left(1) = "-" Then // Already there
		    Return key
		    
		  ElseIf key.Length = 1 Then
		    Return "-" + key
		    
		  Else
		    Return "--" + key
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OptionValue(key As String) As Option
		  //
		  // Retrieve the actual `Option` object associated with the `key`.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  //
		  // ### Notes
		  //
		  // Once `Parse` has been called, changing parameters in the `Option` object will
		  // have no bearing or change.
		  //
		  // One can use this to check the `WasSet` property of the `Option` class.
		  //
		  
		  Var lookupKey As Variant = key
		  
		  If Not Dict.HasKey(lookupKey) Then
		    If key.Length = 1 Then
		      lookupKey = key.Asc
		    End If
		  End If
		  
		  Return Dict.Lookup(lookupKey, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PadRight(s as String, width as Integer, padding as String = " ") As String
		  // Pad a string to at least 'width' characters, by adding padding characters
		  // to the right side of the string.
		  
		  Var length as Integer
		  length = s.Length
		  if length >= width then 
		    return s
		  end if
		  
		  Var mostToRepeat as Integer
		  mostToRepeat = Ceiling((width - length) / padding.Length)
		  return s + Repeat(padding, mostToRepeat).Middle(0, width-length)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(args() As String, firstArgIsExecutable As Boolean = True)
		  //
		  // Parse the arguments
		  //
		  // ### Parameters
		  // 
		  // * `args()` - Command line arguments already split into an array. Generally this will be used
		  //   with a `ConsoleApplication` since it's `Run` event passes in command line parameters this way.
		  //
		  // ### Exceptions
		  //
		  // * `OptionUnrecognizedKeyException` can be raised in the event an invalid argument is supplied.
		  //    For example, the user types `myprog --coun=12` when it should have been `--count=12`.
		  // * `OptionInvalidKeyValueException` can be raised in the event a valid argument is supplied with
		  //   an invalid value. For example `--count=John` where `count` was suppose to be an `Integer`.
		  // * `OptionParserException` can be raised in the event that the application expects at least X
		  //   extra items but the user did not supply at least X extra items.
		  //
		  
		  OriginalArgs = CopyStringArray(args)
		  
		  args = ExpandArgs(args)
		  
		  Var restAreExtras As Boolean
		  Var optIdx As Integer = -1
		  
		  While optIdx < args.LastIndex // args can be rewritten in the loop
		    optIdx = optIdx + 1
		    
		    //
		    // If the first argument is the executable,
		    // we simply ignore it
		    //
		    if optIdx = 0 and firstArgIsExecutable then
		      continue while
		    end if
		    
		    If restAreExtras Then
		      Extra.Add args(optIdx)
		      
		      Continue
		    End If
		    
		    Var arg As String = args(optIdx)
		    
		    If arg = "" Then
		      Continue
		    End If
		    
		    If arg = "--" Then
		      restAreExtras = True
		      
		      Continue
		    End If
		    
		    Var key As String
		    Var value As String
		    
		    // Special case:
		    // -? is a synonym for help
		    If arg.Left(2) = "-?" Then
		      arg = "-h" + arg.Middle(2)
		    End If
		    
		    If arg.Left(2) = "--" Then
		      key = arg.Middle(2)
		      
		    ElseIf arg.Left(1) = "-" Then
		      key = arg.Middle(1)
		      
		    Else
		      If arg <> "" Then
		        Extra.Add arg
		      End If
		      Continue
		    End If
		    
		    Var equalIdx As Integer = key.IndexOf(1, "=") // Start at the second character
		    Var hasEquals as boolean
		    If equalIdx <> -1 Then
		      hasEquals = true
		      value = key.Middle(equalIdx + 1)
		      key = key.Left(equalIdx)
		    End If
		    
		    Var opt As Option = OptionValue(key)
		    If opt = Nil Then
		      //
		      // Maybe the user has specified --no-option which should set a
		      // boolean value to False
		      //
		      
		      If key.Left(3) <> "no-" Then
		        RaiseUnrecognizedKeyException(key)
		      End If
		      
		      key = key.Middle(3)
		      opt = OptionValue(key)
		      
		      If opt = Nil Or opt.Type <> Option.OptionType.Boolean Then
		        RaiseUnrecognizedKeyException(key)
		      Else
		        value = "No"
		      End If
		    End If
		    
		    If value <> "" or hasEquals Then
		      // We already got the value, ignore everything else in this If
		      
		    ElseIf opt.Type = Option.OptionType.Boolean Then
		      value = "Yes"
		      
		    ElseIf Not Self.HelpRequested Then
		      // This requires a parameter and the parameter value was not
		      // given as an = assignment, thus it must be the next argument
		      // But if help was requested, it doesn't matter, so we skip this.
		      // If a value was given next, it will just be added to Extras.
		      
		      If optIdx = args.LastIndex Then
		        RaiseInvalidKeyValueException(key, kMissingKeyValue)
		      End If
		      
		      optIdx = optIdx + 1
		      value = args(optIdx)
		    End If
		    
		    opt.HandleValue(value)
		  Wend
		  
		  //
		  // Validate Parsed Values
		  // but only if help wasn't requested.
		  // If it was, all bets are off and up to the caller to validate.
		  //
		  
		  If Not Self.HelpRequested Then
		    If ExtrasRequired > 0 And Extra.LastIndex < (ExtrasRequired - 1) Then
		      Raise New OptionParserException("Insufficient extras specified")
		    End If
		    
		    For Each o As Option In Options
		      If Not o.IsValid Then
		        Var key As String
		        If o.LongKey <> "" Then
		          key = o.LongKey
		        Else
		          key = o.ShortKey
		        End If
		        
		        If o.IsRequired And o.Value = Nil Then
		          RaiseMissingKeyException(key)
		        Else
		          RaiseInvalidKeyValueException(key, kInvalidKeyValue + " '" + o.Value.StringValue + "'")
		        End If
		      End If
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetHasGUI)
		Private Shared Sub ParseRestOfString(value As String, appendTo() As String)
		  value = value.Trim
		  if value = "" then
		    return
		  end if
		  
		  if value.Encoding = nil then
		    #if TargetMacOS then
		      value = value.DefineEncoding(Encodings.MacRoman)
		    #else
		      value = value.DefineEncoding(Encodings.ISOLatin1)
		    #endif
		  end if
		  
		  value = value.ConvertEncoding( Encodings.UTF8 )
		  
		  Var allChars() as string = value.Split("")
		  Var thisChunk() as string
		  Var inQuote as boolean
		  Var quoteChar as string
		  
		  Var charIndex as integer
		  while charIndex <= allChars.LastIndex
		    Var thisChar as string = allChars(charIndex)
		    
		    if thisChar = "\" and charIndex < allChars.LastIndex then
		      thisChunk.Add allChars(charIndex + 1)
		      charIndex = charIndex + 1
		      
		    elseif inQuote and thisChar = quoteChar then
		      inQuote = false
		      
		    elseif inQuote then
		      thisChunk.Add thisChar
		      
		    elseif IsQuoteCharacter(thisChar) then
		      inQuote = true
		      quoteChar = thisChar
		      
		    elseif thisChar = " " then
		      if thisChunk.LastIndex <> -1 then
		        appendTo.Add String.FromArray(thisChunk, "")
		        redim thisChunk(-1)
		      end if
		      
		    else // Just a character
		      
		      thisChunk.Add thisChar
		      
		    end if
		    
		    charIndex = charIndex + 1
		  wend
		  
		  if thisChunk.LastIndex <> -1 then
		    appendTo.Add String.FromArray(thisChunk, "")
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21, CompatibilityFlags = (TargetHasGUI)
		Private Shared Function ParseStringValue(value As String) As String()
		  //
		  // Parse the arguments into a `String` array of parameters, then pass the contents of that
		  // array to the 'real' `Parse(args() As String)` method.
		  //
		  // ### Parameters
		  //
		  // * `value` - Command line arguments contained in a single line string. This is 
		  //   used in a Desktop via a call to `System.CommandLine` as a Desktop
		  //   has no direct access to the `args()` parameter that a `ConsoleApplication`
		  //   does.
		  //
		  // ### Notes
		  //
		  // See `Parse(args() As String)` for more detailed information
		  //
		  
		  Var matches() As String
		  
		  Var rx As New RegEx
		  
		  '#if TargetWin32 then
		  '
		  '// Code from Michel Bujardet (https://forum.xojo.com/14420-system-commandline)
		  '
		  'rx.SearchPattern = "(""[^""]+""|[^\s""]+)"
		  '
		  'Var match As RegExMatch = rx.Search(value)
		  '
		  'While match <> Nil
		  'matches.Add ReplaceAll(match.SubExpressionString(1), chr(34), "")
		  'match = rx.Search()
		  'Wend
		  '
		  '#else // TargetDesktop
		  
		  //
		  // We have to peel off of the executable first
		  //
		  
		  Var rest as string
		  
		  Var myPath as string = App.ExecutableFile.NativePath
		  Var pattern as string = """?(\Q" + myPath.ReplaceAllB( "\E", "\\EE\Q" ) + "\E)""? (.*)"
		  
		  rx.SearchPattern = pattern
		  Var match as RegExMatch = rx.Search(value)
		  
		  if match IsA RegExMatch then
		    matches.Add match.SubExpressionString(1)
		    rest = match.SubExpressionString(2)
		    ParseRestOfString(rest, matches)
		  else
		    matches.Add value
		  end if
		  
		  '#endif
		  
		  return(matches)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RaiseInvalidKeyValueException(key As String, type As String)
		  Raise New OptionInvalidKeyValueException("Invalid key value: " + KeyWithDashes(key) + " (" + type + ")")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RaiseMissingKeyException(key As String)
		  
		  Raise New OptionMissingKeyException("Missing option: " + KeyWithDashes(key))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RaiseUnrecognizedKeyException(key As String)
		  Raise New OptionUnrecognizedKeyException("Unrecognized key: " + KeyWithDashes(key))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Repeat(s as String, repeatCount as Integer) As String
		  // Concatenate a string to itself 'repeatCount' times.
		  // Example: Repeat("spam ", 5) = "spam spam spam spam spam ".
		  
		  #pragma disablebackgroundTasks
		  
		  if repeatCount <= 0 then return ""
		  if repeatCount = 1 then return s
		  
		  // Implementation note: normally, you don't want to use string concatenation
		  // for something like this, since that creates a new string on each operation.
		  // But in this case, we can double the size of the string on iteration, which
		  // quickly reduces the overhead of concatenation to insignificance.  This method
		  // is faster than any other we've found (short of declares, which were only
		  // about 2X faster and were quite platform-specific).
		  
		  Var desiredLenB As Integer = s.Bytes * repeatCount
		  Var output as String = s
		  Var cutoff as Integer = (desiredLenB + 1) \ 2
		  Var curLenB as Integer = output.Bytes
		  
		  while curLenB < cutoff
		    output = output + output
		    curLenB = curLenB + curLenB
		  wend
		  
		  output = output + output.LeftBytes(desiredLenB - curLenB)
		  return output
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowHelp(sectionTitle As String = "Help")
		  //
		  // Display a nicely formatted help message including various pieces of meta
		  // data such as `AppName`, `AppDescription` and `AdditionalHelpNotes`. Mixed
		  // in there are of course all of the possible options with their short and long
		  // keys, value types (if any) and description
		  //
		  //
		  // ### Parameters
		  // * `sectionTitle` - One can overide the section title in case they have multiple
		  //   help screen outputs or have utilized more than one `OptionParser` for some
		  //   advanced techniques.
		  //
		  // ### Notes
		  //
		  // Right now there is not a nice GUI for displaying the command line help for
		  // a GUI application or a Web application.
		  //
		  // * For a console application, the output is `Print` to the screen.
		  // * For a GUI application, the output is given to `MsgBox`
		  // * For a Web application, help is not currently displayed.
		  //
		  // **WARNING**: It is likely that for console applications the call to `Print`
		  // will changes to `StdErr.Write` instead.
		  //
		  
		  Const kAlignCol = 20
		  Const kLineLength = 72
		  
		  Static descIndent As String = kIndentPrefix + Repeat(" ", kAlignCol + 1)
		  
		  Var helpLines() As String
		  
		  Var helpFor As String = AppName
		  If helpFor <> "" Then
		    If AppDescription <> "" Then
		      helpFor = kIndentPrefix + helpFor + " - " + AppDescription
		    End If
		    helpLines.Add helpFor
		    helpLines.Add ""
		  End If
		  
		  helpLines.Add sectionTitle + ":"
		  
		  For i As Integer = 0 To Options.LastIndex
		    Var opt As Option = Options(i)
		    Var keys() As String
		    
		    If opt.ShortKey <> "" Then
		      Var keyString As String = KeyWithDashes(opt.ShortKey)
		      
		      If opt.Type <> Option.OptionType.Boolean Then
		        keyString = keyString + " " + opt.TypeString
		      End If
		      
		      keys.Add keyString
		    End If
		    
		    If opt.LongKey <> "" Then
		      Var keyString As String = KeyWithDashes(opt.LongKey)
		      
		      If opt.Type <> Option.OptionType.Boolean Then
		        keyString = keyString + "=" + opt.TypeString
		      End If
		      
		      keys.Add keyString
		    End If
		    
		    Var key As String = String.FromArray(keys, ", ")
		    Var desc as string = opt.HelpDescription
		    
		    If key.Length > kAlignCol Or desc.IndexOf(EndOfLine) <> -1 Then
		      helpLines.Add kIndentPrefix + key
		      helpLines.Add WrapTextWithIndent(desc, kLineLength, descIndent)
		      
		    ElseIf (key.Length + desc.Length) > kLineLength Then
		      key = kIndentPrefix + PadRight(key, kAlignCol + 1)
		      desc = WrapTextWithIndent(desc, kLineLength, descIndent)
		      desc = desc.Middle(key.Length - 1 + 1)
		      helpLines.Add key + desc
		      
		    Else
		      helpLines.Add kIndentPrefix + PadRight(key, kAlignCol + 1) + desc 
		      
		    End If
		  Next
		  
		  Var notes As String = AdditionalHelpNotes.Trim
		  If notes <> "" Then
		    notes = WrapTextWithIndent(notes, kLineLength)
		    
		    helpLines.Add ""
		    helpLines.Add "Notes:"
		    helpLines.Add notes
		    helpLines.Add ""
		  End If
		  
		  Var help As String = String.FromArray(helpLines, EndOfLine)
		  
		  #If TargetConsole Then
		    Print help
		  #ElseIf TargetDesktop Then
		    MsgBox help
		  #Else
		    #Pragma Warning "How to print help?"
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(key As Variant, defaultValue As String = "") As String
		  //
		  // Retrieve the contents of an option as a `String` value.
		  //
		  // ### Parameters
		  //
		  // * `key` - Key of the option to retrieve. This can be the short or long key. Convention
		  //   is to use the long key if available as it produces more readable code.
		  // * `defaultValue` - Value to return if the user did not supply this option.
		  //
		  // ### Notes
		  //
		  // The option type must be that of `OptionType.String`.
		  //
		  
		  Var o As Option = OptionValue(key)
		  Return If(o Is Nil Or o.WasSet = False Or o.Value Is Nil, defaultValue, o.Value.StringValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Value(key As Variant) As Variant
		  Var vk As String = key
		  Var v As Variant = Dict.Lookup(vk, Nil)
		  
		  If v = Nil Then
		    v = Dict.Lookup(vk.Asc, Nil)
		  End If
		  
		  If v <> Nil Then
		    Return Option(v).Value
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WrapLines(lines() As String, charsPerLine As Integer = 72, paragraphFill As Boolean = true)
		  // Wrap the text so that no line is longer than charsPerLine.  If paragraphFill
		  // is true, then whenever one long line is followed by a line that does not
		  // start with whitespace, join them together into one continuous paragraph.
		  // Copied from StringUtils.
		  
		  If lines.LastIndex < 0 Then Return
		  
		  // Start by joining lines, if called for.
		  If paragraphFill Then
		    Var lineNum As Integer = 1
		    Var lastLineShort As Boolean = (lines(0).Length < charsPerLine - 20)
		    While lineNum <= lines.LastIndex
		      Var line As String = lines(lineNum)
		      Var firstChar As String = line.Left(1)
		      If lastLineShort Then
		        // last line was short, so don't join this one to it
		        lineNum = lineNum + 1
		      elseif line = "" or firstChar <= " " or firstChar = ">" or firstChar = "|" Then
		        // this line is empty or starts with whitespace or other special char; don't join it
		        lineNum = lineNum + 1
		      Else
		        // this line starts with a character; join it to the previous line
		        lines(lineNum - 1) = lines(lineNum - 1) + " " + line
		        lines.RemoveAt lineNum
		      End If
		      lastLineShort = (line.Length < charsPerLine - 20)
		    Wend
		  End If
		  
		  // Then, go through and do the wrapping.
		  For lineNum As Integer = 0 To lines.LastIndex
		    Var line As String = lines(lineNum).TrimRight
		    If line.Length <= charsPerLine Then
		      lines(lineNum) = line
		    Else
		      Var breakPos As Integer
		      For breakPos = charsPerLine DownTo 1
		        Var c As String = line.Middle(breakPos, 0)
		        If c <= " " or c = "-" Then Exit
		      Next
		      If breakPos < 2 Then 
		        breakPos = charsPerLine + 1 // no point breaking before char 1
		      End If
		      lines.AddAt lineNum + 1, line.Middle(breakPos - 1).TrimLeft
		      lines(lineNum) = line.Left(breakPos - 1).TrimLeft
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WrapLinesWithIndent(lines() As String, charsPerLine As Integer, indent As String = kIndentPrefix)
		  WrapLines(lines, charsPerLine - indent.Length, False)
		  
		  For i As Integer = 0 To lines.LastIndex
		    lines(i) = indent + lines(i)
		  Next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WrapTextWithIndent(s As String, charsPerLine As Integer, indent As String = kIndentPrefix) As String
		  s = s.ReplaceLineEndings(EndOfLine)
		  
		  Var lines() As String = s.Split(EndOfLine)
		  WrapLinesWithIndent(lines, charsPerLine, indent)
		  Return String.FromArray(lines, EndOfLine)
		End Function
	#tag EndMethod


	#tag Note, Name = How to supply command line parameters
		`OptionParser` is versitle on it's use of command line options.
		
		* Options can appear anywhere on the command line
		* Extra can be at the start, middle or end of the command line
		* Short options can be combined
		* Long options with assignment utilize the equal sign (`=`)
		* Short options can optionally use the `=` sign
		* File and Directory options can be a full or relative path
		* Anything after a `--` is considered an extra even if it looks like a parameter
		* Boolean options can be prefixed with no, --recursive or --no-recursive, it'll
		  just do the right thing.
		
		Here are some example uses at the command line:
		
		```
		# Options for a fictitious copy program
		#
		# -r/--recursive
		# -v/--verbose
		# -l/--log FILE
		
		# copy the $HOME/Desktop/Folder to /tmp recursively with verbose turned on
		
		$ cp -rv ~/Desktop/Folder /tmp
		
		# same thing
		
		$ cp ~/Desktop/Folder -r /tmp -v
		
		# enable logging to a file
		
		$ cp -rv --log=file.txt ~/Desktop/Folder /tmp
		
		# enable logging to a file using combined short options 
		
		$ cp -rvl=file.txt ~/Desktop/Folder /tmp
		
		# disable verbose and copy a file named "-r" to "tmp.txt"
		
		$ cp --no-verbose -- -r tmp.txt
		```
	#tag EndNote

	#tag Note, Name = Overview
		`OptionParser` is the glue between `Option` classes and the command line as supplied via
		the `Run` event's `args()` parameter in a `ConsoleApplication` or via a call to 
		`System.CommandLine` in a Desktop or Web application. It handles actually parsing the
		command line, populating the associated `Option`s and validating it as a whole.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Note
			Displayed after the help message generated by `OptionParser` when the
			help screen is shown.
			
			This can be used to provide further usage notes and to expand on options
			when a single line description is not sufficient.
		#tag EndNote
		#tag Getter
			Get
			  return mAdditionalHelpNotes
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAdditionalHelpNotes = value.Trim.ReplaceLineEndings(EndOfLine)
			End Set
		#tag EndSetter
		AdditionalHelpNotes As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			Typically a single line description of the application that is displayed
			before the application help.
		#tag EndNote
		AppDescription As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Name of the application. If empty, `OptionParser` will assign the `AppName`
			variable to the name of the executable filename. This is displayed when
			user help is shown.
		#tag EndNote
		AppName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Dict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Any non-option parameters given to the application will be appended
			to this array. For example:
			
			```
			$ my-app --verbose -o ./docs file.txt file2.txt file3.txt
			```
			
			In the above case, the `Extras` array will contain three
			strings:
			
			```
			0 = "file.txt"
			1 = "file2.txt"
			2 = "file3.txt"
			```
		#tag EndNote
		Extra() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Specify the minimum number of extra items required. For example, say you are
			writing a copy program. One might set this value to `2`.
			
			```
			$ copy extra1 extra2
			```
			
			See `Extra` for more information.
		#tag EndNote
		ExtrasRequired As Integer = 0
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			`True` when the user supplies either `-h` or `--help` on the command line.
		#tag EndNote
		#tag Getter
			Get
			  Var o As Option = OptionValue("help")
			  If o Is Nil Then
			    Return False // Should never happen
			  Else
			    Return o.WasSet
			  End If
			  
			End Get
		#tag EndGetter
		HelpRequested As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAdditionalHelpNotes As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Options() As Option
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OriginalArgs() As String
	#tag EndProperty


	#tag Constant, Name = kIndentPrefix, Type = String, Dynamic = False, Default = \"  ", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kInvalidKeyValue, Type = String, Dynamic = False, Default = \"key value is invalid", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kMissingKeyValue, Type = String, Dynamic = False, Default = \"key value is missing", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AdditionalHelpNotes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AppDescription"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AppName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtrasRequired"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpRequested"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
