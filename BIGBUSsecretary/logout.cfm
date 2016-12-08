<cfapplication name="login" sessionmanagement="yes" setclientcookies="yes" sessiontimeout="0">
<cflock scope="session" type="exclusive" timeout="2">
<cfset session.toolbar="login">
<cfset variables.ADapproved = "no">
<cfset session.ADapproved = "no">
<cfset session.screenName = "">
<cfset session.username = "">
<cfset session.userID = "">
<cfset session.email = "">
<cfset session.password = "">
<cfset session.language =""> 
<cfset session.allowedschools ="">
<cfset temp = StructClear(session.ethnicStruct)>
<cfset temp = StructClear(session.schoolStruct)>
<cfset temp = StructClear(session.countryStruct)>
<cfset temp = StructClear(session.languageStruct)>
<cfset temp = StructClear(session.schoolStruct)>
<cfset temp = StructClear(session.familyStruct)>
<cfset temp = StructClear(session.stateStruct)>
<cfinclude template="includes/sec_header.cfm">
</cflock>
<div align="center"><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
<h3>You are logged out.
</h3></p>
<img src="images/lock.jpg" width="128" height="128"></div>
<cfinclude template="includes/sec_footer.cfm">

