'#####################################################################################
'#		PEDAL - Portable Event-Driven Automation Library
'#		SpeedTest, Inc. copyright 2009
'#		If you have any questions or need support,
'#		contact:
'#				SpeedTest Inc.
'#				7017 Eden Mill Road  Woodbine, MD 21797
'#				410-627-7373, info@speedtestinc.com
'#
'#      This code is the property of SpeedTest Inc. and is conveyed tas a  component
'#      of a services contract, without restrictions on its use.
'#      Use by anyone other than client personnel in support of the project for which SpeedTest is contracted
'#      is a copyright infringement.
'#      Client bears sole responsibility for the use and implementation of this code.  It is conveyed by 
'#      SpeedTest without license, warranty or support beyond the services contract period.
'#####################################################################################

'#####################################################################################		
'#		The following is the Project Function Library for the ST automated test framework
'#		It uses an event-driven approach to read data from a data table and 
'#		execute the test based upon that data.  The functions in this library
'#		perform the utility type operations that are specific tothe project or appliaction under test  and 
'# 		are not related to a GUI object.
'#
'#	Data array key:
'#	Data(0) = DataTable("Application", dtGlobalSheet)
'#	Data(1) = DataTable("Page", dtGlobalSheet)
'#	Data(2) = DataTable("Frame", dtGlobalSheet)
'#	Data(3) = DataTable("Action", dtGlobalSheet)
'#	Data(4) = DataTable("Value", dtGlobalSheet)
'#	Data(5) = DataTable("ObjectNameOrKeyword", dtGlobalSheet)
'#	Data(6) = DataTable("ObjectType", dtGlobalSheet)
'#	Data(7) = DataTable("ObjPar1", dtGlobalSheet)
'#	Data(8) = DataTable("ObjPar2", dtGlobalSheet)
'#	Data(9) = DataTable("SynchPar1", dtGlobalSheet)
'#	Data(10) = DataTable("SynchPar2", dtGlobalSheet)
'#	Data(11) = DataTable("comment", dtGlobalSheet)
'#	Data(12) = DataTable("debug", dtGlobalSheet)
'# 
'#####################################################################################
Public IE
'********************************************************************************************************************************************
Public Function  StartApp(Data)
' the following two environment vars will set  the Record and Run Settings to define the browser an the app that is start when the test starts
' during a run they will change the env var values but have no effect on browser navigation
'Environment.Value("BROWSER_ENV")="IE"
'Environment.Value("URL_ENV")="http://google.com "

'ST_Driver script Run Setting shouldbe set to Use any existing browser and the following lines will start the browser for the test
Set IE = CreateObject("InternetExplorer.Application")
IE.Visible = True

