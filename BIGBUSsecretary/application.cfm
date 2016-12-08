<cfapplication name="login" sessionmanagement="yes" setclientcookies="yes">
<cflock scope="session" type="exclusive" timeout="10">
	<cfparam name="session.language" default="">
	<cfparam name="session.allowedschools" default="">
	<cfparam name="variables.ADapproved" default="">
	<cfparam name="session.ADapproved" default="">
	<cfparam name="session.loginlocation" default="">
	<cfparam name="session.schoolStruct" type="struct" default="#structNew()#">
	<cfparam name="session.ethnicStruct" type="struct" default="#structNew()#">
	<cfparam name="session.countryStruct" type="struct" default="#structNew()#">
	<cfparam name="session.languageStruct" type="struct" default="#structNew()#">
	<cfparam name="session.schoolListStruct" type="struct" default="#structNew()#">
	<cfparam name="session.familyStruct" type="struct" default="#structNew()#">
	<cfparam name="session.stateStruct" type="struct" default="#structNew()#">
	<cfparam name="session.feeStruct" type="struct" default="#structNew()#">
	<cfparam name="session.streetSuffixStruct" type="struct" default="#structNew()#">
	<cfparam name="session.directionStruct" type="struct" default="#structNew()#">
	<cfparam name="session.countyStruct" type="struct" default="#structNew()#">
</cflock>




