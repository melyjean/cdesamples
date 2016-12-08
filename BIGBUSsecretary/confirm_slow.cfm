
<cfset addressList = ''>
<cfset streetList = ''>
<cfset phoneList = ''>
<cfset guardianList = ''>
<cfset yisList = ''>

<cfset confirmationQuestionList =''>
<cfset gotNum = 0>

<cfloop index="rndloop" from="1" to="200">
	<cfif gotNum lt 3>
		<cfset rnd = (Rand() * 10000) mod 5>
		<cfif not ListFind(confirmationQuestionList, rnd)>
			<cfset confirmationQuestionList = confirmationQuestionList & ',' & rnd>
			<cfset gotNum = gotNum+1>
			<cfoutput>Display Question:#rnd#<BR></cfoutput>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfif isDefined("form.stdtNo") and form.stdtNo neq ''>
	<cfset sid= ListGetAt(session.possibleStdLst,form.stdtNo)>
	<cfset session.stdtNo = form.stdtNo>
<cfelseif ListLen(session.possibleStdLst) eq 1>
	<cfset sid = session.possibleStdLst>
<cfelse>
	error
	<cfabort>
</cfif>

<cfquery name="getMatch" datasource="panthertest">
select e.year SYSE_YEAR,  f.lname SDEM_LNAME, f.sid SDEM_SID,
	f.fname SDEM_FNAME,  e.yis,
	f.birthmonth||'/'||f.birthday||'/'||f.birthyear SDEM_BDATE,
	f.gender SDEM_GENDER, f.ethnic SDEM_ETHNIC,
	WORKAREA || WORKPREFIX || WORKSUFFIX as workPhone,
	decode(AREACODE || PREFIX || PHONESUFFIX, null, 'None of These',
			 AREACODE || PREFIX || PHONESUFFIX)	as homePhone,
	CELLLAREA || CELLPREFIX || CELLSUFFIX as cellPhone,
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
	and e.sid= '#session.possibleStdLst#'
</cfquery>

<cfloop query="getMatch">
<cfif not ListFind(addressList, getMatch.address)>
	<cfset addressList = addressList & ',' & getMatch.address>
</cfif>
<cfif not ListFind(streetList, getMatch.street)>
	<cfset streetList = streetList & ',' & getMatch.street>
</cfif>
<cfif not ListFind(phoneList, getMatch.homePhone)>
	<cfset phoneList = phoneList & ',' & getMatch.homePhone>
</cfif>
<cfif not ListFind(guardianList, getMatch.gfname)>
	<cfset guardianList = guardianList & ',' & getMatch.gfname>
</cfif>
<cfif not ListFind(yisList, getMatch.yis)>
	<cfset yisList = yisList & ',' & getMatch.yis>
</cfif>
</cfloop>

<cfset gotNum = 0><P>
<cfloop index="randomStreet" from="1" to="20">
	<cfif gotNum lt 2>
		<cfquery name="getRandomStreet" datasource="panthertest">
			SELECT street FROM
			( SELECT street FROM saum
			where dist='4600'
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
		<cfif not ListFind(streetList, getRandomStreet.street)>
			<cfset streetList = streetList & ',' & getRandomStreet.street>
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfset gotNum = 0><P>
<cfloop index="randomAddress" from="1" to="20">
	<cfif gotNum lt 2>
		<cfquery name="getRandomAddress" datasource="panthertest">
			SELECT Address FROM
			( SELECT Address FROM saum
			where dist='4600'
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
		<cfif not ListFind(addressList, getRandomAddress.Address)>
			<cfset addressList = addressList & ',' & getRandomAddress.Address>
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfset gotNum = 0><P>
<cfloop index="randomPhone" from="1" to="20">
	<cfif gotNum lt 2>
		<cfquery name="getrandomAREACODE" datasource="panthertest">
			SELECT AREACODE FROM
			( SELECT AREACODE FROM sgua
			where dist='4600'
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
	
		<cfquery name="getrandomPREFIX" datasource="panthertest">
			SELECT PREFIX FROM
			( SELECT PREFIX FROM sgua
			where dist='4600'
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
	
		<cfquery name="getrandomSUFFIX" datasource="panthertest">
			SELECT PHONESUFFIX  FROM
			( SELECT PHONESUFFIX FROM sgua
			where dist='4600'
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
		<cfset ky = getrandomAREACODE.AREACODE & getrandomPREFIX.PREFIX & getrandomSUFFIX.PHONESUFFIX>
		<cfif not ListFind(phoneList, ky)>
			<cfset phoneList = phoneList & ',' & ky>
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfset gotNum = 0><P>
<cfloop index="randomgfname" from="1" to="20">
	<cfif gotNum lt 2>
		<cfquery name="randomgfname" datasource="panthertest">
			SELECT fname FROM
			( SELECT fname FROM sgua
			where dist='4600' and fname is not null
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
		<cfif not ListFind(guardianList, randomgfname.fname)>
			<cfset guardianList = guardianList & ',' & randomgfname.fname>
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>

<cfset gotNum = 0><P>
<cfloop index="randomYIS" from="1" to="20">
	<cfif gotNum lt 2>
		<cfquery name="randomYIS" datasource="panthertest">
			SELECT yis FROM
			( SELECT yis FROM syse
			where dist='4600' and year='2007'
			and yis is not null
			ORDER BY dbms_random.value )
			WHERE rownum = 1
		</cfquery>
		<cfif not ListFind(yisList, randomYIS.yis)>
			<cfset yisList = yisList & ',' & randomYIS.yis>
			<cfset gotNum = gotNum + 1>
		</cfif>
	<cfelse>
		<cfbreak>
	</cfif>
</cfloop>
<cfoutput>
<cfloop list="#confirmationQuestionList#" index="choice">
<cfswitch expression="#choice#">
<cfcase value="0">
Choose yis:<BR>
<cfloop list="#yisList#" index="x">
#x#<BR>
</cfloop><P>
</cfcase>
<cfcase value="1">
Choose address:<BR>
<cfloop list="#addressList#" index="x">
#x#<BR>
</cfloop><P>
</cfcase>
<cfcase value="2">
Choose street:<BR>
<cfloop list="#streetList#" index="x">
#x#<BR>
</cfloop><P>
</cfcase>
<cfcase value="3">
Choose phone:<BR>
<cfloop list="#phoneList#" index="x">
#x#<BR>
</cfloop><P>
</cfcase>
<cfcase value="4">
Choose guardian:<BR>
<cfloop list="#guardianList#" index="x">
#x#<BR>
</cfloop><P>
</cfcase>


</cfswitch>
</cfloop>
</cfoutput>

