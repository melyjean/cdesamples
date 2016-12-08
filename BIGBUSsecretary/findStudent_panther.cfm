<cfinclude template="adsecure.cfm">

<cfinclude template="includes/sec_header.cfm">
<table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr>
    <td><cfform name="studentSearch" action="panther_lookup.cfm" method="post"><table width="550" border="0" align="center" cellpadding="3" cellspacing="2" class="tableBorder">
      <tr>
        <td colspan="4" class="label">Panther Lookup </td>
        </tr>
      <tr>
        <td colspan="4" style="border-bottom: 1px dashed #999;"><div align="center" style="font-size: 0.8em">
          <div align="left">Search by one or more of the fields below: </div>
        </div></td>
        </tr>
      <tr>
        <td width="86">ID Number: </td>
        <td colspan="3"><label>
          <cfinput type="text" name="sid" validate="integer" maxlength="9" message="Please enter a valid student ID." />
        </label></td>
      </tr>
      <tr bgcolor="#EBEBEB">
        <td>Last Name:</td>
        <td><label>
          <cfinput type="text" name="lname" />
        </label></td>
        <td>First Name:</td>
        <td><cfinput type="text" name="fname" /></td>
      </tr>
      
      <tr>
        <td colspan="4"><div align="center">
          <input type="submit" value="&nbsp;Search&nbsp;" style="margin: 3px;">
        </div></td>
        </tr>
    </table>
    </cfform></td>
  </tr>
</table>
<cfinclude template="includes/sec_footer.cfm">