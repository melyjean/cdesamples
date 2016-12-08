<cfset newurl = "http://intranet/bigbussecretary">
<cfif isDefined("url.loc")>
	<cfset newurl = url.loc>
</cfif>
<cflock scope="session" type="exclusive" timeout="2">
	<cfinclude template="clear.cfm">
</cflock>
<script language="javascript1.1">
	<cfoutput>parent.location.href="#newurl#"</cfoutput>
</script>
