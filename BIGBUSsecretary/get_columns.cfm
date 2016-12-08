
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Pending Student Registrations</title>
<link href="reports.css" rel="stylesheet" type="text/css" media="screen">
<link href="noprint.css" rel="stylesheet" type="text/css" media="print">



</head>
<cfquery name="getStudents" datasource="bigbus">
Select * 
from enroll
</cfquery>

<body>

<cfoutput>#getStudents.columnlist#</cfoutput>
<cfoutput query="getStudents">
#getStudents.ADDRESS_CONF#, #getStudents.APARTMENT#, #getStudents.APPROVAL_DATE#, #getStudents.APPROVED#, #getStudents.APPROVEDBY#, #getStudents.AUXADDRESS#, #getStudents.AUXAPARTMENT#, #getStudents.AUXAREA#, #getStudents.AUXBUS#, #getStudents.AUXCITY#, #getStudents.AUXCOUNTY#, #getStudents.AUXDIRECTION#, #getStudents.AUXFNAME#, #getStudents.AUXLNAME#, #getStudents.AUXMAIL#, #getStudents.AUXPREFIX#, #getStudents.AUXSTATE#, #getStudents.AUXSTREET#, #getStudents.AUXSTREETNAME#, #getStudents.AUXSTREETSUFFIX#, #getStudents.AUXSUFFIX#, #getStudents.AUXZIP#, #getStudents.BIRTHCITY#, #getStudents.BIRTHCNTRY#, #getStudents.BIRTHCNTY#, #getStudents.BIRTHDAY#, #getStudents.BIRTHMONTH#, #getStudents.BIRTHSTATE#, #getStudents.BIRTHYEAR#, #getStudents.BUSAPARTMENT#, #getStudents.BUSAREA#, #getStudents.BUSCITY#, #getStudents.BUSCOUNTY#, #getStudents.BUSDIR#, #getStudents.BUSFNAME#, #getStudents.BUSLNAME#, #getStudents.BUSPREFIX#, #getStudents.BUSSTATE#, #getStudents.BUSSTREET#, #getStudents.BUSSTREETNAME#, #getStudents.BUSSTREETSUFFIX#, #getStudents.BUSSUFFIX#, #getStudents.BUSZIP#, #getStudents.CITY#, #getStudents.CNUM#, #getStudents.CONTACTS#, #getStudents.COUNTY#, #getStudents.COURTORDER#, #getStudents.CREATEDATE#, #getStudents.CURRENTGRADE#, #getStudents.DIRECTION#, #getStudents.DOB_CONF#, #getStudents.E1AREA#, #getStudents.E1NAME#, #getStudents.E1PREFIX#, #getStudents.E1RELATION#, #getStudents.E1SUFFIX#, #getStudents.E2AREA#, #getStudents.E2PREFIX#, #getStudents.E2RELATION#, #getStudents.E2SUFFIX#, #getStudents.E2_NAME#, #getStudents.ENTRYMONTH#, #getStudents.ENTRYYEAR#, #getStudents.ETHNIC#, #getStudents.FAREA#, #getStudents.FCELLAREA#, #getStudents.FCELLPREFIX#, #getStudents.FCELLSUFFIX#, #getStudents.FFNAME#, #getStudents.FLNAME#, #getStudents.FNAME#, #getStudents.FPREFIX#, #getStudents.FSUFFIX#, #getStudents.FTYPE#, #getStudents.FWORKAREA#, #getStudents.FWORKEXT#, #getStudents.FWORKPLACE#, #getStudents.FWORKPREFIX#, #getStudents.FWORKSUFFIX#, #getStudents.F_EMAIL#, #getStudents.F_RESIDESWITH#, #getStudents.F_UNLISTED#, #getStudents.GENDER#, #getStudents.GLASSES#, #getStudents.HEALTHCOMMN#, #getStudents.HEALTHCONCERNS#, #getStudents.HEARINGAID#, #getStudents.HOMELANG#, #getStudents.HOMELANGUAGE#, #getStudents.LASTSCHOOL#, #getStudents.LASTU46#, #getStudents.LNAME#, #getStudents.LS_CITY#, #getStudents.LS_COUNTRY#, #getStudents.LS_LEFTDAY#, #getStudents.ls_endmonth#, #getStudents.LS_LEFTYEAR#, #getStudents.LS_STARTDAY#, #getStudents.LS_STARTMONTH#, #getStudents.LS_STARTYEAR#, #getStudents.LS_STATE#, #getStudents.LS_STREET#, #getStudents.LS_ZIP#, #getStudents.MAILAPARTMENT#, #getStudents.MAILCITY#, #getStudents.MAILDIRECTION#, #getStudents.MAILLANGUAGE#, #getStudents.MAILSAL#, #getStudents.MAILSTATE#, #getStudents.MAILSTREET#, #getStudents.MAILSTREETNAME#, #getStudents.MAILSTREETSUFFIX#, #getStudents.MAILZIP#, #getStudents.MAREA#, #getStudents.MCELLAREA#, #getStudents.MCELLPREFIX#, #getStudents.MCELLSUFFIX#, #getStudents.MEDICATION#, #getStudents.MEDS_HOME#, #getStudents.MEDS_SCHOOL#, #getStudents.MFNAME#, #getStudents.MLNAME#, #getStudents.MNAME#, #getStudents.MPREFIX#, #getStudents.MSUFFIX#, #getStudents.MTYPE#, #getStudents.MWORKAREA#, #getStudents.MWORKEXT#, #getStudents.MWORKPLACE#, #getStudents.MWORKPREFIX#, #getStudents.MWORKSUFFIX#, #getStudents.M_EMAIL#, #getStudents.M_RESIDESWITH#, #getStudents.M_UNLISTED#, #getStudents.NEW_STUDENT#, #getStudents.PREVDAY#, #getStudents.PREVMONTH#, #getStudents.PREVU46#, #getStudents.PREVYEAR#, #getStudents.REFUGEE#, #getStudents.SID#, #getStudents.STATE#, #getStudents.STATUS#, #getStudents.STREET#, #getStudents.STREETNAME#, #getStudents.STREETSUFFIX#, #getStudents.STUDLANG#, #getStudents.STUDLANGUAGE#, #getStudents.UNUSED#, #getStudents.YOE#, #getStudents.ZIP#
<P>
</cfoutput>

</body>
</html>
