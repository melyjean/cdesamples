<cfinclude template="adsecure.cfm">
<cfinclude template="globalvars.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/summary.css">
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

<body>

<cfoutput>
	<table width="700" border="1" align="center" cellpadding="4" cellspacing="0" style="border: 1px solid black;">

	<cfif IsDefined("form.cnum") and form.cnum neq ''>
	<cfquery datasource="bigbus" name="getStudents">
		select *
		from enroll
		where cnum=<cfqueryparam value = "#form.cnum#" cfsqltype = "cf_sql_char" maxLength = "9">
	</cfquery>
	<!---#getStudents.columnlist#--->
  <cfif getStudents.recordcount gte 1>
	<CFLOOP QUERY="getStudents">
	<cfif #getStudents.approved# eq 'Y'>
		<script language="javascript1.1">alert("You cannot edit a student information in this interface once it has been submitted to Panther.  Please use Panther to change the student data.");</script> 
		<cflocation url="review_filled.cfm?cnum=#form.cnum#" addtoken="No">
	</cfif>
<form method=post action="success.cfm">
  <tr>
    <td colspan="4" style="border-bottom: 1px solid black; height: 32px; vertical-align: bottom; font-size: 18pt;"><strong>Enrollment form summary </strong></td>
	<td colspan="2" style="border-bottom: 1px solid black; vertical-align: top; text-align: right;"><strong>Confirmation no. #getStudents.cnum#</strong></td>
  </tr>
  <tr>
    <td width="95"><strong>Student Name: </strong></td>
    <td><input type=text name=LNAME value="#getStudents.LNAME#">,<br><label id="ENGs">(Last)</label></td>
	<td><input type=text name=FNAME value="#getStudents.FNAME#"><br><label id="ENGs">(First)</label> </td>
	<td><input type=text name=MNAME value="#getStudents.MNAME#"><br><label id="ENGs">(Middle)</label></td>
    <td colspan="2"><strong>Date of Birth</strong>: <input type=text size="2" maxlength="2" name=BIRTHMONTH value="#getStudents.BIRTHMONTH#">/<input type=text size="2" maxlength="2" name=BIRTHDAY value="#getStudents.BIRTHDAY#">/<input type=text size="4" maxlength="4" name=BIRTHYEAR value="#getStudents.BIRTHYEAR#"> </td>
  </tr>
  <tr>
    <td valign="top"><strong>Birth Place: </strong></td>
    <td width="123" valign="top"><input type=text name=BIRTHCITY value="#getStudents.BIRTHCITY#"><br /><label id="ENGs">(CITY)</label></td>
    <td width="127" valign="top"><input type=text name=BIRTHCNTY value="#getStudents.BIRTHCNTY#"><br /><label id="ENGs">(COUNTY)</label></td>
    <td width="108" valign="top"><input type=text name=BIRTHSTATE value="#getStudents.BIRTHSTATE#"><br />
      <label id="ENGs">(STATE)</label></td>
    <td width="155" valign="top">
	            <select name="BIRTHCNTRY">
				<OPTION VALUE="">--Country--</OPTION>
				<cfloop collection="#session.countryStruct#" item="current_country">
					<option value="#current_country#"<cfif #trim(getStudents.BIRTHCNTRY)# eq #trim(current_country)#> selected</cfif>><cfif StructKeyExists(session.countryStruct, current_country)>#session.countryStruct[current_country]#<cfelse>Elsewhere</cfif></option>
				</cfloop>
				</select><br />
      <label id="ENGs">(COUNTRY)</label></td>
    <td width="18" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Gender:</strong></td>
    <td>
	<input name="GENDER" type="radio" value="M" <cfif getStudents.gender eq 'M'>CHECKED</cfif> />
     Male
     &nbsp; &nbsp;
     <input name="GENDER" type="radio" value="F" <cfif getStudents.gender eq 'F'>CHECKED</cfif> />
     Female
	 </td>
    <td><strong>Ethnic:</strong></td>
    <td> <select name="Ethnic">
				<OPTION VALUE="">--Country--</OPTION>
				<cfloop collection="#session.ethnicStruct#" item="current_ethnicity">
					<option value="#current_ethnicity#"<cfif #trim(getStudents.ethnic)# eq #trim(current_ethnicity)#> selected</cfif>><cfif StructKeyExists(session.ethnicStruct, current_ethnicity)>#session.ethnicStruct[current_ethnicity]#<cfelse>Elsewhere</cfif></option>
				</cfloop>
				</select>
	</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><strong>Month/Year of first entry into U.S. Schools (K-12): </strong></td>
    <td><input type=text name=ENTRYMONTH size="2" maxlength="2" value="#getStudents.ENTRYMONTH#">/<input type=text name=ENTRYYEAR size="2" maxlength="2" value="#getStudents.ENTRYYEAR#"></td>
    <td><strong>Refugee:</strong> 
	<input name="REFUGEE" type="radio" value="Y" <cfif getStudents.REFUGEE eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="REFUGEE" type="radio" value="N" <cfif getStudents.REFUGEE eq 'N'>CHECKED</cfif> />
     No  
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><strong>Years of Education in U.S. Schools (K-12): </strong></td>
    <td><input type=text name=YOE size="2" maxlength="2" value="#getStudents.YOE#"></td>
    <td><strong>Current Grade:</strong> <input type=text name=CURRENTGRADE size="2" maxlength="2" value="#getStudents.CURRENTGRADE#"> </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td><strong>Father's Name: </strong></td>
    <td><input type=text name=FLNAME value="#getStudents.FLNAME#">,<br><label id="ENGs">(Last)</label></td>
	<td><input type=text name=FFNAME value="#getStudents.FFNAME#"><br><label id="ENGs">(First)</label></td>
	<td>&nbsp;</td>
    <td colspan="2"><strong>Type:</strong> 
	<select name="FTYPE">
		<OPTION VALUE="">--Guardian Type--</OPTION>
		<cfloop collection="#session.familyStruct#" item="current_fam">
			<option value="#current_fam#"<cfif #trim(getStudents.FTYPE)# eq #trim(current_fam)#> selected</cfif>><cfif StructKeyExists(session.familyStruct, current_fam)>#session.familyStruct[current_fam]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select>
  </tr>
  <tr>
    <td><strong>Home Phone:</strong> </td>
    <td><input type=text name=FAREA size="3" maxlength="3" value="#getStudents.FAREA#">-
	<input type=text name=FPREFIX size="3" maxlength="3" value="#getStudents.FPREFIX#">-
	<input type=text name=FSUFFIX size="4" maxlength="4" value="#getStudents.FSUFFIX#"> 
	</td>
    <td><strong>Unlisted:</strong> 
	<input name="F_UNLISTED" type="radio" value="Y" <cfif getStudents.F_UNLISTED eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="F_UNLISTED" type="radio" value="N" <cfif getStudents.F_UNLISTED eq 'N'>CHECKED</cfif> />
     No 
	 </td>
    <td><strong>Work Phone:</strong> </td>
    <td><input type=text name=FWORKAREA size="3" maxlength="3" value="#getStudents.FWORKAREA#">-
	<input type=text name=FWORKPREFIX size="3" maxlength="3" value="#getStudents.FWORKPREFIX#">-
	<input type=text name=FWORKSUFFIX size="4" maxlength="4" value="#getStudents.FWORKSUFFIX#"> 
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Cell Phone: </strong></td>
    <td colspan="2"><input type=text name=FCELLAREA size="3" maxlength="3" value="#getStudents.FCELLAREA#">-
	<input type=text name=FCELLPREFIX size="3" maxlength="3" value="#getStudents.FCELLPREFIX#">-
	<input type=text name=FCELLSUFFIX size="4" maxlength="4" value="#getStudents.FCELLSUFFIX#">  
	</td>
    <td colspan="3"><strong>Email:</strong> <input type=text name=F_EMAIL value="#getStudents.F_EMAIL#"> </td>
  </tr>
  <tr>
    <td colspan="3"><strong>Student Resides with:</strong> 
	<input name="F_RESIDESWITH" type="radio" value="Y" <cfif getStudents.F_RESIDESWITH eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="F_RESIDESWITH" type="radio" value="N" <cfif getStudents.F_RESIDESWITH eq 'N'>CHECKED</cfif> />
     No 
	</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td><strong>Mother's Name: </strong></td>
    <td><input type=text name=MLNAME value="#getStudents.MLNAME#">,<br><label id="ENGs">(Last)</label></td>
	<td><input type=text name=MFNAME value="#getStudents.MFNAME#"><br><label id="ENGs">(First)</label></td>
	<td>&nbsp;</td>
    <td colspan="2"><strong>Type:</strong> 
