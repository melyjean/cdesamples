<cfinclude template="adsecure.cfm">

<cfinclude template="includes/sec_header.cfm">
<table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr>
    <td><cfform name="studentSearch" action="searchResults.cfm" method="post"><table width="550" border="0" align="center" cellpadding="3" cellspacing="2" class="tableBorder">
      <tr>
        <td colspan="4" class="label">Search by Student </td>
        </tr>
      <tr>
        <td colspan="4" style="border-bottom: 1px dashed #999;"><div align="center" style="font-size: 0.8em">
          <div align="left">Search by one or more of the fields below: </div>
        </div></td>
        </tr>
		
      <tr bgcolor="#EBEBEB">
        <td colspan="2">Confirmation Number:</td>
        <td colspan="2"><cfinput type="text" name="confnum" /></td>
      </tr>
      <tr>
        <td width="86">ID Number: </td>
        <td width="146"><label>
          <cfinput type="text" name="sid" validate="integer" maxlength="9" message="Please enter a valid student ID." />
        </label></td>
        <td width="117">DOB: <span style="font-size: 0.7em">(mm/dd/yyyy) </span></td>
        <td width="165"><cfinput type="text" validate="integer" maxlength="2" name="birthmonth" size="1" /> / <cfinput type="text" validate="integer" maxlength="2" name="birthday" size="1" /> / <cfinput type="text" validate="integer" maxlength="4" name="birthyear" size="3" /></td>
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