<SCRIPT language="JavaScript" type="text/javascript">
<!-- ;
var newwindow = ''
function popitup(url) {
if (newwindow.location &&!newwindow.closed) {
newwindow.location.href = url;
newwindow.focus(); }
else {
newwindow=window.open(url,'help','width=770,height=500,resizable=yes,scrollbars=yes,status=no,toolbar=no, location=no,directories=no,menubar=no,copyhistory=no,screenx=100,screeny=20');}
}

// Based on JavaScript provided by Peter Curtis at www.pcurtis.com -->
</SCRIPT>

<table border="0" cellpadding="0" cellspacing="0" width="100%" class="toolbar">
	<tr>
		<td align="left"><cfoutput>#session.screenName#</cfoutput></td>
		<td align="right"><strong>
		<cfif session.toolbar eq "login">
			<a href="index.cfm">Log In</a>
		<cfelseif session.toolbar eq "sub">
			<a href="logout.cfm">Log Out</a>
		<cfelseif isDefined("url.light")>
			&nbsp;
		<cfelseif session.toolbar eq "ad">
			&bull; <a href="findstudent.cfm?t=1">Find Student</a> &bull; <a href="findstudent_panther.cfm?t=1">Panther Lookup</a> &bull; <a href="adreports.cfm?t=1">Reports</a> &bull; <a href="enterconfnum.cfm?t=1">Enter Confirmation Number</a> &bull; <a href="logout.cfm?t=1">Log Out</a>
		</cfif>
</strong>
		</td>
	</tr>
</table>