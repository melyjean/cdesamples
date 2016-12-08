<cfinclude template="includes/header.cfm">

<cfset addressList = ''>
<cfset streetList = ''>
<cfset phoneList = ''>
<cfset guardianList = ''>
<cfset yisList = ''>
<cfset sidList = ''>

<cfset studentStruct = StructNew()>

<cfset confirmationQuestionList =''>
<cfset gotNum = 0>

<cfloop index="rndloop" from="1" to="200">
	<cfif gotNum lt 3>
		<cfset rnd = (Rand() * 10000) mod 5>
		<cfif not ListFind(confirmationQuestionList, rnd, "|")>
			<cfset confirmationQuestionList = confirmationQuestionList & '|' & rnd>
			<cfset gotNum = gotNum+1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfif isDefined("form.stdtNo") and form.stdtNo neq ''>
	<cfset sid= ListGetAt(session.possibleStdLst,form.stdtNo, "|")>
	<cfset session.stdtNo = form.stdtNo>
<cfelseif ListLen(session.possibleStdLst, "|") eq 1>
	<cfset sid = session.possibleStdLst>
<cfelse>
	error
	<cfabort>
</cfif>

<body onload="setActiveStyleSheet('<cfoutput>#session.language#</cfoutput>')">
	<div id="toolbar"> <a href="#" onclick="setActiveStyleSheet('english'); return false;">English</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('spanish'); return false;">Espa&Ntilde;ol</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('bilingual'); return false;">Bilingual</a>
	</div>
<table width="675" border="0" align="center" cellpadding="5" cellspacing="0">

<cfquery name="getMatch" datasource="panthertest">
select f.lname SDEM_LNAME, f.sid SDEM_SID,
	f.fname SDEM_FNAME,  e.yis,
	f.birthmonth||'/'||f.birthday||'/'||f.birthyear SDEM_BDATE,
	f.gender SDEM_GENDER, f.ethnic SDEM_ETHNIC,
	decode(WORKAREA || WORKPREFIX || WORKSUFFIX, null, 'None of These',
			 WORKAREA || '-' || WORKPREFIX || '-' || WORKSUFFIX)	as workPhone,
	decode(AREACODE || PREFIX || PHONESUFFIX, null, 'None of These',
			 AREACODE || '-' || PREFIX || '-' || PHONESUFFIX)	as homePhone,
	decode(CELLLAREA || CELLPREFIX || CELLSUFFIX, null, 'None of These',
			CELLLAREA || '-' || CELLPREFIX || '-' || CELLSUFFIX)	as cellPhone,
    WORKCODE, UNLISTED, WORKEXT,
	  PAGERSUFFIX, PAGERPREFIX, PAGERAREA,
	  decode(substr(g.type, -1,1), 'M', 'Mother: ',
	  								  'F', 'Father: ',
									  'Guardian: ') as type,
	  g.fname as gfname, g.mname as gmname, g.lname as glname,
	  m.ADDRESS, 
	  m.STREETDIR , m.STREET , m.APT_LABEL, m.APPARTMENT , m.CITY , m.STATE , m.ZIP , m.ZIPFOUR
	from  syse e, sdem f, sgua g, saum m 	
	where e.dist='4600' and m.mailtype = 'P'
	and g.sfam = f.sfam and m.sfam = f.sfam and g.dist = f.dist and m.dist = f.dist and resideswith = 'Y'
	and f.dist=e.dist and f.sid=e.sid
	<!---and e.year='2007'--->
	and e.sid= '#session.possibleStdLst#'
</cfquery>

<cfloop query="getMatch">
<cfif not ListFind(addressList, getMatch.address, "|")>
	<cfset addressList = getMatch.address>
</cfif>
<cfif not ListFind(streetList, getMatch.street, "|")>
	<cfset streetList = getMatch.street>
</cfif>
<cfif not ListFind(phoneList, getMatch.homePhone, "|")>
	<cfset phoneList = getMatch.homePhone>
</cfif>
<cfif not ListFind(guardianList, getMatch.gfname, "|")>
	<cfset guardianList = getMatch.gfname>
</cfif>
<cfif not ListFind(yisList, getMatch.yis, "|")>
	<cfset yisList = getMatch.yis>
</cfif>
</cfloop>
<cfset connector= "'">
<cfset gotNum = 0><P>
<cfquery name="getRandomSID" datasource="panthertest">
	SELECT SID FROM
	(select distinct e.sid 
	from syse e, sgua g 
	where e.dist='4600' and e.year='2007'
	and g.dist=e.dist and e.sid = g.sfam
	and trim(AREACODE || PREFIX || PHONESUFFIX) is not null
	and trim(WORKAREA || WORKPREFIX || WORKSUFFIX) is not null
	ORDER BY dbms_random.value )
	WHERE rownum <=2
</cfquery>
<cfloop query="getRandomSID">
	<cfif gotNum lt 2>
		<cfif getRandomSID.recordcount gt 0 and not ListFind(sidList, getRandomSID.sid)>
			<cfset sidList = sidList & connector & getRandomSID.sid>
			<cfset connector= "','">
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfset sidList = sidList & "'">
		<cfbreak>
	</cfif>