TestEnv = Environment.Value("TestEnv")
App = Data(0) & "_"& ucase(TestEnv)
Select Case App
   Case "PO_QA1"
		'browser(Data(0)).navigate " http://cbvapp-q1012:19480/po-web/home.action"
		IE.Navigate "http://cbvapp-q1012:19480/po-web/home.action"
   Case "PO_QA2"
		'browser(Data(0)).navigate " http://ncias-q224-v.nci.nih.gov:19480/po-web/home.action"
		IE.Navigate "http://ncias-q224-v.nci.nih.gov:19480/po-web/home.action"
   Case "TrialRegistration_QA1"
		'browser(Data(0)).navigate "http://cbvapp-q1012:19280/registry/home.action"
		IE.Navigate "http://cbvapp-q1012:19280/registry/home.action"
   Case "TrialRegistration_QA2"
		'browser(Data(0)).navigate "http://ncias-q224-v.nci.nih.gov:19280/registry/home.action"
		IE.Navigate  "http://ncias-q224-v.nci.nih.gov:19280/registry/home.action"
   Case "ProtocolAbstraction_QA1"
		'browser(Data(0)).navigate "http://cbvapp-q1012:19280/pa/report/studyProtocolshowCriteria.action"
		IE.Navigate "http://cbvapp-q1012:19280/pa/report/studyProtocolshowCriteria.action"
   Case "ProtocolAbstraction_QA2"
		'browser(Data(0)).navigate "http://ncias-q224-v.nci.nih.gov:19280/pa/protected/studyProtocolshowCriteria.action"
		IE.Navigate "http://ncias-q224-v.nci.nih.gov:19280/pa/protected/studyProtocolshowCriteria.action"
    Case "ProtocolAbstraction_PROD"
		'browser(Data(0)).navigate " http://trials.nci.nih.gov/pa"
		IE.Navigate "http://trials.nci.nih.gov/pa"
    Case "TermBrowser_DEV"
		'browser(Data(0)).navigate " http://ncit-dev.nci.nih.gov/ncitbrowser/start.jsf "
		IE.Navigate "http://ncit-dev.nci.nih.gov/ncitbrowser/start.jsf"
    Case "TermBrowser_QA"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms-qa.nci.nih.gov/"
    Case "TermBrowser_STAGE"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms-stage.nci.nih.gov/"
    Case "TermBrowser_STAGE2"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncit-stage.nci.nih.gov/"
    Case "TermBrowser_PROD"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://nciterms.nci.nih.gov/"
  Case "NcimBrowser_NCIMQA"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncim-qa.nci.nih.gov/"
   Case "NcimBrowser_NCIMSTAGE"
		'browser(Data(0)).navigate " http://ncit-qa.nci.nih.gov/"
		IE.Navigate "http://ncim-stage.nci.nih.gov/"	
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "The application you want to start was not found in the start application function!"
			StartApp(Data) =Fail

End Select

End Function
'*******************************************************************************************************************************************

Public Function  StartAppURL(Data)
' the following two environment vars will set  the Record and Run Settings to define the browser an the app that is start when the test starts
' during a run they will change the env var values but have no effect on browser navigation
'Environment.Value("BROWSER_ENV")="IE"
'Environment.Value("URL_ENV")="http://google.com "

'ST_Driver script Run Setting shouldbe set to Use any existing browser and the following lines will start the browser for the test
Set IE = CreateObject("InternetExplorer.Application")
IE.Visible = True

TestURL = Environment.Value("TestURL")
IE.Navigate TestURL

End Function
'*******************************************************************************************************************************************

Public Function ProjFunc_Handler (Data,CurrentRow,ResultsFileObj)
GUIObjRef = "Browser(Data(0)).Page(Data(1))."
If Data(2) <> "" Then
	GUIObjRef = GUIObjRef & "Frame(Data(2))."
End If
'GUIObjRef = GUIObjRef & "Image(Data(5))."
'GUIObjRef = GUIObjRef & Data(6) & "(Data(5))."


