<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- SET PARAMS -->
<cfparam name="LoginFailed" type="boolean" default=true>
<cfparam name="username" default="">
<cfset errorMsg ="">
<cfset temp=''>
<cfset today = dateformat(now(), "yyyy-mm-dd")>

<cfif isdefined('url.mode') AND url.mode eq "login">
	<!-- Verify Password is not blank! -->
	<cfif form.password eq "">You must enter a password.<cfabort></cfif>
	<!-- Verify Username is not numeric! -->
	<cfif REFindNoCase("[a-z]",form.username) EQ 0>Invalid username.<cfabort></cfif>

		<!-- LDAP AUTHENTICATION -->

	<!-- Query for DN -->
	<cfldap
	action="query"
	name="getDN"
	start="o=u46" scope="subtree"
	attributes="dn"
	filter="cn=#form.username#"
	server="10.99.1.116"
	>
<cfif getDN.recordcount gt 1><div style="align: center; margin: 50px; font-family: arial; font-weight: bold;"><h2 style="color: red;">Error</h2><p>There is a problem with your log in: your Novell username is not unique.</p> <p>A copy of this error has been sent to the helpdesk.
</p><p>If you need immediate assistance, please contact the Helpdesk at x4295.</p></div>
<cfmail to="webapps@u-46.org,helpdesk@u-46.org" from="no-reply@u-46.org" subject="Big Bus Online Error" type="html">
User #form.username# has a non-distinct CN name.
</cfmail>
<cfabort>
</cfif>