</cfloop>


<cfquery name="getOthers" datasource="panthertest">
select distinct f.sid SDEM_SID, e.yis,
	WORKAREA || WORKPREFIX || WORKSUFFIX as workPhone,
		decode(WORKAREA || WORKPREFIX || WORKSUFFIX, null, 'None of These',
			 WORKAREA || '-' || WORKPREFIX || '-' || WORKSUFFIX)	as workPhone,
	decode(AREACODE || PREFIX || PHONESUFFIX, null, 'None of These',
			 AREACODE || '-' || PREFIX || '-' || PHONESUFFIX)	as homePhone,
	decode(CELLLAREA || CELLPREFIX || CELLSUFFIX, null, 'None of These',
			CELLLAREA || '-' || CELLPREFIX || '-' || CELLSUFFIX)	as cellPhone,
    WORKCODE, UNLISTED, WORKEXT,
	  PAGERSUFFIX, PAGERPREFIX, PAGERAREA,
	  decode(substr(g.type, -1,1), 'M', 'Mother: ',
	  								  'F', 'Father: ',
									  'Guardian: ') as type,
	  g.fname as gfname, g.mname as gmname, g.lname as glname,
	  m.ADDRESS, 
	  m.STREETDIR , m.STREET , m.APT_LABEL, m.APPARTMENT , m.CITY , m.STATE , m.ZIP , m.ZIPFOUR
	from  syse e, sdem f, sgua g, saum m 	
	where e.dist='4600' and m.mailtype = 'P'
	and g.sfam = f.sfam and m.sfam = f.sfam and g.dist = f.dist and m.dist = f.dist and resideswith = 'Y'
	and f.dist=e.dist and f.sid=e.sid
	and e.sid in (#PreserveSingleQuotes(sidList)#)
</cfquery>

<cfloop query="getOthers">
<cfif not ListFind(addressList, getOthers.address, "|")>
	<cfset addressList = addressList & '|' & getOthers.address>
</cfif>
<cfif not ListFind(streetList, getOthers.street, "|")>
	<cfset streetList = streetList & '|' & getOthers.street>
</cfif>
<cfif not ListFind(phoneList, getOthers.homePhone, "|")>
	<cfset phoneList = phoneList & '|' & getOthers.homePhone>
</cfif>
<cfif not ListFind(guardianList, getOthers.gfname, "|")>
	<cfset guardianList = guardianList & '|' & getOthers.gfname>
</cfif>
<cfif not ListFind(yisList, getOthers.yis, "|") and ListLen(yisList, "|") lt 3>
	<cfset yisList = yisList & '|' & getOthers.yis>
</cfif><P>
</cfloop>
	<cfset sortaddressList = ListSort(addressList, "Text","Asc", "|")>
	<cfset sortstreetList = ListSort(streetList, "Text","Asc", "|")>
	<cfset sortphoneList = ListSort(phoneList, "Text","Asc", "|")>
	<cfset sortguardianList = ListSort(guardianList, "Text","Asc", "|")>
	<cfset sortyisList = ListSort(yisList, "Text","Asc", "|")>


<form action=tabs.cfm>
<cfoutput>
<tr><td>There is a student in our database that matches this criteria.<BR>  
In order to confirm the student's identity please answer the following questions:<P></td></tr>
<cfloop list="#confirmationQuestionList#" index="choice" delimiters="|">
	<cfswitch expression="#choice#">
		<cfcase value="0">
			<tr><td>What is the last grade that this student attended a U-46 school?<BR>
			<cfloop list="#sortyisList#" index="x" delimiters="|">
				<input type=radio name=aaa value='#x#'>#x#<BR>
			</cfloop><P>
			</td></tr>
		</cfcase>
		<cfcase value="1">
			<tr><td>The student or one of the students guardians<BR> has once lived at which address?  (Numerical portion only)<BR>
			<cfloop list="#sortaddressList#" index="x" delimiters="|">
				<input type=radio name=bbb value='#x#'>#x#<BR>
			</cfloop><P>
			</td></tr>
		</cfcase>
		<cfcase value="2">
			<tr><td>The student or one of the students guardians has once lived which of the following streets?<BR>
			<cfloop list="#sortstreetList#" index="x" delimiters="|">
				<input type=radio name=ccc value='#x#'>#x#<BR>
			</cfloop><P>
			</td></tr>
		</cfcase>
		<cfcase value="3">
			<tr><td>The student or one of the students guardians has once had one of the following phone numbers?<BR>
			<cfloop list="#sortphoneList#" index="x" delimiters="|">
				<input type=radio name=ddd value='#x#'>#x#<BR>
			</cfloop><P>
			</td></tr>
		</cfcase>
		<cfcase value="4">
			<tr><td>The student has once had one of the following guardians?<BR>
			<cfloop list="#sortguardianList#" index="x" delimiters="|">
				<input type=radio name=eee value='#x#'>#x#<BR>
			</cfloop><P>
			</td></tr>
		</cfcase>
	</cfswitch>
</cfloop>
</cfoutput>
<tr><td><input type=submit value=Submit></td></tr>
</form>
</table>
</body>
<cfinclude template="includes/footer.cfm">