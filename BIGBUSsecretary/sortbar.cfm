<form action="<cfoutput>#thispage#<cfif isdefined('url.SID')>?SID=#url.SID#</cfif></cfoutput>" method="post" style="margin: 5px;"  name="reportSort" />

<table width="680" border="0" align="center" cellpadding="3" cellspacing="0" id="print">
  <tr>
	<td colspan="6" style="font-size: .8em; color: #666666;">Select one or more of the sort options below to sort the report:</td>
  </tr>
  <cfif thispage eq "daily.cfm">
  <tr>
    <td colspan="6">Start Date: <input name="startDate" type="text" <cfif isdefined('form.startDate')>value="#form.startDate#"</cfif> size="8" readonly="true" >
                  <a href="javascript:cal1.popup();"><img src="../images/cal.gif" border="0" alt=" pop-up"></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="INI_EVAL.value=''" style="text-decoration: none;"><img src="../images/reset.jpg" border="0" alt="reset field"></a> &nbsp;&nbsp;&nbsp;End Date: <input name="endDate" type="text" <cfif isdefined('form.endDate')>value="#form.endDate#"</cfif> size="8" readonly="true" >
                  <a href="javascript:cal2.popup();"><img src="../images/cal.gif" border="0" alt=" pop-up"></a>&nbsp;&nbsp;<a href="javascript:void(0);" onClick="INI_EVAL.value=''" style="text-decoration: none;"><img src="../images/reset.jpg" border="0" alt="reset field"></a>
	</td>
  </tr>
  </cfif>
  <tr>
    <td style="vertical-align: top;"><select name="sort1">
			<option value="">Sort by...</option>
			<cfoutput>#sortlist#</cfoutput>
		</select>	</td>
    <td style="vertical-align: top;"><select name="sort2">
			<option value="">then by...</option>
			<cfoutput>#sortlist#</cfoutput>
		</select></td>
    <td style="vertical-align: top;"><select name="sort3">
			<option value="">then by...</option>
			<cfoutput>#sortlist#</cfoutput>
		</select></td>
    <td style="vertical-align: top;"><select name="sort4">
			<option value="">and by...</option>
			<cfoutput>#sortlist#</cfoutput>
		</select></td>
    <td style="vertical-align: top;">
	  <span style="font-size: .7em;">Asc</span>
		<input name="DESC" type="radio" value="" checked>
      <span style="font-size: .7em;">&nbsp;&nbsp;Desc</span>
    	<input name="DESC" type="radio" value="DESC"></td>
    <td style="vertical-align: top;"><div align="center">
      <input type="submit" value="Sort" />
    </div></td>
  </tr>
</table>
<cfif isdefined('form.userID')><cfoutput><input type="hidden" name="userID" value="#form.userID#"></cfoutput></cfif>
</form>
