<cfset session.toolbar="login">
<cfset variables.ADapproved = "no">
<cfset session.ADapproved = "no">
<cfset session.loginlocation = "">
<cfset session.screenName = "">
<cfset session.username = "">
<cfset session.userID = "">
<cfset session.email = "">
<cfset session.password = "">
<cfset session.currentSchool =""> 
<cfset session.allowedschools="">
<cfset temp = StructClear(session.ethnicStruct)>
<cfset temp = StructClear(session.schoolStruct)>
<cfset temp = StructClear(session.countryStruct)>
<cfset temp = StructClear(session.languageStruct)>
<cfset temp = StructClear(session.schoolStruct)>
<cfset temp = StructClear(session.familyStruct)>
<cfset temp = StructClear(session.stateStruct)>
<cfset temp = StructClear(session.feeStruct)>
<cfset temp = StructClear(session.streetSuffixStruct)>
<cfset temp = StructClear(session.directionStruct)>
<cfset temp = StructClear(session.countyStruct)>
