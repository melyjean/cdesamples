<cfinclude template="adsecure.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/summary.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/style_v1.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/printforms.css" media="print">
<link href="css/english.css" rel="stylesheet" type="text/css" title="english">
<script type="text/javascript" src="scripts/styleswitcher.js"></script>
<script type="text/javascript" src="scripts/styleswitcher.js"></script>
<title>U-46 Enrollment Form</title>
<style>
	<!--
body {
	text-transform:uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
}
-->
</style>
</head>

<body onLoad="setActiveStyleSheet('english')" >
<cfif IsDefined("url.cnum")>
<cfset form.cnum = url.cnum>
</cfif>
<cfset today = dateformat(now(), "mm/dd")>
<cfset currentYear = dateformat(now(), "yyyy")>
<cfset currentday = dateformat(now(), "dd")>
<cfif variables.today gte "7/01" AND variables.today lte "12/31"><cfset schoolYear = evaluate(currentYear + 1)><cfelse><cfset schoolYear = currentYear></cfif>
<cfoutput>

	
	<cfif IsDefined("form.cnum") and form.cnum neq ''>
	<cfquery datasource="bigbus" name="getStudents">
		select * 
		from enroll 
		where cnum=<cfqueryparam value = "#form.cnum#" cfsqltype = "cf_sql_char" maxLength = "9">
	</cfquery>
  <cfif getStudents.recordcount eq 1>
		<table width="700" border="0" align="center" cellpadding="4" cellspacing="0" style="border: 1px solid black;">
		<CFLOOP QUERY="getStudents">
			<form method=post action="review_filled_edit.cfm">  
			<tr>
			<td colspan="4" style="border-bottom: 1px solid black; height: 32px; vertical-align: bottom; font-size: 18pt;"><strong>Enrollment form summary </strong></td>
			<td colspan="2" style="border-bottom: 1px solid black; vertical-align: top; text-align: right;"><strong>Confirmation no. #form.cnum#</strong><BR>      
			<input type="hidden" name="cnum" value="#form.cnum#">
			<input type="submit" value="&nbsp;&nbsp;Edit&nbsp;&nbsp;" <cfif #getStudents.approved# eq 'Y'> disabled</cfif>/></td>
          </form> 	
		  </tr>		
		  <tr>
		    <td width="95"><strong>Student Name: </strong></td>
		    <td colspan="3">#getStudents.LNAME#, #getStudents.FNAME# #getStudents.MNAME# </td>
		    <td colspan="2"><strong>Date of Birth</strong>: #getStudents.BIRTHMONTH#/#getStudents.BIRTHDAY#/#getStudents.BIRTHYEAR# </td>
		  </tr>
		  <tr>
		    <td valign="top"><strong>Birth Place: </strong></td>
		    <td width="123" valign="top">#getStudents.BIRTHCITY#<br /><label id="ENGs">(CITY)</label></td>
		    <td width="127" valign="top">#getStudents.BIRTHCNTY#<br /><label id="ENGs">(COUNTY)</label></td>
		    <td width="108" valign="top"><cfif StructKeyExists(session.stateStruct, getStudents.BIRTHState)>#session.stateStruct[getStudents.BIRTHState]#</cfif><br />
		      <label id="ENGs">(STATE)</label></td>
		    <td width="155" valign="top"><cfif StructKeyExists(session.countryStruct, getStudents.BIRTHCNTRY)>#session.countryStruct[getStudents.BIRTHCNTRY]#</cfif><br />
		      <label id="ENGs">(COUNTRY)</label></td>
		    <td width="18" valign="top">&nbsp;</td>
		  </tr>
		  <tr>
		    <td><strong>Gender:</strong></td>
		    <td>#getStudents.GENDER#</td>
		    <td><strong>Ethnic:</strong></td>
		    <td><cfif StructKeyExists(session.ethnicStruct, getStudents.ethnic)>#session.ethnicStruct[getStudents.ethnic]#</cfif></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="3"><strong>Month/Year of first entry into U.S. Schools (K-12): </strong></td>
		    <td>#getStudents.ENTRYMONTH#/#getStudents.ENTRYYEAR#</td>
		    <td><strong>Refugee:</strong>#getStudents.REFUGEE# </td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="3"><strong>Years of Education in U.S. Schools (K-12): </strong></td>
		    <td>#getStudents.YOE#</td>
		    <td><strong>Current Grade:</strong>#getStudents.CURRENTGRADE# </td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr><cfset adf = StructKeyList(session.familyStruct)>
		    <td><strong>Father's Name: </strong></td>
		    <td colspan="3">#getStudents.FLNAME#, #getStudents.FFNAME#</td>
		    <td colspan="2"><strong>Type:</strong><cfif StructKeyExists(session.familyStruct, getStudents.ftype)>#session.familyStruct[getStudents.ftype]#</cfif></td>
		  </tr>
		  <tr>
		    <td><strong>Home Phone:</strong> </td>
		    <td>#getStudents.FAREA# #getStudents.FPREFIX# -#getStudents.FSUFFIX#</td>
		    <td><strong>Unlisted:</strong>#getStudents.F_UNLISTED# </td>
		    <td><strong>Work Phone:</strong> </td>
		    <td>#getStudents.FWORKAREA# #getStudents.FWORKPREFIX# -#getStudents.FWORKSUFFIX#</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td><strong>Cell Phone: </strong></td>
		    <td colspan="2">#getStudents.FCELLAREA# #getStudents.FCELLPREFIX# -#getStudents.FCELLSUFFIX#</td>
		    <td colspan="3"><strong>Email:</strong> #getStudents.F_EMAIL# </td>
		  </tr>
		  <tr>
		    <td colspan="3"><strong>Student Resides with:</strong> #getStudents.F_RESIDESWITH# </td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td><strong>Mother's Name: </strong></td>
		    <td colspan="3">#getStudents.MLNAME#, #getStudents.MFNAME# </td>
		    <td colspan="2"><strong>Type:</strong><cfif StructKeyExists(session.familyStruct, getStudents.mtype)>#session.familyStruct[getStudents.mtype]#</cfif></td>
		  </tr>
		  <tr>
		    <td><strong>Home Phone: </strong></td>
		    <td>#getStudents.MAREA# #getStudents.MPREFIX# -#getStudents.MSUFFIX# </td>
		    <td><strong>Unlisted:</strong> #getStudents.M_UNLISTED# </td>
		    <td><strong>Work Phone: </strong></td>
		    <td>#getStudents.MWORKAREA# #getStudents.MWORKPREFIX# - #getStudents.MWORKSUFFIX# </td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td><strong>Cell Phone: </strong></td>
		    <td colspan="2">#getStudents.MCELLAREA# #getStudents.MCELLPREFIX# - #getStudents.MCELLSUFFIX# </td>
		    <td colspan="3"><strong>Email:</strong> #getStudents.M_EMAIL# </td>
		  </tr>
		  <tr>
		    <td colspan="3"><strong>Student Resides with: </strong>#getStudents.M_RESIDESWITH# </td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td><strong>Primary Address: </strong></td>
		    <td colspan="5">#getStudents.mailsal# #getStudents.STREET# #getStudents.STREETNAME# #getStudents.STREETSUFFIX# </td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>#getStudents.CITY# ,</td>
		    <td><cfif StructKeyExists(session.stateStruct, getStudents.State)>#session.stateStruct[getStudents.State]#<cfelse>#getStudents.State#</cfif></td>
		    <td>#getStudents.ZIP#</td>
		    <td>#getStudents.COUNTY#</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="2"><strong> </td>
		    <td colspan="2"><strong>Preferred Mail Language:</strong><cfif StructKeyExists(session.languageStruct, getStudents.MAILLANGUAGE)>#session.languageStruct[getStudents.MAILLANGUAGE]#<cfelse>#getStudents.MAILLANGUAGE#</cfif></td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td colspan="6"><strong>Last School Attended : </strong>#getStudents.LASTSCHOOL# </td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="5">#getStudents.LS_STREET# </td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>#getStudents.LS_CITY#</td>
		    <td><cfif StructKeyExists(session.stateStruct, getStudents.LS_STATE)>#session.stateStruct[getStudents.LS_STATE]#<cfelse>#getStudents.LS_STATE#</cfif></td>
		    <td>#getStudents.LS_ZIP#</td>
		    <td><cfif StructKeyExists(session.countryStruct, getStudents.LS_COUNTRY)>#session.countryStruct[getStudents.LS_COUNTRY]#</cfif></td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td><strong>Date Started: </strong></td>
		    <td>#getStudents.LS_STARTMONTH#/#getStudents.LS_STARTDAY#/#getStudents.LS_STARTYEAR#</td>
		    <td><strong>Date Left: </strong></td>
		    <td>#getStudents.ls_ENDMONTH#/#getStudents.LS_ENDDAY#/#getStudents.LS_ENDYEAR#</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3"><strong>Student has previously attended U-46 School?</strong> #getStudents.PREVU46# </td>
		    <td colspan="2"><strong>Last Date:</strong> #getStudents.PREVMONTH#/ #getStudents.PREVDAY# / #getStudents.PREVYEAR# </td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td colspan="2"><strong>Emergency Contacts </strong></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="2">#getStudents.E1LNAME#, #getStudents.E1FNAME#</td>
		    <td>#getStudents.E1RELATION#</td>
		    <td colspan="2">#getStudents.E1AREA# #getStudents.E1PREFIX# - #getStudents.E1SUFFIX# </td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="2">#getStudents.E2LNAME#, #getStudents.E2FNAME# </td>
		    <td>#getStudents.E2RELATION#</td>
		    <td colspan="2">#getStudents.E2SUFFIX# #getStudents.E2PREFIX# - #getStudents.E2SUFFIX# </td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td valign="top"><strong>Health Concerns: </strong></td>
		    <td colspan="5" valign="top">#getStudents.HEALTHCONCERNS#</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="3"><strong>Does the student routinely take medications:</strong> #getStudents.MEDICATION# </td>
		    <td colspan="2"><strong>Where:</strong> #getStudents.MEDS_HOME# #getStudents.MEDS_SCHOOL# </td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td><strong>Glasses:</strong> #getStudents.GLASSES# </td>
		    <td><strong>Contacts:</strong> #getStudents.CONTACTS# </td>
		    <td colspan="2"><strong>Hearing Aid:</strong> #getStudents.HEARINGAID#</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td valign="top"><strong>Other Health Info:</strong> </td>
		    <td colspan="4" valign="top">#getStudents.HEALTHCOMMN#&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="6"><hr /></td>
		  </tr>
		  <tr>
		    <td><strong>Language Survey: </strong></td>
		    <td colspan="2"><strong>Other home language spoken?</strong> #getStudents.HOMELANG# </td>
		    <td><strong>Language:</strong><cfif StructKeyExists(session.languageStruct, getStudents.HOMELANGUAGE)>#session.languageStruct[getStudents.HOMELANGUAGE]#<cfelse>#getStudents.HOMELANGUAGE#</cfif></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td colspan="2"><strong>Other student language spoken?</strong> #getStudents.STUDLANG# </td>
		    <td><strong>Language:</strong><cfif StructKeyExists(session.languageStruct, getStudents.STUDLANGUAGE)>#session.languageStruct[getStudents.STUDLANGUAGE]#<cfelse>#getStudents.STUDLANGUAGE#</cfif></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		  <form method=post action="success.cfm">
		      <tr><td colspan=6><cfinclude template="includes/enrollment_check_tbl.cfm"></td></tr>
			<cfif #getStudents.approved# eq 'Y'>
				<tr>
					<td colspan=6 style="font-weight: bold; border-top: 1px solid black;">Approved by #getStudents.approvedby# on #getStudents.approval_date#</td>
				</tr>
			</cfif>		  
			<tr>
		    <td colspan="6" style="padding: 5px; background-color:##EBEBEB;"><div align="center">
		      <input type="submit" name=submit value="Submit To Panther" <cfif #getStudents.approved# eq 'Y'> disabled</cfif> onclick='javascript:confirm("Are you sure you want to import this data into Panther?");'>
		    </div></td>
		  </tr>
	  </form> 
	  	  <tr>
		    <td colspan="6"><div align=center>
			<script language="Javascript1.2">
			<!--
			// please keep these lines on when you copy the source
			// made by: Nicolas - http://www.javascript-page.com
			
			var message = "Print Registration Forms";
			
			function printpage() {
			window.print();
			}
			
			document.write("<form><input type=button "
			+"value=\""+message+"\" onClick=\"printpage()\"></form>");
			
			//-->
			</script><br />
			</td></tr></table>
				<div id="print">
				    <div id="pagebreak"></div>
					<cfinclude template="print/registration.cfm" />
					<div id="pagebreak"></div>
					<cfinclude template="print/emergency.cfm" />
					<div id="pagebreak"></div>
					<div id="print"><cfinclude template="print/language.cfm" /></div>
					<div id="pagebreak"></div>
					<cfinclude template="print/custody.cfm" />
				</div>

  </cfloop>
  <cfelseif getStudents.recordcount gt 1>
	  There is more than one record with this confirmation number.  Please contact the Help Desk.
  <cfelse>
	  There are no records with this confirmation number.
  </cfif>  

<cfelse>
No confirmation number provided.
</cfif>
</cfoutput>
</body>
</html>
