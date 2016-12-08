
<cfoutput>
<table border="0" cellspacing="0" cellpadding="3" width="670">
  <tr>
    <td><img src="/bigbus/images/regform.jpg" border="0" /></td>
  </tr>
  <tr>
    <td><div id="wrap"><span id="uline">#getStudents.LNAME#</span><br /><span id="ENGs">LAST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.FNAME#</span><br /><span id="ENGs">FIRST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.MNAME#</span><br /><span id="ENGs">MIDDLE NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.BIRTHMONTH#/#getStudents.BIRTHDAY#/#getStudents.BIRTHYEAR#</span><br /><span id="ENGs">BIRTHDATE</span></div>
	<div id="wrap"><span id="uline">#getStudents.CURRENTGRADE#</span><br /><span id="ENGs">CURRENT GRADE</span></div></td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.BIRTHCITY#</span><br /><span id="ENGs">BIRTHCITY</span></div>
	<div id="wrap"><span id="uline">#getStudents.BIRTHCNTY#</span><br /><span id="ENGs">BIRTH COUNTY</span></div>
	<div id="wrap"><span id="uline">#getStudents.BIRTHSTATE#</span><br /><span id="ENGs">BIRTH STATE</span></div>
	<div id="wrap"><span id="uline">#getStudents.BIRTHCNTRY#</span><br /><span id="ENGs">BIRTH COUNTRY</span></div>
	<div id="wrap"><span id="uline">#getStudents.GENDER#</span><br /><span id="ENGs">GENDER</span></div></td>
  </tr>
  <tr>
    <td>Month/Year of first time entry into U.S. Schools (K-12): <span id="uline">#getStudents.ENTRYMONTH#/#getStudents.ENTRYYEAR#</span>  REFUGEE: <span id="uline">#getStudents.REFUGEE#</span> ETHNIC<span id="uline">#getStudents.ETHNIC#</span> </td>
  </tr>
  <tr>
    <td>Years of Education in U.S. Schools (K-12): <span id="uline">#getStudents.YOE#</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>PARENT/GUARDIAN INFORMATION </strong></td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.FLNAME#</span><br /><span id="ENGs">FATHER'S LAST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.FFNAME#</span><br /><span id="ENGs">FIRST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.FTYPE#</span><br /><span id="ENGs">&nbsp;</span></div></td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.FAREA# : #getStudents.FPREFIX#-#getStudents.FSUFFIX#</span><br /><span id="ENGs">HOME PHONE NUMBER</span></div>
	<div id="wrap"><span id="uline">#getStudents.F_UNLISTED#</span><br /><span id="ENGs">UNLISTED</span></div>
	<div id="wrap"><span id="uline">#getStudents.FWORKAREA# : #getStudents.FWORKPREFIX#-#getStudents.FWORKSUFFIX# EXT #getStudents.FWORKEXT#</span><br /><span id="ENGs">WORK PHONE NUMBER</span></div>
	<div id="wrap"><span id="uline">#getStudents.FWORKPLACE#</span><br /><span id="ENGs">WORK PLACE</span></div></td>
  </tr>
  <tr>
    <td><div id="wrap"><span id="uline">#getStudents.FCELLAREA# : #getStudents.FCELLPREFIX#-#getStudents.FCELLSUFFIX#</span><br />
        <span id="ENGs">CELL PHONE NUMBER</span></div>
		<div id="wrap"><span id="uline">#getStudents.F_EMAIL#</span><br /><span id="ENGs">FATHER'S EMAIL ADDRESS</span></div></td>
  </tr>
  <tr>
    <td>	<div id="wrap"><span id="uline">#getStudents.MLNAME#</span><br /><span id="ENGs">MOTHER'S LAST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.MFNAME#</span><br /><span id="ENGs">FIRST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.MTYPE#</span><br /><span id="ENGs">&nbsp;</span></div></td>
  </tr>
  <tr>
    <td>
		<div id="wrap"><span id="uline">#getStudents.MAREA# : #getStudents.MPREFIX#-#getStudents.MSUFFIX#</span><br /><span id="ENGs">HOME PHONE NUMBER</span></div>
	<div id="wrap"><span id="uline">#getStudents.M_UNLISTED#</span><br /><span id="ENGs">UNLISTED</span></div>
	<div id="wrap"><span id="uline">#getStudents.MWORKAREA# : #getStudents.MWORKPREFIX#-#getStudents.MWORKSUFFIX# EXT #getStudents.MWORKEXT#</span><br /><span id="ENGs">WORK PHONE NUMBER</span></div>
	<div id="wrap"><span id="uline">#getStudents.MWORKPLACE#</span><br /><span id="ENGs">WORK PLACE</span></div>	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.MCELLAREA# : #getStudents.MCELLPREFIX#-#getStudents.MCELLSUFFIX#</span><br />
        <span id="ENGs">CELL PHONE NUMBER</span></div>
		<div id="wrap"><span id="uline">#getStudents.M_EMAIL#</span><br /><span id="ENGs">MOTHER'S EMAIL ADDRESS</span></div>	</td>
  </tr>
  <tr>
    <td>RESIDES WITH : #getStudents.F_RESIDESWITH# #getStudents.M_RESIDESWITH# </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><strong>PRIMARY MAILING INFORMATION </strong></td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.MAILSAL#</span><br /><span id="ENGs">&nbsp;</span></div>
	<div id="wrap"><span id="uline">#getStudents.STREET#</span><br /><span id="ENGs">STREET/FIRE</span></div>
	<div id="wrap"><span id="uline">#getStudents.DIRECTION#</span><br /><span id="ENGs">DIR</span></div>
	<div id="wrap"><span id="uline">#getStudents.STREETNAME#</span><br /><span id="ENGs">STREET</span></div>
	<div id="wrap"><span id="uline">#getStudents.APARTMENT#</span><br /><span id="ENGs">APARTMENT</span></div></td>
  </tr>
  <tr>
    <td><div id="wrap"><span id="uline">#getStudents.CITY#</span><br /><span id="ENGs">CITY</span></div>
	<div id="wrap"><span id="uline">#getStudents.STATE#</span><br /><span id="ENGs">STATE</span></div>
	<div id="wrap"><span id="uline">#getStudents.ZIP#</span><br /><span id="ENGs">ZIP</span></div>
	<div id="wrap"><span id="uline">#getStudents.COUNTY#</span><br /><span id="ENGs">COUNTY</span></div>	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.AUXLNAME#</span><br /><span id="ENGs">LAST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXFNAME#</span><br /><span id="ENGs">FIRST NAME</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXAREA# : #getStudents.AUXPREFIX#-#getStudents.AUXSUFFIX#</span><br /><span id="ENGs">HOME PHONE</span></div>	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.AUXSTREET#</span><br /><span id="ENGs">STREET/FIRE</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXDIRECTION#</span><br /><span id="ENGs">DIR</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXSTREETNAME#</span><br /><span id="ENGs">STREET</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXAPARTMENT#</span><br /><span id="ENGs">APARTMENT</span></div>	</td>
  </tr>
    <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="uline">#getStudents.AUXCITY#</span><br /><span id="ENGs">CITY</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXSTATE#</span><br /><span id="ENGs">STATE</span></div>
	<div id="wrap"><span id="uline">#getStudents.AUXZIP#</span><br /><span id="ENGs">ZIP</span></div>	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="ENG">LAST SCHOOL ATTENDED: </span><span id="uline">#getStudents.LASTSCHOOL#</span></div>
	<div id="wrap"><span id="ENG">DATE STARTED: </span><span id="uline">#getStudents.LS_STARTMONTH#/#getStudents.LS_STARTDAY#/#getStudents.LS_STARTYEAR#</span></div>

	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="ENG">STREET: </span><span id="uline">#getStudents.LS_STREET#</span></div>

	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="ENG">CITY: </span><span id="uline">#getStudents.LS_CITY#</span></div>
	<div id="wrap"><span id="ENG">STATE: </span><span id="uline">#getStudents.LS_STATE#</span></div>
	<div id="wrap"><span id="ENG">ZIP: </span><span id="uline">#getStudents.LS_ZIP#</span></div>
	<div id="wrap"><span id="ENG">COUNTRY: </span><span id="uline">#getStudents.LS_COUNTRY#</span></div>
	</td>
  </tr>
  <tr>
    <td>
	<div id="wrap"><span id="ENG">HAS STUDENT EVER ATTENDED A U-46 SCHOOL: </span><span id="uline">#getStudents.PREVU46#</span></div>
	<div id="wrap"><span id="ENG">LAST DATE ATTENDED: </span><span id="uline">#getStudents.LS_ENDMONTH#/#getStudents.LS_ENDDAY#/#getStudents.LS_ENDYEAR#</span></div>
	</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><p><strong>STUDENT REQUEST FOR THE LOAN OF TEXTBOOKS</strong><br />
      I hearby request the loan of secular textbooks in accordance with public act 79-961 of 1975. I understand the request will remain valid as long as my child is enrolled in School District U-46, and I may at any time withdraw this request.</p>
    <p id="SIG">Parent Signature &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></td>
  </tr>
</table>
</cfoutput>

