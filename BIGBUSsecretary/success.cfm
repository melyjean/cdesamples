<cfinclude template="adsecure.cfm">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/summary.css">
<title>U-46 Enrollment Form</title>
<style>
	<!--
body {
	text-transform:uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size:12px;
}
-->
</style>
</head>

<body>

<table width="700" border="0" align="center" cellpadding="4" cellspacing="0" style="border: 1px solid black;">
  <tr>
    <td colspan="2" style="border-bottom: 1px solid black; height: 32px; vertical-align: bottom; font-size: 18pt;"><strong>Enrollment confirmation </strong></td>
	<td style="border-bottom: 1px solid black; vertical-align: top; text-align: right;"><strong>Confirmation # 123456789</strong><BR></td>
  </tr>
  <tr>
    <td width="95"><strong>Student Name: </strong></td>
    <td>Warnock, Justin Allen </td>
    <td><strong>Date of Birth</strong>: 09/16/1992 </td>
  </tr>
 <tr><td colspan="4">
 <cfif (IsDefined("form.submit") AND (form.submit eq "  Save Record  "))>
 This record has been updated, but has not been transferred to Panther
  <cfelseif (IsDefined("form.submit") AND (form.submit eq "Submit To Panther"))>
  The data has been successfully transferred to Panther.
  <cfelse>
 This record has been updated, but has not been transferred to Panther.
 </cfif>
 <form action="success.cfm" method="post">
       <input type="submit" value="Close Window" / onclick='javascript:window.close()'>
 </form>
</td>
</table>

</body>
</html>