<!---cfoutput>#getDN.dn#</cfoutput--->
	<cftry>
		<cfset ldapConn = createObject("java", "com.novell.ldap.LDAPConnection").init()/>
		<cfset ldapConn.connect( "10.99.1.116", "389" )/>
		<cfset userPwObj = createobject("java", "java.lang.String").init("#form.password#")/>
		<!---We need to place the password in an instance of java.lang.String because it needs to be passed to the LDAP as a byte array rather than a string. --->
		<cfset ldapConn.bind(3, "#getDN.DN#", userPwObj.getBytes("UTF8"))/>
		<cfset LoginFailed = false>
		         <cfcatch type="Any">
		          	<cfset LoginFailed = true>
				  	<cflock scope="session" type="exclusive" timeout="2">
					<cfset session.ADapproved = "no">
					</cflock>
					<cfset variables.ADapproved = "no">
		         </cfcatch>
	</cftry>

	<!-- If login successful, query for last name and email address -->
	<cfif NOT LoginFailed>
		<cfldap
		action="query"
		name="userInfo"
		start="o=u46" scope="SUBTREE"
		attributes="mail,sn,givenName"
		filter="cn=#form.username#"
		server="10.99.1.116"
		>
		<cfset dmNm = getDN.dn>
		<cfset ldapConn.disconnect()/>

		<cfif FindNoCase('ou=SUB', #dmNm#) or FindNoCase('ou=IN', #dmNm#)>
			<cfset errorMsg= "You are not authorized to use this application.  <br>Please contact Help Desk.">
			<cfset LoginFailed = true>
		<cfelse>
			<cfquery name="getadminaccess" datasource="panthertest">
				SELECT
				b.scid, b.secid, slname, sfname,  SECSYSTEM, SECSYSTEMLEVEL
				FROM BSCT b, ssct s
				WHERE trim(lower(sfname)) || trim(lower(slname)) = lower(<cfqueryparam value = "#form.username#" cfsqltype = "cf_sql_char" maxLength = "40"> )
				AND b.DIST='4600' 
				and b.secid=s.secid and b.scid=s.scid and b.dist=s.dist
				and SECSYSTEM='BUSADMIN'
			</cfquery>
			<cfif getadminaccess.recordcount ge 1>
				<cflock scope="session" type="exclusive" timeout="2">
					<cfset session.ADapproved = "yes">
				</cflock>
				<cfset variables.ADapproved = "yes">
				<cfset session.userID = Lcase(#form.username#)>
				<cfset session.screenName="#userinfo.givenName# #userinfo.sn#">
				<cfset session.email = "#userInfo.mail#">
				<cfset session.isSubstitute = 'N'>
				<cfset session.toolbar = "ad">
				<cfset session.loginLocation = "admain.cfm">
				<cfset connector = ''>
				<cfloop query="getadminaccess">
					<cfset session.allowedschools = session.allowedschools & connector & getadminaccess.scid>
					<cfset connector = ','>
				</cfloop>
				<cflocation url="#session.loginLocation#" addtoken="no">
			</cfif>
			<cfif session.ADapproved neq "yes">
				<cfset errorMsg= "You are not authorized to use this application.<BR>  Please contact Help Desk">
				<cfset LoginFailed = true>
			</cfif>
		</cfif>
	</cfif>
</cfif>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>BigBus Online Login</title>
<style>
<!--
body {
	font-family: arial;
}
.style1 {color: #0000FF}
.style2 {color: #FF0000}
.style3 {color: #009900}


html {
	margin: 0px;
	visibility: visible;
	height: 100%;
	text-align: center;
}
body {
	margin: 0px;
	visibility: visible;
	height: 100%;
	text-align: center;
}
#waxpadautoid1 {
	z-index: 5;
	margin: 0px;
	overflow: hidden;
	text-align: left;
	visibility: visible;
	overflow: hidden;
	clip: auto;
	float: none;
	border: 0px;
	padding: 0px;
	margin: 0px;
	min-width: 0px;
	max-width: none;
	min-height: 0px;
	max-height: none;
	position: relative;
	margin-left: auto;
	width: 435.0px;
	margin-right: auto;
	height: 250.0px;
	top: -125px;
}
#waxpadhangerwaxpadautoid1 { z-index: 5; visibility: hidden; overflow: visible; position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; }
#waxpadvertcasewaxpadautoid1 { visibility: hidden; position: relative; height: auto !important; height: 50%; min-height: 50%; width: 100%; top: 0; left: 0; }
#waxpadvertpropwaxpadautoid1 { visibility: hidden; position: relative; width: 100%; height: 125px; }
#waxpadvertseedwaxpadautoid1 { visibility: hidden; position: absolute; top: 100%; left: 0; height: 10px; width: 100%; }
-->
</style>
<script type="text/javascript">
function validate_required(field,alerttxt)
{
with (field)
{
if (value==null||value=="")
  {alert(alerttxt);return false}
else {return true}
}
}

function validate_form(thisform)
{
with (thisform)
{
if (validate_required(password,"Please enter your password.")==false)
  {password.focus();return false}
else
if (validate_required(username,"Please enter your Novell username.")==false)
  {username.focus();return false}
}
}
</script>
</head>

<body>
<div id="waxpadhangerwaxpadautoid1" class="waxpadstylehook">
<div id="waxpadvertcasewaxpadautoid1" class="waxpadstylehook">
<div id="waxpadvertpropwaxpadautoid1" class="waxpadstylehook"></div>
<div id="waxpadvertseedwaxpadautoid1" class="waxpadstylehook"><div id="waxpadautoid1">
<cfoutput><form id="login" name="login" method="post" action="index.cfm?mode=login" onsubmit="return validate_form(this)">

<table width="435" height="130" border="0" align="center" cellpadding="5" cellspacing="0" <cfif NOT LoginFailed or not isDefined('url.mode')>style="border: 3px solid ##274E91" bgcolor="##FFFFFF"</cfif><cfif LoginFailed and isDefined('url.mode')>style="border: 3px solid ##FF0000" bgcolor="##FFFFFF"</cfif> >
  <tr>
  <cfif NOT LoginFailed or not isDefined('url.mode')><td height="16" colspan="2" style="background-color:##274E91; color:##FFFFFF;"><strong>Please Log In</strong></td>
  </cfif>
  <cfif LoginFailed and isDefined('url.mode')><td colspan="2" style="background-color:##FF0000; color:##FFFFFF;"><strong>Login Incorrect</strong><BR><span style="font-size: 9pt;"><I>#variables.errorMsg#</I></span></td></cfif>
    </tr>
  <tr>
    <td width="122" valign="top">Novell Username:</td>
    <td><input type="text" name="username" style="width: 150px;" value="#username#" maxlength="30"  autocomplete="off" />
      </td>
    </tr>

  <tr>
    <td style="border-bottom: 1px dashed gray;">Password:</td>
    <td style="border-bottom: 1px dashed gray;"><input type="password" name="password" style="width: 150px;" maxlength="20" value="" autocomplete="off" /><BR>#variables.temp#</td>
    </tr>
  <tr>
    <td colspan="2" bgcolor="##EBEBEB"><div align="center">
        <input type="submit" name="Submit" value="&nbsp;&nbsp;&nbsp;Login&nbsp;&nbsp;&nbsp;" />
    </div></td>
    </tr>
</table>
</form></cfoutput>
</div></div></div></div>
<script language="JavaScript"> document.forms[0].username.focus(); </script>
</body>
</html>
