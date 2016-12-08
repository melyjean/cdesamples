<cfinclude template="adsecure.cfm">
<cfset colspan = '7'>
<cfset ct = '0'>
<cfset thisPage='school_snapshot.cfm'>

<cfparam name="sort" default="LNAME,SID">
<cfset sortlist='<option value="SID">Student ID</option>
			<!---<option value="DOB">DOB</option>--->
			<option value="LNAME">Student Name</option>'>

<!-- Get Current Year -->
<cfset today = dateformat(now(), "mm/dd")>
<cfset currentYear = dateformat(now(), "yyyy")>
<cfif variables.today gte "7/01" AND variables.today lte "12/31"><cfset schoolYear = evaluate(currentYear + 1)><cfelse><cfset schoolYear = currentYear></cfif>
<cfset CurrentDate = dateformat(now(), "mm/dd/yyyy")>
<cfset connector=''>
<cfset quote="'">

<cfflush interval="100">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>School Registration Snapshot </title>
<link href="reports.css" rel="stylesheet" type="text/css" media="screen">
<link href="noprint.css" rel="stylesheet" type="text/css" media="print">


<script>
function printpr()
{
var OLECMDID = 7;
/* OLECMDID values:
* 6 - print
* 7 - print preview
* 1 - open window
* 4 - Save As
*/
var PROMPT = 1; // 2 DONTPROMPTUSER
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
WebBrowser1.ExecWB(OLECMDID, PROMPT);
WebBrowser1.outerHTML = "";
}
</script>
</head>
<cfloop list="#session.allowedschools#" index="current_scid">
	<cfset allowedschoolslist = connector & quote & current_scid & quote>
	<cfset connector= ','>
</cfloop>

