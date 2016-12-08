<cfinclude template="includes/header.cfm">

<cfset connector= ''>
<cfset numberfound=999>
<cfset found = 'n'>
<cfset quote="'">
<cfset hasResults = ''>

<body onload="setActiveStyleSheet('<cfoutput>#session.language#</cfoutput>')">
	<div id="toolbar"> <a href="#" onclick="setActiveStyleSheet('english'); return false;">English</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('spanish'); return false;">Espa&Ntilde;ol</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('bilingual'); return false;">Bilingual</a>
	</div>
<table width="675" border="0" align="center" cellpadding="5" cellspacing="0">
<cfif isdefined('form.lname') OR isdefined('form.fname') OR isdefined('form.SID') OR (isdefined('form.birthmonth') AND isdefined('form.birthday') AND isdefined('form.birthyear'))>

<!-- Format Search Text for Upper Case -->
<cfset lname = REReplace("a","[a-z]","\U#form.lname#\E", "ALL")>
<cfset fname = REReplace("a","[a-z]","\U#form.fname#\E", "ALL")>


<!---cfloop index="count2" from="1" to="4">
	<cfswitch itteration='#count2#'>
		<cfcase value="1">
			<cfset criteria= criteria & ' and lname like  ' & quote & form.lname & quote & '% fname like  ' & quote & form.fname & quote>
		</cfcase>
		<cfcase value="2">
				<cfset criteria= criteria & ' and lname like  ' & quote & form.lname & quote & '% fname like  ' & quote & form.fname & quote>
		</cfcase>
		<cfcase value="3">
				<cfset criteria= criteria & ' and gender =  ' & quote & form.lname & quote>
		</cfcase>
		<cfcase value="4">
		</cfcase>
	</cfswitch--->
<cfquery datasource="panthertest" name="getStudents">
	select DISTINCT f.sid, f.lname, f.fname, f.birthmonth||'/'||f.birthday||'/'||f.birthyear DOB, 
	f.gender, f.ethnic
	from sdem f
	where f.dist='4600'
	and upper(lname) like '#variables.lname#%' and upper(fname) like '#variables.fname#%'
	and gender = '#form.gender#' and ethnic = '#form.ethnic#'
	and birthyear || birthmonth || birthday = '#form.birthyear##form.birthmonth##form.birthday#'
	<!---cfif isdefined('form.sid') AND form.sid neq "">#variables.connector# a.sid = '#form.sid#'<cfset connector=' or '></cfif>
	<cfif (isdefined('form.birthmonth') AND form.birthmonth neq "") AND (isdefined('form.birthday') AND form.birthday neq "") AND (isdefined('form.birthyear') AND form.birthyear neq "")>AND a.birthmonth = '#form.birthmonth#' AND a.birthday = '#form.birthday#' AND a.birthyear = '#form.birthyear#'</cfif--->
</cfquery>

<cfif getStudents.recordcount eq 1>
<!--- go the the identity confirmation questions --->
	<cfset session.possibleStdLst = getStudents.sid>
	<cflocation url="confirm.cfm" addtoken="no">
	<!--- cfbreak--->
<cfelseif getStudents.recordcount gt 1>
	<!--- Try to narrow the results --->
	<tr><td>
	There are more than one students that match the search critera, please choose from the following list:
	<cfset stdt = 0>
	<cfoutput>
	<form name=confirm action="confirm.cfm">
		<cfloop query="getStudents">
			<cfset stdt = stdt + 1>
			<cfset session.possibleStdLst = session.possibleStdLst & connector & getStudents.sid>
			<input type=radio name=stdtNo  value="#stdt#" >#getStudents.lname#, #getStudents.fname# - XXXXXX#right(getStudents.sid,3)#
		</cfloop>
		<input type=submit>
	</form>
	</cfoutput>
	</td></tr>
<cfelseif getStudents.recordcount eq 0>
	<tr><td>There are no existing students in the system that match that criteria.<P>
	If your student has previously  attended a School District U-46 School,<BR>please contact your school secretary for help.<P>
	If this is a new student registration, please click on the button labeled 'Continue'.<P>
	<form name=tabs action="tabs.cfm">
	<input type=submit value="Continue..."></form></td></tr>
</cfif>

<!---/cfloop>
<table width="450" border="0" align="center" cellpadding="3" cellspacing="0" style="border: solid 1px black;">
  <tr class="label">
    <td colspan="4"><div align="center">Search Results</div>      <div align="center"></div>      <div align="center"></div></td>
  </tr>
  <tr>
    <td colspan="4"><div align="center">We've found several students that have matched this name already registered in the district.  <BR>
	For security reseons we need you to confirm some additional information in order to identify/choose/associate the student.</div></td>
  </tr>
  <cfoutput query="getStudents"><tr>
    <td width="22" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center"><a href="javascript:popitup('adstudentdemo.cfm?SID=#getStudents.sid#&semester=#variables.gradeSemester#&light=');"><img src="images/folder.gif" border="0"></a></div></td>
    <td width="100" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center">#getStudents.SID#</div></td>
    <td width="284" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;">#getStudents.lname#, #getStudents.fname# </td>
    <td width="100" style="border-bottom: 1px dashed ##999;"><div align="center">#getStudents.DOB#</div></td>
  </tr></cfoutput>
  <tr>
    <td colspan="4"><div align="center" style="padding: 5px;"><input name="button" type="Submit" onClick="MM_goToURL('parent','findstudent.cfm');return document.MM_returnValue" value="Search Again" /></div></td>
    </tr>
</table--->
<cfelse>
<div align="center">
<tr><td><span style="font-weight: bold; color: red;">Search parameters undefined. Please go back and fill in at least one search field.</span></div></td></tr>
</cfif>
<tr><td><a href="tabs.cfm">Procede to tabs</a></td></tr>
</table>
</body>
<cfinclude template="includes/footer.cfm">


