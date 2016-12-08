<cfinclude template="adsecure.cfm">
<cfinclude template="includes/sec_header.cfm">

<cfif StructIsEmpty(session.feeStruct)>
	<cfset a = StructInsert(session.feeStruct, 'X', 'Paid in Full')>
	<cfset a = StructInsert(session.feeStruct, 'P', 'Partial Payment')>
	<cfset a = StructInsert(session.feeStruct, 'G', 'Waived Green Card')>
	<cfset a = StructInsert(session.feeStruct, 'F', 'Waived Fre Lunch')>
	<cfset a = StructInsert(session.feeStruct, 'N', 'Not Paid')>
</cfif>
<cfif StructIsEmpty(session.schoolStruct)>
	<cfquery datasource="panthertest" name="getSchools">
		select scid, trim(sname) as sname
		from scid 
		where dist='4600'
		and status='A'
	</cfquery>
	<cfloop query="getSchools">
		<cfif not StructKeyExists(session.schoolStruct, getSchools.scid)>
			<cfset a = StructInsert(session.schoolStruct, getSchools.scid, getSchools.sname)>
		</cfif>
	</cfloop>
</cfif>
<cfif StructIsEmpty(session.ethnicStruct) or StructIsEmpty(session.FamilyStruct) or StructIsEmpty(session.languageStruct)>
	<cfquery datasource="panthertest" name="getDict">
		select trim(DTYPes) as DTYPes, trim(DCODEs) as DCODEs, trim(DDESCRIPTION) as DDESCRIPTION
		from ddic 
		where dist='4600'
		and DTYPes in ('SETH', 'SFAM', 'SNEB')
	</cfquery>
	<cfloop query="getDict">
		<cfif not StructKeyExists(session.ethnicStruct, getDict.DCODEs) and getDict.DTYPes eq 'SETH'>
			<cfset a = StructInsert(session.ethnicStruct, getDict.DCODEs, getDict.DDESCRIPTION)>
		</cfif>
		<cfif not StructKeyExists(session.FamilyStruct, getDict.DCODEs) and getDict.DTYPes eq 'SFAM'>
			<cfset a = StructInsert(session.FamilyStruct, getDict.DCODEs, getDict.DDESCRIPTION)>
		</cfif>
		<cfif not StructKeyExists(session.languageStruct, getDict.DCODEs) and getDict.DTYPes eq 'SNEB'>
			<cfset a = StructInsert(session.languageStruct, getDict.DCODEs, getDict.DDESCRIPTION)>
		</cfif>
	</cfloop>
</cfif>
<cfif StructIsEmpty(session.countryStruct)>
	<cfquery datasource="panthertest" name="getCountries">
		select  distinct trim(st_nacd) as code,trim(ST_NDESC) as country 
		from st_nacd
		where st_nacd is not null
		order by code
	</cfquery>
	<cfloop query="getCountries">
		<cfif not StructKeyExists(session.countryStruct, getCountries.CODE)>
			<cfset a = StructInsert(session.countryStruct, getCountries.CODE, getCountries.country)>
		</cfif>
	</cfloop>
</cfif>
<cfif StructIsEmpty(session.stateStruct)>
	<cfquery datasource="panthertest" name="getStates">
		select trim(STCD) as STCD, trim(SDESC) as SDESC
		from stcd
	</cfquery>
	<cfloop query="getStates">
		<cfif not StructKeyExists(session.stateStruct, getStates.STCD) and not Listfind('MX,NA,CH',getStates.STCD)>
			<cfset a = StructInsert(session.stateStruct, getStates.STCD, getStates.SDESC)>
		</cfif>
	</cfloop>
</cfif>
<table width="400" border="0" align="center" cellpadding="3" cellspacing="0" class="tableBorder" style="margin-top: 25px;">
  <tr>
    <td colspan="2" class="blue" style="padding: 7px;">What would you like to do? </td>
  </tr>
	  <tr>
	    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="enterconfnum.cfm">Enter Confirmation Number</a></span></td>
	    <td class="tdBorder"><a href="enterconfnum.cfm"><img src="images/grades.jpg" border="0" align="right" style="padding-right: 3px;"></a>&nbsp;</td>
	  </tr>	  
	  <tr>
	    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="findstudent.cfm">Find Student</a></span> </td>
	    <td class="tdBorder"><a href="findstudent.cfm"><img src="images/demographics.jpg" border="0" align="right" style="padding-right: 3px;"></a>&nbsp;</td>
	  </tr>
	  <tr>
	    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="findstudent_panther.cfm">Panther Lookup</a></span> </td>
	    <td class="tdBorder"><a href="findstudent_panther.cfm"><img src="images/folderCheckin.jpg" border="0" align="right" style="padding-right: 3px;"></a>&nbsp;</td>
	  </tr>
	<tr>
	    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="newloc.cfm?loc=http://intranet/bigbus" target="_blank">Register a new student</a></span></td>
	    <td class="tdBorder"><a href="newloc.cfm?loc=http://intranet/bigbus"><img src="images/attendance.jpg" border="0" align="right" style="padding-right: 3px;"></a>&nbsp;</td>
	</tr>	   
	<tr>
	    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="adreports.cfm">Reports</a></span></td>
	    <td class="tdBorder"><a href="adreports.cfm"><img src="images/progress.jpg" border="0" align="right" style="padding-right: 3px;"></a>&nbsp;</td>
	  </tr>
  <tr>
    <td class="tdBorder" style="border-bottom: 0px;">&nbsp;<a href="logout.cfm" style="font-weight: bold">Log out </a></td>
    <td class="tdBorder" style="border-bottom: 0px;"><a href="logout.cfm"><img src="images/logOut.jpg" width="36" height="36" border="0" align="right"></a>&nbsp;</td>
  </tr>

</table>

<cfinclude template="includes/sec_footer.cfm">