<!--- Populate student list struct with all students in school --->
<cfquery name="getAllStudentsInSchool" datasource="panther">
	select a.sid, a.dist, enrollstatus, scid,
	ltrim(f.lname) as LNAME,ltrim(f.fname) as FNAME,
	f.birthmonth||'/'||f.birthday||'/'||f.birthyear as DOB
	enrollmonth||'/'||enrollday||'/'||enrollyear as enroll_dt, 
	dropmonth||'/'||dropday||'/'||dropyear as drop_dt, enrollcode
	from ssen a, sdem f
	where a.dist = '4600'
	and f.sid = a.sid
	and f.dist = a.dist
	and enrollstatus='A'
	and a.scid in (#PreserveSingleQuotes(allowedschoolslist)#)
	ORDER BY <cfif isdefined('form.Sort1') AND form.sort1 neq "">#Sort1#<cfelse>#variables.sort#</cfif><cfif isdefined('form.DESC') AND form.DESC eq "DESC"> DESC</cfif><cfif isdefined('form.sort2') AND form.sort2 neq "">,#Sort2#</cfif><cfif isdefined('form.sort3') AND form.sort3 neq "">,#Sort3#</cfif><cfif isdefined('form.sort4') AND form.sort4 neq "">,#Sort4#</cfif>
</cfquery>

<cfloop query="getAllStudentsInSchool">
   
	<cfif len(getAllStudentsInSchool.drop_dt) eq 2> 
		<cfset drpdt = ''>
	<cfelse>
		<cfset drpdt = getAllStudentsInSchool.drop_dt>
	</cfif>
	<cfset val = getAllStudentsInSchool.LNAME & '|' & getAllStudentsInSchool.FNAME & '|' & getAllStudentsInSchool.DOB & '|' & getAllStudentsInSchool.enroll_dt & '|' &drpdt>
	<cfif not StructKeyExists(allStudents, getAllStudentsInSchool.sid)>
		<cfset a = StructInsert(allStudents, getAllStudentsInSchool.sid, val)>
	</cfif>
</cfloop>

<cfquery name="getStudents" datasource="bigbus">
	select cnum, sid, lname, fname,
	birthmonth, birthday, birthyear,
	APPROVAL_DATE, approvedby, enroll_scid
	from enroll
	where Approved = 'Y'
	and enroll_scid in (#PreserveSingleQuotes(allowedschoolslist)#)
	ORDER BY <cfif isdefined('form.Sort1') AND form.sort1 neq "">#Sort1#<cfelse>#variables.sort#</cfif><cfif isdefined('form.DESC') AND form.DESC eq "DESC"> DESC</cfif><cfif isdefined('form.sort2') AND form.sort2 neq "">,#Sort2#</cfif><cfif isdefined('form.sort3') AND form.sort3 neq "">,#Sort3#</cfif><cfif isdefined('form.sort4') AND form.sort4 neq "">,#Sort4#</cfif>
</cfquery>

<body>
<!---cfinclude template="sortbar.cfm"--->
<cfoutput>
<cfinclude template="sortbar.cfm">
<form>
  <table border="0" align="center" cellpadding="0" cellspacing="2" class="mainTable">
    <tr id="print" height="54">
      <td colspan="3" class="header"><div align="right"></div></td>
    </tr>
    <tr height="10">
      <td colspan="3" align="center"><span class="title">School Snapshot Report</span> <A NAME="topOfReport"></A><br />
      <div class="date" style="align: right;">#CurrentDate#</div>
	  </td>
	</tr>
	<tr>
      <td colspan="3" style="vertical-align:top;"><table width="100%" border="0" cellpadding="2" cellspacing="0" class="contentTable">
		<cfloop query="getStudents">
		   	<cfset ct=ct +1>
			  <cfif ct eq 1>
			  <TR><TD id="sect1" colspan="#colspan#">
			  <table width="100%" border="0" cellpadding="2" cellspacing="0" class="contentTable">
				<tr>
            <th style="border-left: 1px solid black;" align="center">Student ID</th>
			<th style="border-left: 1px solid black;" align="center">Name</th>
            <th style="border-left: 1px solid black;" width="50" align="center">DOB</th>
         </tr>
			</cfif>
			<tr><td colspan=3 class="date" style="border-left: 1px solid black;" align="center">STUDENTS WITH APPROVED REGISTRATION RECORDS FOR THIS SCHOOL</td></tr>
			<!---tr><td colspan=3 class="date" style="border-left: 1px solid black;" align="center">REGISTERD STUDENTS WHO HAVE NOT USED THE ONLINE REGISTRATION SYSTEM TO UPDATE THEIR RECORD</td></tr--->
	            <tr onMouseOver="this.style.background='##EBEBEB';" onMouseOut="this.style.background='##FFFFFF';">
				  <td class="reportRow" style="border-left: 0px;"><a href="review_filled.cfm?SID=#getStudents.sid#&semester=1&light=" target="_blank">#getStudents.sid#</a></td>
	              <td class="reportRow">#getStudents.lname#,&nbsp;#getStudents.fname#</td>
				  <td class="reportRow">#getStudents.birthmonth#/#getStudents.birthday#/#getStudents.birthyear# </td>
            </tr>
			<cfset a = StructDelete(allStudents,getStudents.sid)>
			<cfif ct eq getStudents.recordcount>
				</table>
			</cfif>
		  </cfloop>
		  <cfloop collection="#allstudents#" item="stdt" delimiters="|"></cfloop>
		   	<cfset ct=ct +1>
			  <cfif ct eq 1>
			  <TR><TD id="sect1" colspan="#colspan#">
			  <table width="100%" border="0" cellpadding="2" cellspacing="0" class="contentTable">
				<tr>
            <th style="border-left: 1px solid black;" align="center">Student ID</th>
			<th style="border-left: 1px solid black;" align="center">Name</th>
            <th style="border-left: 1px solid black;" width="50" align="center">DOB</th>
			<th style="border-left: 1px solid black;" width="50" align="center">Enroll Date</th>
			<th style="border-left: 1px solid black;" width="50" align="center">Drop Date</th>
         </tr>
			</cfif>
			<tr><td colspan=3 class="date" style="border-left: 1px solid black;" align="center">REGISTERD STUDENTS WHO HAVE NOT USED THE ONLINE REGISTRATION SYSTEM TO UPDATE THEIR RECORD</td></tr>
	            <tr onMouseOver="this.style.background='##EBEBEB';" onMouseOut="this.style.background='##FFFFFF';">
				  <td class="reportRow" style="border-left: 0px;"><a href="review_filled.cfm?SID=#stdt#&semester=1&light=" target="_blank">#stdt#</a></td>
	              <td class="reportRow">#listGetAt(allstudents[stdt], 1,"|")#,&nbsp;#listGetAt(allstudents[stdt], 2,"|")#</td>
				  <td class="reportRow">#listGetAt(allstudents[stdt], 3,"|")#</td>
				  <td class="reportRow">#listGetAt(allstudents[stdt], 4,"|")#</td>
				  <td class="reportRow">#listGetAt(allstudents[stdt], 5,"|")#</td>
            </tr>
			<cfset a = StructDelete(allStudents,getStudents.sid)>
			<cfif ct eq getStudents.recordcount>
				</table>
			</cfif>
		  </cfloop>
          <tr>
            <td colspan="7">
			<!---div align="left" style="font-size: .8em;">Key for System Notes:<br />
				1 = Folder was not checked out of previous location <br />
				2 =  Current school was not the intended destination school of the record<br />
				3 = Record was not checked into the current school (discovered while attempting to check a record out of a school)<br />
				4 - Already checked into current school<br />
				5 - Already checked out of current school<br />
			</div--->
							  							  <br />
			<div align="center" id="PRINT" style="padding-top: 10px;"><input type='button' value="Print Preview" onClick="printpr();">
                <script language="Javascript">

/*
This script is written by Eric (Webcrawl@usa.net)
For full source code, installation instructions,
100's more DHTML scripts, and Terms Of
Use, visit dynamicdrive.com
*/

function printit(){
if (window.print) {
    window.print() ;
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";
}
}
  </script>
                <script language="Javascript">
var NS = (navigator.appName == "Netscape");
var VERSION = parseInt(navigator.appVersion);
if (VERSION > 3) {
    document.write('<form><input type=button value="&nbsp;&nbsp;Print&nbsp;&nbsp;" name="Print" onClick="printit()"></form>');
}
  </script>
            </div></td>
          </tr></form> </cfoutput>
      </table></td>
    </tr>
  </table>
  <!---cfelse>
<div align="center"><h2>No records to display.</h2></div>
</cfif--->
</body>
</html>
