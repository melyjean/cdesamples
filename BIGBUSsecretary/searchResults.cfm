<cfinclude template="adsecure.cfm">



<cfset attendanceSemester = '2'>
<cfinclude template="includes/sec_header.cfm">
<cfif (isdefined('form.lname') OR isdefined('form.fname') OR isdefined('form.SID') OR isdefined('form.confnum') OR (isdefined('form.birthmonth') AND isdefined('form.birthday') AND isdefined('form.birthyear')))
	and len(form.lname & form.fname & form.SID & form.confnum & form.birthmonth & form.birthday & form.birthyear) is not 0>
	<!-- Format Search Text for Upper Case -->
	<cfset lname = REReplace("a","[a-z]","\U#form.lname#\E", "ALL")>
	<cfset fname = REReplace("a","[a-z]","\U#form.fname#\E", "ALL")>
	
	<cfquery datasource="bigbus" name="getStudents">
		select DISTINCT sid,lname, fname, birthmonth,birthday,birthyear 
		from enroll 
		where cnum is not null
		<cfif isdefined('form.confnum') AND form.confnum neq "">AND cnum = '#form.confnum#'</cfif>
		<cfif isdefined('form.lname') AND form.lname neq "">AND lname like '#variables.lname#%'</cfif>
		<cfif isdefined('form.fname') AND form.fname neq "">AND fname like '#variables.fname#%'</cfif>
		<cfif isdefined('form.sid') AND form.sid neq "">AND sid = #form.sid#</cfif>
		<cfif (isdefined('form.birthmonth') AND form.birthmonth neq "") AND (isdefined('form.birthday') AND form.birthday neq "") AND (isdefined('form.birthyear') AND form.birthyear neq "")>AND a.birthmonth = '#form.birthmonth#' AND a.birthday = '#form.birthday#' AND a.birthyear = '#form.birthyear#'</cfif>
	</cfquery>

	<cfif getStudents.recordcount gt 0>
		<table width="450" border="0" align="center" cellpadding="3" cellspacing="0" style="border: solid 1px black;">
		  <tr class="label">
		    <td colspan="4"><div align="center">Search Results</div>      <div align="center"></div>      <div align="center"></div></td>
		  </tr>
		  <tr>
		    <td class="reportCol"><div align="center"><img src="images/eyeglass.gif" width="16" height="16"></div></td>
		    <td class="reportCol">Student ID</td>
		    <td class="reportCol">Name</td>
		    <td class="reportCol">DOB</td>
		  </tr>
		  <cfoutput query="getStudents"><tr>
		    <td width="22" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center"><a href="javascript:popitup('review_filled.cfm?cnum=123456789&semester=1&light=');"><img src="images/folder.gif" border="0"></a></div></td>
		    <td width="100" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center">#getStudents.SID#</div></td>
		    <td width="284" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;">#getStudents.lname#, #getStudents.fname# </td>
		    <td width="100" style="border-bottom: 1px dashed ##999;"><div align="center">#getStudents.birthmonth#/#getStudents.birthday#/#getStudents.birthyear#</div></td>
		  </tr></cfoutput>
	
		  <tr>
		    <td colspan="4"><div align="center" style="padding: 5px;"><input name="button" type="Submit" onClick="MM_goToURL('parent','findstudent.cfm');return document.MM_returnValue" value="Search Again" /></div></td>
		    </tr>
		</table>
	<cfelse>
		<div align="center">
		<span style="font-weight: bold; color: red;">There are no student records that match this criteria.<P><form name=return action="findstudent.cfm" method="post">
		<input type=submit value="Go Back"></form></span></div>
	</cfif>
<cfelse>
	Search parameters undefined. Please go back and fill in at least one search field.
</cfif>
<cfinclude template="includes/sec_footer.cfm">