<select name="MTYPE">
		<OPTION VALUE="">--Guardian Type--</OPTION>
		<cfloop collection="#session.familyStruct#" item="current_fam">
			<option value="#current_fam#"<cfif #trim(getStudents.MTYPE)# eq #trim(current_fam)#> selected</cfif>><cfif StructKeyExists(session.familyStruct, current_fam)>#session.familyStruct[current_fam]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select>
  </tr>
  <tr>
    <td><strong>Home Phone: </strong></td>
    <td><input type=text name=MAREA size="3" maxlength="3" value="#getStudents.MAREA#">-
	<input type=text name=MPREFIX size="3" maxlength="3" value="#getStudents.MPREFIX#">-
	<input type=text name=MSUFFIX size="4" maxlength="4" value="#getStudents.MSUFFIX#">  
	</td>
    <td><strong>Unlisted:</strong> 
	<input name="M_UNLISTED" type="radio" value="Y" <cfif getStudents.M_UNLISTED eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="M_UNLISTED" type="radio" value="N" <cfif getStudents.M_UNLISTED eq 'N'>CHECKED</cfif> />
     No 
	</td>
    <td><strong>Work Phone: </strong></td>
    <td><input type=text name=MWORKAREA size="3" maxlength="3" value="#getStudents.MWORKAREA#">-
	<input type=text name=MWORKPREFIX size="3" maxlength="3" value="#getStudents.MWORKPREFIX#">-
	<input type=text name=MWORKSUFFIX size="4" maxlength="4" value="#getStudents.MWORKSUFFIX#">  
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>Cell Phone: </strong></td>
    <td colspan="2"><input type=text name=MCELLAREA size="3" maxlength="3" value="#getStudents.MCELLAREA#">-
	<input type=text name=MCELLPREFIX size="3" maxlength="3" value="#getStudents.MCELLPREFIX#">-
	<input type=text name=MCELLSUFFIX size="4" maxlength="4" value="#getStudents.MCELLSUFFIX#">  
	 </td>
    <td colspan="3"><strong>Email:</strong> <input type=text name=M_EMAIL value="#getStudents.M_EMAIL#"> </td>
  </tr>
  <tr>
    <td colspan="3"><strong>Student Resides with: </strong>
	<input name="M_RESIDESWITH" type="radio" value="Y" <cfif getStudents.M_RESIDESWITH eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="M_RESIDESWITH" type="radio" value="N" <cfif getStudents.M_RESIDESWITH eq 'N'>CHECKED</cfif> />
	 No 
    </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td><strong>Primary Address: </strong></td>
    <td><input type=text name=mailsal value="#getStudents.mailsal#"> <br><label id="ENGs">(Mail Salutation)</label> </td>
	<td><input type=text name=STREET value="#getStudents.STREET#"> <br><label id="ENGs">(Street Number)</label> </td>
	<td><select name="DIRECTION">
		<OPTION VALUE="">--Direction--</OPTION>
		<cfloop collection="#session.directionStruct#" item="current_direction">
			<option value="#current_direction#"<cfif #trim(getStudents.DIRECTION)# eq #trim(current_direction)#> selected</cfif>><cfif StructKeyExists(session.directionStruct, current_direction)>#session.directionStruct[current_direction]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select><br><label id="ENGs">(Street DIRECTION)</label> </td>
	<td><input type=text name=STREETNAME value="#getStudents.STREETNAME#"> <br><label id="ENGs">(Street Name)</label> </td>
	<td><select name="STREETSUFFIX">
		<OPTION VALUE="">--Street Type--</OPTION>
		<cfloop collection="#session.streetSuffixStruct#" item="current_suffix">
			<option value="#current_suffix#"<cfif #trim(getStudents.STREETSUFFIX)# eq #trim(current_suffix)#> selected</cfif>><cfif StructKeyExists(session.streetSuffixStruct, current_suffix)>#session.streetSuffixStruct[current_suffix]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select> <br><label id="ENGs">(Street Suffix)</label> 
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type=text name=CITY value="#getStudents.CITY#"> <br><label id="ENGs">(City)</label> </td>
    <td><select name="STATE">
		<OPTION VALUE="">--STATE--</OPTION>
		<cfloop collection="#session.stateStruct#" item="current_state">
			<option value="#current_state#"<cfif #trim(getStudents.state)# eq #trim(current_state)#> selected</cfif>><cfif StructKeyExists(session.stateStruct, current_state)>#session.stateStruct[current_state]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
		</select> <br><label id="ENGs">(State)</label>
	</td>
    <td><input type=text name=ZIP value="#getStudents.ZIP#"> <br><label id="ENGs">(Zip)</label></td>
    <td><select name="COUNTY">
		<OPTION VALUE="">--COUNTY--</OPTION>
		<cfloop collection="#session.countyStruct#" item="current_county">
			<option value="#current_county#"<cfif #trim(getStudents.COUNTY)# eq #trim(current_county)#> selected</cfif>><cfif StructKeyExists(session.countyStruct, current_county)>#session.countyStruct[current_county]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
		</select> <br><label id="ENGs">(County)</label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="4"><strong>Preferred Mail Language:</strong>
	  <input name="MAILLANGUAGE" type="radio" value="000" <cfif getStudents.MAILLANGUAGE eq '000'>CHECKED</cfif> />
	       English
	       &nbsp; &nbsp;
	       <input name="MAILLANGUAGE" type="radio" value="001" <cfif getStudents.MAILLANGUAGE eq '0001'>CHECKED</cfif> />
	       Spanish 
	 </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td colspan="6"><strong>Last School Attended : </strong>
	<input type=text name=LASTSCHOOL value="Central Middle School"> 
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="5"><strong>Street:</strong><input type=text name=LS_STREET value="#getStudents.LS_STREET#"> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><strong>City: </strong>#getStudents.LS_CITY#</td>
    <td><strong>State: </strong>
	<select name="LS_STATE">
		<OPTION VALUE="">--Last School State--</OPTION>
		<cfloop collection="#session.stateStruct#" item="current_state">
			<option value="#current_state#"<cfif #trim(getStudents.LS_STATE)# eq #trim(current_state)#> selected</cfif>><cfif StructKeyExists(session.stateStruct, current_state)>#session.stateStruct[current_state]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select> 
	</td>
    <td><strong>Zip: </strong><input type=text name=LS_ZIP value="#getStudents.LS_ZIP#"></td>
    <td>	            
	<select name="LS_COUNTRY">
		<OPTION VALUE="">--Last School Country--</OPTION>
		<cfloop collection="#session.countryStruct#" item="current_country">
			<option value="#current_country#"<cfif #trim(getStudents.LS_COUNTRY)# eq #trim(current_country)#> selected</cfif>><cfif StructKeyExists(session.countryStruct, current_country)>#session.countryStruct[current_country]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select>
	 </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><strong>Date Started: </strong></td>
    <td><input type=text name=LS_STARTMONTH size="2" maxlength="2" value="#getStudents.LS_STARTMONTH#">/<input type=text name=LS_STARTDAY size="2" maxlength="2" value="#getStudents.LS_STARTDAY#">/<input type=text name=LS_STARTYEAR size="2" maxlength="2" value="#getStudents.LS_STARTYEAR#"></td>
    <td><strong>Date Left: </strong></td>
    <td><input type=text name=ls_ENDMONTH size="2" maxlength="2" value="#getStudents.ls_ENDMONTH#">/<input type=text name=LS_ENDDAY size="2" maxlength="2" value="#getStudents.LS_ENDDAY#">/<input type=text name=LS_ENDYEAR size="2" maxlength="2" value="#getStudents.LS_ENDYEAR#"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="3"><strong>Student has previously attended U-46 School?</strong> 
	<input name="PREVU46" type="radio" value="Y" <cfif getStudents.PREVU46 eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="PREVU46" type="radio" value="N" <cfif getStudents.PREVU46 eq 'N'>CHECKED</cfif> />
     No
	</td>
    <td colspan="2"><strong>Last Date:</strong> 
	<input type=text name=PREVMONTH size="2" maxlength="2" value="#getStudents.PREVMONTH#">/<input type=text name=PREVDAY size="2" maxlength="2" value="#getStudents.PREVDAY#">/<input type=text size="2" maxlength="2" name=PREVYEAR value="#getStudents.PREVYEAR#">
	 </td>
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
    <td><input type=text name=E1LNAME value="#getStudents.E1LNAME#">,<BR><label id="ENGs">(Last)</label></td>
	<td><input type=text name=E1FNAME value="#getStudents.E1FNAME#"><BR><label id="ENGs">(First)</label></td>
    <td><input type=text name=E1RELATION value="E1RELATION"></td>
    <td colspan="2"><input type=text name=E1AREA value="#getStudents.E1AREA#">-
	<input type=text name=E1PREFIX value="#getStudents.E1PREFIX#">-
	<input type=text name=E1SUFFIX value="#getStudents.E1SUFFIX#">  
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type=text name=E2LNAME value="#getStudents.E2LNAME#">,<BR><label id="ENGs">(Last)</label></td>
	<td><input type=text name=E2FNAME value="#getStudents.E2FNAME#"><BR><label id="ENGs">(First)</label></td>
    <td><input type=text name=E2RELATION value="#getStudents.E2RELATION#"></td>
    <td colspan="2"><input type=text name=E2AREA size="3" maxlength="3" value="#getStudents.E2AREA#">-
	<input type=text name=E2PREFIX size="3" maxlength="3" value="#getStudents.E2PREFIX#">-
	<input type=text name=E2SUFFIX size="3" maxlength="4" value="#getStudents.E2SUFFIX#">  
	</td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Health Concerns: </strong></td>
    <td colspan="5" valign="top"><input type=text name=HEALTHCONCERNS value="#getStudents.HEALTHCONCERNS#"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="3"><strong>Does the student routinely take medications:</strong> 
	<input name="MEDICATION" type="radio" value="Y" <cfif getStudents.MEDICATION eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="MEDICATION" type="radio" value="N" <cfif getStudents.MEDICATION eq 'N'>CHECKED</cfif> />
     No 
	</td>
    <td colspan="2"><strong>Where:</strong> <input type=text name=xxx value="At Home"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><strong>Glasses:</strong> 
	<input name="GLASSES" type="radio" value="Y" <cfif getStudents.GLASSES eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="GLASSES" type="radio" value="N" <cfif getStudents.GLASSES eq 'N'>CHECKED</cfif> />
     No 
	 </td>
    <td><strong>Contacts:</strong> 
	<input name="CONTACTS" type="radio" value="Y" <cfif getStudents.CONTACTS eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="CONTACTS" type="radio" value="N" <cfif getStudents.CONTACTS eq 'N'>CHECKED</cfif> />
     No 
	 </td>
    <td colspan="2"><strong>Hearing Aid:</strong> 
	<input name="HEARINGAID" type="radio" value="Y" <cfif getStudents.HEARINGAID eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="HEARINGAID" type="radio" value="N" <cfif getStudents.HEARINGAID eq 'N'>CHECKED</cfif> />
     No 
	</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td valign="top"><strong>Other Health Info:</strong> </td>
    <td colspan="4" valign="top"><textarea name="HEALTHCONCERNS" cols="75" rows="3">#getStudents.healthconcerns#</textarea></td>
  </tr>
  <tr>
    <td colspan="6"><hr /></td>
  </tr>
  <tr>
    <td><strong>Language Survey: </strong></td>
    <td colspan="2"><strong>Other home language spoken?</strong> 
	 <input name="HOMELANG" type="radio" value="Y" <cfif getStudents.HOMELANG eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="HOMELANG" type="radio" value="N" <cfif getStudents.HOMELANG eq 'N'>CHECKED</cfif> />
     No 
	</td>
    <td>Language:</td>
    <td><select name="HOMELANGUAGE">
		<OPTION VALUE="">--Mailing Language--</OPTION>
		<cfloop collection="#session.languageStruct#" item="current_lang">
			<option value="#current_lang#"<cfif #trim(getStudents.HOMELANGUAGE)# eq #trim(current_lang)#> selected</cfif>><cfif StructKeyExists(session.languageStruct, current_lang)>#session.languageStruct[current_lang]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
		</select>
	 </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><strong>Other student language spoken?</strong>
	<input name="STUDLANG" type="radio" value="Y" <cfif getStudents.STUDLANG eq 'Y'>CHECKED</cfif> />
     Yes
     &nbsp; &nbsp;
     <input name="STUDLANG" type="radio" value="N" <cfif getStudents.STUDLANG eq 'N'>CHECKED</cfif> />
     No 
	 </td>
    <td>Language:</td>
    <td>
	<select name="STUDLANGUAGE">
		<OPTION VALUE="">--Mailing Language--</OPTION>
		<cfloop collection="#session.languageStruct#" item="current_lang">
			<option value="#current_lang#"<cfif #trim(getStudents.STUDLANGUAGE)# eq #trim(current_lang)#> selected</cfif>><cfif StructKeyExists(session.languageStruct, current_lang)>#session.languageStruct[current_lang]#<cfelse>Elsewhere</cfif></option>
		</cfloop>
	</select>
	</td>
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
  <tr><td colspan="6"><cfinclude template="includes/enrollment_check_tbl.cfm"></td></tr>
  <tr>
    <td colspan="6" style="background-color:##EBEBEB; border-top: 1px dashed black;"><div align="center">If you have reviewed the above information and everything is correct, click the submit button below. </div></td>
  </tr>
  <tr>
    <td colspan="6" style="padding: 5px; background-color:##EBEBEB;"><div align="center">
      <input type="submit" name="submit" value="&nbsp;&nbsp;Save Record&nbsp;&nbsp;" />
    </div></td>
	</form>
	<form>
  </tr>
    <tr>
    <td colspan="6" style="padding: 5px; background-color:##EBEBEB;"><div align="center">
      <input type="submit" value="&nbsp;&nbsp;Cancel&nbsp;&nbsp;" / onclick='javascript:window.close()'>
    </div></td>
  </tr></form>
  </cfloop>
  <cfelse>
  There are no records with this confirmation number.
  </cfif>
</table>
<cfelse>
No confirmation number provided.
</cfif>
</table>
</cfoutput>
</body>
</html>
