<cfinclude template="adsecure.cfm">



<cfset attendanceSemester = '2'>
<cfinclude template="includes/sec_header.cfm">
<cfif isdefined('form.lname') OR isdefined('form.fname') OR isdefined('form.SID') OR (isdefined('form.birthmonth') AND isdefined('form.birthday') AND isdefined('form.birthyear'))>

<!-- Format Search Text for Upper Case -->
<cfset lname = REReplace("a","[a-z]","\U#form.lname#\E", "ALL")>
<cfset fname = REReplace("a","[a-z]","\U#form.fname#\E", "ALL")>

<cfif not isdefined("form.confnum") or form.confnum eq ''>
<cfquery datasource="panthertest" name="getStudents">
select DISTINCT a.sid, a.lname, a.fname, a.birthmonth||'/'||a.birthday||'/'||a.birthyear DOB
from sdem a, scen b
where a.dist='4600' and a.dist=b.dist
and b.year = '2004'
and b.status='A' 
and a.sid=b.sid
<cfif isdefined('form.lname') AND form.lname neq "">AND lname like '#variables.lname#%'</cfif>
<cfif isdefined('form.fname') AND form.fname neq "">AND fname like '#variables.fname#%'</cfif>
<cfif isdefined('form.sid') AND form.sid neq "">AND a.sid = '#form.sid#'</cfif>
<cfif (isdefined('form.birthmonth') AND form.birthmonth neq "") AND (isdefined('form.birthday') AND form.birthday neq "") AND (isdefined('form.birthyear') AND form.birthyear neq "")>AND a.birthmonth = '#form.birthmonth#' AND a.birthday = '#form.birthday#' AND a.birthyear = '#form.birthyear#'</cfif>
</cfquery>
</cfif>
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
  <cfif isdefined("form.confnum") and form.confnum neq ''>
  <tr>
    <td width="22" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center"><a href="javascript:popitup('adstudentdemo.cfm?SID=#getStudents.SID#&semester=1&light=');"><img src="images/folder.gif" border="0"></a></div></td>
    <td width="100" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center">100008343</div></td>
    <td width="284" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;">WARNOCK, JUSTIN </td>
    <td width="100" style="border-bottom: 1px dashed ##999;"><div align="center">09/16/1992</div></td>
  </tr>
  <cfelse>
  <cfoutput query="getStudents"><tr>
    <td width="22" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center"><a href="javascript:popitup('adstudentdemo.cfm?SID=#getStudents.SID#&semester=1&light=');"><img src="images/folder.gif" border="0"></a></div></td>
    <td width="100" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;"><div align="center">#getStudents.SID#</div></td>
    <td width="284" style="border-bottom: 1px dashed ##999; border-right: 1px dashed ##999;">#getStudents.lname#, #getStudents.fname# </td>
    <td width="100" style="border-bottom: 1px dashed ##999;"><div align="center">#getStudents.DOB#</div></td>
  </tr></cfoutput>
  </cfif>
  <tr>
    <td colspan="4"><div align="center" style="padding: 5px;"><input name="button" type="Submit" onClick="MM_goToURL('parent','findstudent_panther.cfm');return document.MM_returnValue" value="Search Again" /></div></td>
    </tr>
</table>
<cfelse>
<div align="center">
<span style="font-weight: bold; color: red;">Search parameters undefined. Please go back and fill in at least one search field.</span></div>
</cfif>
<cfinclude template="includes/sec_footer.cfm">