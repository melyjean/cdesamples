<cfinclude template="adsecure.cfm">

<cfset attendanceSemester = '2'>

<cfset currentSemester = ''>
<cfset currentQuarter = ''>
<cfset currentPeriod = ''>
<cfset courseCount = 0>
<cfset numofColumns = 0>
<cfset tableWidth = 800>
<cfset semesterCount = 0>
<cfset currentSemester = 1>
<cfset courseStruct = StructNew()>
<cfset count = 0>
<cfif isdefined('url.semester')>
	<cfset sem= #url.semester#>
<cfelse>
	<cfset sem= #variables.attendanceSemester#>
</cfif>


<cfif isdefined('url.SID')>
	<cfquery datasource="panthertest" name="getStudentInfo">
select e.year SYSE_YEAR,  f.lname SDEM_LNAME, f.sid SDEM_SID,
	f.fname SDEM_FNAME,  e.yis SYSE_YIS,
	f.birthmonth||'/'||f.birthday||'/'||f.birthyear SDEM_BDATE,
	f.gender SDEM_GENDER, f.ethnic SDEM_ETHNIC,
    WORKCODE, WORKSUFFIX, WORKPREFIX, WORKAREA, UNLISTED, PHONESUFFIX, PREFIX,
	 AREACODE, WORK, WORKEXT, CELLSUFFIX, CELLPREFIX, CELLLAREA,
	  PAGERSUFFIX, PAGERPREFIX, PAGERAREA,
	  decode(substr(g.type, -1,1), 'M', 'Mother: ',
	  								  'F', 'Father: ',
									  'Guardian: ') as type,
	  g.fname, g.mname, g.lname,
	  m.ADDRESS, m.STREETDIR , m.STREET , m.APT_LABEL, m.APPARTMENT , m.CITY , m.STATE , m.ZIP , m.ZIPFOUR, l.email
	  	<!---,	decode(ssed.status,'A', '1', '0') SSED_IEP, special education> 	decode(sbil.status,'A', '1', '0') SBIL_BIL,<bilingual> 	decode(e.pal, 'Y','1', '0') SYSE_PAL<PAL --->
	from  syse e, sdem f, sgua g, saum m, sgemail l 	<!---, ssed,sbil --->
	where e.dist='4600' and m.mailtype = 'P'
	and e.year='2004'
	and e.sid = <cfqueryparam value = "#url.sid#" cfsqltype = "cf_sql_char" maxLength = "9">
	and g.sfam = f.sfam and m.sfam = f.sfam and g.dist = f.dist and m.dist = f.dist and resideswith = 'Y'
	and l.sfam(+) = f.sfam and l.dist(+) = f.dist
	and f.dist=e.dist and f.sid=e.sid  	<!--- and ssed.dist(+)=f.dist and ssed.sid(+)=f.sid and ssed.status(+)='A' and	sbil.dist(+)=f.dist and sbil.sid(+)=f.sid and sbil.status(+)='A' --->
	order by f.lname, f.fname, f.sid
	</cfquery>

	<!---
	<cfif isdefined('url.light')><cfinclude template="pnthr_header.cfm"><cfelse><cfinclude template="pnthr_header.cfm"></cfif>
	--->
	<cfinclude template="includes/sec_header.cfm">
	<cfif getStudentInfo.recordcount gte 1>
		<table width="100%" border="0" cellpadding="5" cellspacing="0">
			<cfoutput><!--- main table start --->
				<CFLOOP QUERY="getStudentInfo">
					<cfset count = count +1>
					<cfif count eq 1>
						<tr class=blue>
							<td class=blue colspan=2>#getStudentInfo.SDEM_LNAME#, #getStudentInfo.SDEM_FNAME#</TD>
							<td class=blue>SID: #getStudentInfo.SDEM_SID#</TD>
							<td class=blue>YEAR: #Evaluate(getStudentInfo.SYSE_YEAR - 1)#-#getStudentInfo.SYSE_YEAR#</TD>
						</TR>
						<tr>
							<td class=reportText>BIRTHDATE: #getStudentInfo.SDEM_BDATE#</TD>
							<td class=reportText>GENDER: #getStudentInfo.SDEM_GENDER#</TD>
							<td class=reportText>ETHNICITY: #getStudentInfo.SDEM_ETHNIC#</TD>
							<td class=reportText>YEAR IN SCHOOL: #getStudentInfo.SYSE_YIS#</TD>
						</TR>
						<tr>
							<td class=reportText colspan =2>Home no:#getStudentInfo.AREACODE# #getStudentInfo.PREFIX# #getStudentInfo.PHONESUFFIX#<!---IEP: #getStudentInfo.SSED_IEP#---></TD>
							<td class=reportText>Work no:#getStudentInfo.WORKAREA# #getStudentInfo.WORKPREFIX# #getStudentInfo.WORKSUFFIX#<!---BILINGUAL: #getStudentInfo.SBIL_BIL#---></TD>
							<td class=reportText>Cell no:#getStudentInfo.CELLLAREA# #getStudentInfo.CELLPREFIX# #getStudentInfo.CELLSUFFIX#<!---PAL: #getStudentInfo.SYSE_PAL#---></td>
						</tr>
					</cfif>
				<tr align="top">
					<td class=reportText colspan=2>#getStudentInfo.type# #getStudentInfo.fname# #getStudentInfo.mname# #getStudentInfo.lname# <BR>Email: #getStudentInfo.email#</td><td class=reportText colspan=2>Address: #getStudentInfo.ADDRESS# #getStudentInfo.STREETDIR# #getStudentInfo.STREET# #getStudentInfo.APT_LABEL# #getStudentInfo.APPARTMENT# #getStudentInfo.CITY# #getStudentInfo.STATE# #getStudentInfo.ZIP# #getStudentInfo.ZIPFOUR#<BR>&nbsp;</td>
				</tr>
				</CFLOOP>
			</cfoutput>
		</table>
	<cfelse>
		<div align="center"><strong><cfoutput><h3>Student ID: #url.sid#<BR>
		There are <BR>(a) no students with this name; or the <BR>
		(b) guardian data is not in the Panther school information system; <BR>or
		(c) address data is not in the Panther school information system;
		</h3> <p>
		</cfoutput></strong></div>
	</cfif>
<cfelse>
	no student id supplied
</cfif>
<cfinclude template="includes/sec_footer.cfm">