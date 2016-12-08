<cfinclude template="includes/header.cfm">
<cfif not isdefined('url.language')>
  <cflocation url="index.cfm" addtoken="no">
</cfif>
<cfif url.language eq 'english'>
  <cfset session.language = 'english'>
  <cfelse>
  <cfset session.language = 'spanish'>
</cfif>
<body onload="setActiveStyleSheet('<cfoutput>#session.language#</cfoutput>')">
	<div id="toolbar"> <a href="#" onclick="setActiveStyleSheet('english'); return false;">English</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('spanish'); return false;">Espa&Ntilde;ol</a> &nbsp;&nbsp; 
	  <a href="#" onclick="setActiveStyleSheet('bilingual'); return false;">Bilingual</a>
	</div>
<form action="findStudent.cfm" method="post">
  <table width="675" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr>
      <td valign="top"><strong>
        <label id='ENG'>Student&nbsp;Name:</label>
        <label id='ESP'>Nombre de Estudiante:</label>
        </strong></td>
      <td align="left"><div align="center">
          <input type="text" name="LNAME" />
          <span class="style1">
          <label id='ENG'>LAST</label>
          <label id='ESP'>APELLIDO</label>
          </span></div></td>
      <td><div align="center">
          <input type="text" name="FNAME" />
          <span class="style1">
          <label id='ENG'>FIRST</label>
          <label id='ESP'>PRIMER NOMBRE</label>
          </span></div></td>
      <td><div align="center">
          <input type="text" name="MNAME" />
          <span class="style1">
          <label id='ENG'>MIDDLE</label>
          <label id='ESP'>SEGUNDO NOMBRE</label>
          </span></div></td>
    </tr>
    <tr>
      <td valign="top" style="vertical-align:top;"><strong>
        <label id='ENG'>Birthdate:</label>
        <label id='ESP'>FECHA DE NACIMIENTO:</label>
        </strong></td>
      <td colspan="3"><table border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td><input name="BIRTHMONTH" type="text" size="1" maxlength="2" /></td>
            <td>-</td>
            <td><input name="BIRTHDAY" type="text" size="1" maxlength="2" /></td>
            <td>-</td>
            <td><select name="BIRTHYEAR">
                <option value="2005">2005</option>
                <option value="2004">2004</option>
                <option value="2003">2003</option>
                <option value="2002">2002</option>
                <option value="2001">2001</option>
                <option value="2000">2000</option>
                <option value="1999">1999</option>
                <option value="1998">1998</option>
                <option value="1997">1997</option>
                <option value="1996">1996</option>
                <option value="1995">1995</option>
                <option value="1994">1994</option>
                <option value="1993">1993</option>
                <option value="1992">1992</option>
                <option value="1991">1991</option>
                <option value="1990">1990</option>
				<option value="1982">1982</option>
              </select></td>
            <td>(mm DD YYYY) </td>
          </tr>
          <tr>
            <td align="center"><span class="style1">
              <label id='ENG'>MM</label>
              <label id='ESP'>MES</label>
              </span></td>
            <td>&nbsp;</td>
            <td align="center"><span class="style1">
              <label id='ENG'>DD</label>
              <label id='ESP'>DÍA</label>
              </span></td>
            <td>&nbsp;</td>
            <td align="center"><span class="style1">
              <label id='ENG'>YYYY</label>
              <label id='ESP'>AÑO</label>
              </span></td>
            <td align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign="top"><strong>
        <label id='ENG'>GENDER:</label>
        <label id='ESP'>SEXO:</label>
        </strong></td>
      <td colspan="2"><input name="GENDER" type="radio" value="M" />
        <label id='ENG'>MALE&nbsp;</label>
        <label id='ESP'>MASCULINO</label>
        &nbsp;
        <input name="GENDER" type="radio" value="F" />
        <label id='ENG'>FEMALE</label>
        <label id='ESP'>FEMENINO</label>
        <strong>
        <label id='ESP'></label>
        </strong></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong>
        <label id='ENG'>Ethnic:</label>
        <label id='ESP'>ETNICA:</label>
        </strong></td>
      <td colspan="2" valign="top"><select name="ETHNIC">
          <option value="0">Choose / Seleccione...</option>
          <option value="1">Black</option>
          <option value="2">White</option>
          <option value="3">American Indian Alaskan</option>
          <option value="4">Asian/Pacific Islander</option>
          <option value="5">Hispanic</option>
          <option value="6">Multi-Racial</option>
        </select></td>
      <td valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong>
        <label id='ENG'>Current Grade:</label>
        <label id='ESP'>GRADO: </label>
        </strong></td>
      <td colspan="2" valign="top"><select name="select6">
          <option value="invalid">Choose / Seleccione...</option>
          <option value="PK">Pre-K</option>
          <option value="K">Kindergarten</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select></td>
      <td valign="top">&nbsp;</td>
    </tr>
    <tr>
      <td valign="top"><strong>
        <label id='ENG'>Last U-46 School Attended:</label>
        <label id='ESP'>Última escuela a la cual asistió en U-46:</label>
        </strong></td>
      <td colspan="3" valign="top"><select name="select14">
          <option value="invalid">Choose / Seleccione...</option>
          <option value="none">New to district</option>
          <option value="SCID">Bartlett Elementary</option>
          <option value='SCID'>Sycamore Trails Elementary</option>
        </select></td>
    </tr>
    <tr>
      <td valign="top"><strong>STUDENT ID: </strong></td>
      <td colspan="3" valign="top"><input type="text" name="SID" maxlength="9" /></td>
    </tr>
    <tr>
      <td colspan="2" valign="top">&nbsp;</td>
      <td valign="top">&nbsp;</td>
      <td valign="top"><div align="right">
          <input type="submit" name="Submit" value="Next >>" />
        </div></td>
    </tr>
  </table>
</form>
</body>
<cfinclude template="includes/footer.cfm">