Select Case LCase(Data(6))

   Case "projfunc_camod_login"
		status = camod_login(Data,CurrentRow,ResultsFileObj)
   Case "projfunc_camod_loginverify"
		status = camod_loginverify(Data,CurrentRow,ResultsFileObj)
   Case "projfunc_camod_searchby_modelid"
		status = camod_searchby_modelid(Data,CurrentRow,ResultsFileObj)	
   Case "projfunc_camod_searchby_species"
		status = camod_searchby_species(Data,CurrentRow,ResultsFileObj)	
   Case "projfunc_camod_webimage_verify"
		status = camod_webimage_verify(Data,CurrentRow,ResultsFileObj)	
   Case "projfunc_camod_evs_select_search"
		status = camod_evs_select_search(Data,CurrentRow,ResultsFileObj)
   Case "projfunc_camod_evs_validate_search_result"
		status = camod_evs_validate_search_result(Data,CurrentRow,ResultsFileObj)
   Case "projfunc_caMOD_Logout"
		status = caMOD_Logout(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "projfunc_caMOD_LogoutVerify"
		status = caMOD_LogoutVerify(Data,CurrentRow,ResultsFileObj,GUIObjRef)		
   Case "projfunc_orgsearchresultstable"
		status = SearchResultsTable(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "projfunc_personsearchresultstable"
		status = SearchResultsTable(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "projfunc_verifytrialregerrormessage"
		status = VerifyTrialRegErrorMessage(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "projfunc_linkinsearchresultstable"
		status = LinkInSearchResultsTable(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case "projfunc_trialreg_programcode"
		status = TrialReg_ProgramCode(Data,CurrentRow,ResultsFileObj,GUIObjRef)
   Case Else
		Reporter.ReportEvent micFail, Data(5), "The object type was not found!"
End Select

End Function

'**********************************************************************************************************************************************************
'					caMOD PROJECT SPECIFIC FUNCTIONS										  '
'						Madhavi Kambampati											  '
'**********************************************************************************************************************************************************

'************************************************************************************************************************
Public Function camod_login(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) USERNAME
	'2) PASSWORD	
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	'set username
	Data(6) = "WebEdit"
	Data(5) = "username"
	Data(4) = funcArg(0)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	'set password
	Data(6) = "WebEdit"
	Data(5) = "password"
	Data(4) = funcArg(1)
	Data(3) = "enter"
	s = ST_ObjectHandler (Data,CurrentRow,ResultsFileObj)

	Data(6) = "WebButton"
	Data(5) = "Login"
	Data(3) = "click"
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	

	camod_login = "Done"
End Function
'************************************************************************************************************************
Public Function camod_loginverify(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Browser(Data(0)).Page(Data(1)).Sync
	Data(6) = "Link"
	Data(5) = "Log out"
	Data(4) = "Log out"
	Data(3) = "verify"
	var_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If (var_Exist = "Pass") Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"Verify Login","Login verification successful"
		camod_loginverify = "Pass"
	Else
		camod_loginverify = "Fail"
	End If
End Function
'************************************************************************************************************************
Public Function camod_searchby_modelid(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) Model ID	
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	'set modelId
	Data(6) = "WebEdit"
	Data(5) = "modelId"
	Data(4) = funcArg(0)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	Data(6) = "WebButton"
	Data(5) = "Search by Model Id"
	Data(3) = "click"
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	

	camod_searchby_modelid = "Done"
End Function
'************************************************************************************************************************
Public Function camod_searchby_species(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) Species	
	'********************************************************************************************
	funcArg = parseData4(Data(4))
	'clear previous search
	Data(6) = "WebButton"
	Data(5) = "Clear"
	Data(3) = "click"
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	
	
	'set Species
	Data(6) = "WebList"
	Data(5) = "species"
	Data(4) = funcArg(0)
	Data(3) = "select"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	camod_searchby_species = "Done"
End Function
'************************************************************************************************************************
Function camod_webimage_verify(Data,CurrentRow,ResultsFileObj)  'this is not working
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) Image Name	
	'********************************************************************************************
	
	funcArg = parseData4(Data(4))
	Data(4) = funcArg(0)
	'ImageName = parseData4(Data(4))(0)
	'varName = parseData4(Data(4))(1)
	
	GUIObjRef = GUIObjRef & "Image(Data(4))."
	VerifyMethod = "GetROProperty(" & chr(34) & "alt" & chr(34) & ")"
	'VerifyMethod = "GetROProperty(" & chr(34) & "file name" & chr(34) & ")"
	VerifyCommand = "Actual=Trim(" & GUIObjRef & VerifyMethod & ")"
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	
	Select Case LCase(Data(3))
		Case "click","enter"
			Execute EntryCommand
			camod_webimage_verify = "Done" 
			'Browser(Data(0)).Page(Data(1)).Image(Data(5)).Click 2,2
		Case "verify"	
			'If Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Image(Data(4)).Exist(3) Then
			If Browser(Data(0)).Page(Data(1)).Image(Data(4)).Exist(3) Then
				Execute (VerifyCommand) 
				If (Actual <> Data(4)) Then
					ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
					camod_webimage_verify = "Fail"
				Else
					ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
					camod_webimage_verify = "Pass"
				End If	
			End If	
		Case "veri"
			Execute VerifyCommand
			If (Actual <> Data(4)) Then
				ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
				camod_webimage_verify = "Fail"
			Else
				ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
				camod_webimage_verify = "Pass"
			End If			
		Case Else
			Reporter.ReportEvent micFail, ReportStepName, "camod_webimage_verify - Action not valid for this object type!"
			camod_webimage_verify = "Fail"
	End Select
End Function
'************************************************************************************************************************
Public Function camod_evs_select_search(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) Search by
	'2) SearchString	
	'********************************************************************************************
		
	'Select search criteria
	funcArg = parseData4(Data(4))
	Data(6) = "WebRadioGroup"
	Data(5) = "algorithm" 
	Data(4) = funcArg(0)
	Data(3) = "select"
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	
	
	'set Search string
	Data(6) = "WebEdit"
	Data(5) = "searchTerm"
	Data(4) = funcArg(1)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	'Submit Search 
	Data(6) = "Image"
	Data(5) = "searchButton"
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	camod_evs_select_search= "Done"
End Function
'************************************************************************************************************************
Public Function camod_evs_validate_search_result(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'1) Search String
	'2) Search Result String
		
	'********************************************************************************************
		
	'Select search criteria
	funcArg = parseData4(Data(4))
	Data(6) = "keyword"
	Data(5) = WebTable_ClickOnImageInCell
	Data(4) = funcArg(0)
	ST_ObjectHandler Data,CurrentRow,ResultsFileObj	
	
	'set Search string
	Data(6) = "WebTable"
	Data(5) = "Liver (MMHCC)"
	Data(4) = funcArg(1)
	Data(3) = "enter"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	'Submit Search 
	Data(6) = "Image"
	Data(5) = "searchButton"
	Data(3) = "click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	
	camod_evs_select_search= "Done"
End Function
'************************************************************************************************************************

Public Function caMOD_Logout(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Data(6) = "Link"
	Data(5) = "Log out"
	Data(3) = "Click"
	s = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)

	caMOD_Logout = "Done"
End Function
'************************************************************************************************************************
Public Function caMOD_LogoutVerify(Data,CurrentRow,ResultsFileObj)
	'********************************************************************************************
	'THE ARGUMENTS FOR THE DATA(4) VALUE FIELDS ARE AS FOLLOWS:
	'NONE	
	'********************************************************************************************
	Data(6) = "Link"
	Data(5) = "Login"
	Data(4) = "Login"
	Data(3) = "verify"
	var_Exist = ST_ObjectHandler(Data,CurrentRow,ResultsFileObj)
	If (var_Exist = "True") Then
		ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		Reporter.ReportEvent micPass,"Verify Logout","Logout Verification successful"
		caMOD_LogoutVerify = "Pass"
	Else
		caMOD_LogoutVerify = "Fail"
	End If
End Function






'************************************************************************************************************************
' Project functionality application - In Trial Reg, POand PA apps, search results are displayed in a table with a select button on each row
' Data entry - Object type must say ProjFunc_OrgSearchResultsTable for an Org search or ProjFunc_PersonSearchResultsTablemfor a Person search,
'						 ObjectName must be the table name which contains the serach results, Value is the value being serched for or verified.
' Entry - this function will search column 2 of the table for the value entered and if found will click the Select button in column 7 of that row.
' Verify - By entering a value and row and column in ObjPar1 and ObjPar2, data in any cell can be validated.
'				Data rows in the table start at row 2,  Row 1 is the column headers  
'				Row number is always relative to the page of the results you are on,  For example, To verify the first item on page two of a multipage results set,
'				use the Next link to page to the second page and enter row number as 2 (first data row onthe seconde page).
'Constraints - The Search Results table must be displayed on a popup frame.

Public Function SearchResultsTable(Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
   EntryMethod = "Click"
   VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
   EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

Select Case LCase(Data(3))

   Case "click","enter", "select"
		'Execute EntryCommand
		ValueFound = False
		'Browser(Data(0)).Page(Data(1)).Sync
		Do
			numRows = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).RowCount
			For i=2 to numRows
				Select Case LCase(Data(6))
				   Case "projfunc_orgsearchresultstable"
						If  Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(i,2) = Data(4) Then
							ValueFound = True
						End If
				   Case "projfunc_personsearchresultstable"
						PersonNameArr = split(Data(4)," ") 
						Fname = PersonNameArr(0)
						If Ubound(PersonNameArr) < 2 Then
							Mname = ""
							Lname = PersonNameArr(1)
						Else
							Mname = PersonNameArr(1)
							Lname = PersonNameArr(2)
						End If
						ActFname = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(i,2)
						ActMname = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(i,3)
						ActLname = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(i,4)
						If  Fname = ActFname and Mname = ActMname and Lname = ActLname Then
							ValueFound = True
						End If
				End Select

				'If  Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(i,2) = Data(4) Then
				If  ValueFound Then
					'ValueFound = True
					Set oDesc = Description.Create()
							oDesc("text").Value = "Select"
					'Retrieve all Select Link objects in the WebTable
					Set colSelectLinks = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).ChildObjects(oDesc)
					numSelectLinks = colSelectLinks.Count
					colSelectLinks.item((i-2)*2+1).Click
					'Exit For
					Exit Do
				End If
			Next
			'If Not Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link("Next").Exist and Not ValueFound Then
				'Exit Do
			'End If
			If Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link("Next").Exist Then
				Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link("Next").Click
			Else
				Exit Do
			End If
		Loop Until ValueFound

		If Not ValueFound Then
			msgbox ("The value was not found in the SearchResults Table.")
		End If

   Case "verify"
		'Execute (VerifyCommand) 
		Actual=RTrim( Browser(Data(0)).Page(Data(1)).Frame(Data(2)).WebTable(Data(5)).GetCellData(Data(7) , Data(8) ) )
		If (Actual <> Data(4)) Then
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
	    Else
			ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		End If

   Case Else
		Reporter.ReportEvent micFail, ReportStepName, "Link - Action not valid for this object type!"
 End Select


End Function

'************************************************************************************************************************
' Project functionality application - In Trial Reg, error meassges are displayed in the DOM as red messages on the returned page after submission
' Data entry - Object type must say ProjFunc_VerifyTrialRegErrorMessage,
'						 ObjectName must be DOM, Value is the value being serched for or verified.
' Entry - this function will get a collection of nodes from the page DOM that contain the error messages displayed on the page,  It will then verify that
'				at least one of the nodes contains the text that is being verified
' Verify - Enter the exact text that is to be verified (case sensitive).  Function will verify that at least one of the error messages matches exactly.
'Verify-contains - Enter the text that is to be verified (not case sensitive). Function will verify the at least one of the error messages contains the text.
'Constraints -  verification will always find the first node in the collection that matches.  Test should be designed so that the same error message
'							does not appear twice on the same page

Public Function VerifyTrialRegErrorMessage(Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
   EntryMethod = "Click"
   VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
   EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

Select Case LCase(Data(3))

   Case "verify"
		'Execute (VerifyCommand) 
'Google prototype that works
'set objPage = Browser("Google").Page("Google").Object
'set collTest = objPage.getElementsByTagName("title")
'num = collTest.length
'Set activeNode = collTest.item(0)
'msgbox(activeNode.innerHTML)
		Set PageDOM = Browser(Data(0)).Page(Data(1)).Object
		Set colNLNodes = PageDOM.getElementsByTagName("ul")
		num = colNLNodes.length
		For i =0 to num-1
			Set activeNode = colNLNodes.item(i)
			nodeText = activeNode.innerHTML
			'msgbox(activeNode.innerHTML)
				If Instr (1, nodeText, Data(4)) <> 0 Then
					ErrMsgFound = True
					Actual = nodeText
					Exit For
				Else
					ErrMsgFound = False
				End If
		Next
		If (Not ErrMsgFound) Then
			Actual = "Expected Value not found on the page"
			ST_CustomReporting Data,"Fail",CurrentRow,ResultsFileObj
	    Else
			ST_CustomReporting Data,"Pass",CurrentRow,ResultsFileObj
		End If

   Case Else
		Reporter.ReportEvent micFail, ReportStepName, "projWebEdit - Action not valid for this object type!"
 End Select


End Function

'************************************************************************************************************************
' Project functionality application - In Trial Reg, POand PA apps, search results are displayed in a table with the item to be selected a s clickable link
'																Search results may be multiple pages with a Next link displayed to accessing subsequent pages.
' Data entry - Object type must say ProjFunc_LinkInSearchResultsTable,
'						 ObjectName must be the table name which contains the search results, Value is the text for the link to be selected
' Entry - this function will click on the link indicated in the Value column.  If it doesn;t exist it will page to the next page until it finds the link.
' Verify -  No verify functionality.

Public Function LinkInSearchResultsTable(Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
GUIObjRef = "Browser(Data(0)).Page(Data(1))."
If Data(2) <> "" Then
	GUIObjRef = GUIObjRef & "Frame(Data(2))."
End If

GUIObjRef = GUIObjRef & "Link"
EntryMethod = "Click"
EntryCommand = GUIObjRef& "(oDesc)" & "." & EntryMethod

Select Case LCase(Data(3))

   Case "click","enter", "select"
		ValueFound = False
		'Browser(Data(0)).Page(Data(1)).Sync
		Set oDesc = Description.Create()
		oDesc("text").Value = Data(4)
		Do
			If Data(2) <> "" Then
				LinkExists = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link(oDesc).Exist(5)
			Else
				LinkExists = Browser(Data(0)).Page(Data(1)).Link(oDesc).Exist(5)
			End If
			If  LinkExists Then
					ValueFound = True
					Execute EntryCommand
					Exit Do
			End If

			If Data(2) <> "" Then
				NextPage = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link("text:=Next").Exist(5)
				NextPageCommand = "Browser(Data(0)).Page(Data(1)).Frame(Data(2)).Link("  & chr(34) & "text:=Next" & chr(34) & ").Click"
			Else
				NextPage = Browser(Data(0)).Page(Data(1)).Link("text:=Next").Exist(5)
				NextPageCommand = "Browser(Data(0)).Page(Data(1)).Link("  & chr(34) & "text:=Next" & chr(34) & ").Click"
			End If

			If Not NextPage and Not ValueFound Then
				Exit Do
			End If

			If NextPage Then
					Execute NextPageCommand
			Else
				Exit Do
			End If
		Loop Until ValueFound

		If Not ValueFound Then
			msgbox ("The value was not found in the SearchResults Table.")
		End If

   Case Else
		Reporter.ReportEvent micFail, ReportStepName, "Link - Action not valid for this object type!"
 End Select

End Function

'************************************************************************************************************************
Public Function TrialReg_ProgramCode (Data,CurrentRow,ResultsFileObj,GUIObjRef)
	' The structure of each Object function should be fairly uniform with the following method and command 
	' statements being unique to the  object type.
GUIObjRef = "Browser(Data(0)).Dialog(Data(1)).WinButton(Data(5))."
   EntryMethod = "Click"
   VerifyMethod = "GetROProperty(" & chr(34) & "text" & chr(34) & ")"
   EntryCommand = GUIObjRef & EntryMethod
	'VerifyCommand = "Actual=" & GUIObjRef & VerifyMethod
	VerifyCommand = "Actual=RTrim(" & GUIObjRef & VerifyMethod & ")"

Set oDesc = Description.Create()
oDesc("micclass").Value = "WebList"
If Data(2) <> "" Then
	Set oChildren = Browser(Data(0)).Page(Data(1)).Frame(Data(2)).ChildObjects(oDesc)
Else
	Set oChildren = Browser(Data(0)).Page(Data(1)).ChildObjects(oDesc)
End If

For i=0 to oChildren.count
	nameProp=oChildren(i).GetROProperty("name")
	If nameProp = "programcodenciselectedvalue" Or nameProp = "programcodenihselectedvalue" Then
		oChildren(i).Select "TRP"
		Exit For
	End If
Next

Select Case LCase(Data(3))

   Case "select","enter"
		'Browser("Trial Details").Dialog("Message from webpage").WinButton("OK").Click
		oChildren(i).Select "TRP"

   Case Else
		Reporter.ReportEvent micFail, ReportStepName, "WinButton - Action not valid for this object type!"
 End Select


End Function

'************************************************************************************************************************
