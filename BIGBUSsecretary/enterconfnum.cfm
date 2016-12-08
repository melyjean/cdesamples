<cfinclude template="adsecure.cfm">

<cfinclude template="includes/sec_header.cfm">
<table width="100%" border="0" cellpadding="5" cellspacing="0">
 <tr>
    <td><form name="studentSearch" action="review_filled.cfm" method="post" target="_blank"><table width="550" border="0" align="center" cellpadding="3" cellspacing="2" class="tableBorder">
      <tr>
        <td class="label" colspan=2>Search by Student </td>
        </tr>
      <tr>
        <td  colspan=2 style="border-bottom: 1px dashed #999;"><div align="center" style="font-size: 0.8em">
          <div align="left">Enter Confirmation Number: </div>
        </div></td>
        </tr>
      <tr>
        <td width="86"> Number: </td>
        <td ><label>
          <input type="text" name="cnum"  maxlength="9">
        </label></td>
      </tr>
	  <tr>
                <td >
          <input type="submit">
        </td>
      </tr>
    </table>
    </form></td>
  </tr>
</table>
<cfinclude template="includes/sec_footer.cfm">