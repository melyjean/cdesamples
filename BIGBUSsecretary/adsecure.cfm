<cflock scope="session" type="readonly" timeout="2">
	<cfset variables.ADapproved = session.ADapproved>
</cflock>

<cfif variables.ADapproved is not "yes">
	<cflock scope="session" type="exclusive" timeout="2">
	<cfinclude template="clear.cfm">
	</cflock>
	<!---cflocation url="index.cfm" addtoken="no"--->
	<cfinclude template="clear.cfm">
	<script language="javascript1.1">
	parent.location.href="http://intranet/bigbussecretary"
	</script>
<cfelse>
	<cfset session.toolbar = "ad">
</cfif>