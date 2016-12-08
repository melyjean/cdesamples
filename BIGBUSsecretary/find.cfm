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
      <td align="left"><div>
          <input type="text" name="LNAME" />
          <span class="style1">
          <label id='ENG'>LAST</label>
          <label id='ESP'>APELLIDO</label>
          </span></div></td>
      <td colspan="2"><div>
          <input type="text" name="FNAME" />
          <span class="style1">
          <label id='ENG'>FIRST</label>
          <label id='ESP'>PRIMER NOMBRE</label>
          </span></div></td>
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
	  <td>&nbsp;</td>
      <td colspan="2" valign="top"><div align="center">--- OR ---</div></td>
	  <td>&nbsp;</td>
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
