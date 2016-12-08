<cfset today = dateformat(now(), "mm/dd")>
<cfset currentYear = dateformat(now(), "yyyy")>
<cfset currentday = dateformat(now(), "dd")>
<cfset currentSID = ''>
<cfset currentmonth = dateformat(now(), "mm")>
<cfset attendancetime = timeformat(now(), "HHmm")>
<cfset gradetime = timeformat(now(), "HHmm")>
<cfif variables.today gte "7/01" AND variables.today lte "12/31"><cfset schoolYear = evaluate(currentYear + 1)><cfelse><cfset schoolYear = currentYear></cfif>
<cfset errorMsg = ''>
<cfset setList = 'set '>
<cfset connector = ''>
<cfset quote ="'">
<cfset helpcontact="brianwarnock@u-46.org,melindabarr@u-46.org,helpdesk@u-46.org,webapps@u-46.org">
<cfset dte = currentYear & currentmonth & currentday>
<cfset subdte = currentYear & '-' & currentmonth & '-' & currentday>
<cfif isdefined('form.username')><cfset usersCookieValue = "#form.username#"></cfif>

<cfif StructIsEmpty(session.streetSuffixStruct)>
	<cfset suffix_cd="BA,BD,CI,CT,CR,DR,HWY,LN,LP,MT,PK,PKWY,PA,PL,PZ,PT,RD,RT,SQ,ST,TE,TC,TR,TNPK,WA">
	<cfset suffix_desc="BAY,BOULEVARD,CIRCLE,COURT,CRESCENT,DRIVE,HIGHWAY,LANE,LOOP,MOUNT,PARK,PARKWAY,PATH,PLACE,PLAZA,POINT,ROAD,ROUTE,SQUARE,STREET,TERRACE,TRACE,TRAIL,TURNPIKE,WAY">
	
	<cfloop From = "1" To = "#ListLen(suffix_cd)#" index = "Counter">
		<cfset a = StructInsert(session.streetSuffixStruct, '#ListGetAt(suffix_cd,Counter)#', '#ListGetAt(suffix_desc,Counter)#')>
	</CFLOOP>
</cfif>
<cfif StructIsEmpty(session.feeStruct)>
	<cfset a = StructInsert(session.feeStruct, 'X', 'Paid in Full')>
	<cfset a = StructInsert(session.feeStruct, 'P', 'Partial Payment')>
	<cfset a = StructInsert(session.feeStruct, 'G', 'Waived Green Card')>
	<cfset a = StructInsert(session.feeStruct, 'F', 'Waived Fre Lunch')>
	<cfset a = StructInsert(session.feeStruct, 'N', 'Not Paid')>
</cfif>
<cfif StructIsEmpty(session.directionStruct)>
	<cfset a = StructInsert(session.directionStruct, 'N', 'North')>
	<cfset a = StructInsert(session.directionStruct, 'S', 'South')>
	<cfset a = StructInsert(session.directionStruct, 'E', 'East')>
	<cfset a = StructInsert(session.directionStruct, 'W', 'West')>
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
<cfif StructIsEmpty(session.ethnicStruct) or StructIsEmpty(session.FamilyStruct) or StructIsEmpty(session.languageStruct) or StructIsEmpty(session.countyStruct)>
	<cfquery datasource="panthertest" name="getDict">
		select trim(DTYPes) as DTYPes, trim(DCODEs) as DCODEs, trim(DDESCRIPTION) as DDESCRIPTION
		from ddic 
		where dist='4600'
		and DTYPes in ('SETH', 'SFAM', 'SNEB', 'CNTY')
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
		<cfif not StructKeyExists(session.countyStruct, getDict.DCODEs) and getDict.DTYPes eq 'CNTY'>
			<cfset a = StructInsert(session.countyStruct, getDict.DCODEs, getDict.DDESCRIPTION)>
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


