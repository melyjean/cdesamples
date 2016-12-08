<cfinclude template="adsecure.cfm">
<cfinclude template="includes/sec_header.cfm">


<table width="400" border="0" align="center" cellpadding="3" cellspacing="0" class="tableBorder">
  <tr>
    <td class="blue" style="padding: 7px;">Please choose a report:</td>
  </tr>
  <tr>
    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="javascript:popitup('pending_report.cfm');">Pending Student Registration Report</a></span></td>
  </tr>
  <tr>
    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="javascript:popitup('approved_report.cfm');">Approved Student Registration Report</a></span></td>
  </tr>
    <tr>
    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="javascript:popitup('incomplete_report.cfm');">Incomplete Student Registration Report</a></span></td>
  </tr>
    <tr>
    <td class="tdBorder"><span style="font-weight: bold">&nbsp;<a href="javascript:popitup('school_snapshot.cfm');">School Snap Shot Report</a></span></td>
  </tr>
</TABLE>
<cfinclude template="includes/sec_footer.cfm">