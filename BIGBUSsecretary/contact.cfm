<cfinclude template="adsecure.cfm">
<cfinclude template="globalVars.cfm">
<link rel="stylesheet" type="text/css" href="style_v1.css">
<style>
.tableBorder {
	background-color: white;
	margin: 10px;
	border: 1px solid gray;
}
body {
	font-family: arial;
	background-color: #C0C0C0;
	}
</style>
<cfparam name="mode" default="compose">
<cfif mode eq "compose">
<cfform action="contact.cfm?mode=send" method="post">
<table width="400" border="0" align="center" cellpadding="3" cellspacing="2" class="tableBorder">
  <tr>
    <td colspan="3" class="label"><strong>Contact Us</strong></td>
    </tr>
  <tr>
    <td width="58" style="border-right: 1px dashed #999999; font-size: .8em; border-top: 1px dashed #999999;">Name:</td>
    <td width="150" style="border-top: 1px dashed #999999;"><cfinput type="text" name="name" required="yes" message="Please enter your name." value="#session.screenname#"></td>
    <td width="164" style="border-top: 1px dashed #999999;"><span style="font-size: 0.8em; color: #666666">(your name) </span></td>
  </tr>
  <tr>
    <td style="border-right: 1px dashed #999999; font-size: .8em;">Email:</td>
    <td><cfinput type="text" name="sender" required="yes" message="Please enter a valid email address." value="#session.email#"></td>
    <td width="164"><span style="font-size: 0.8em; color: #666666">(your email address)</span> </td>
  </tr>
  <tr>
    <td style="border-right: 1px dashed #999999; vertical-align: top; font-size: .8em; border-bottom: 1px dashed #999999;">Message: 
      <br></td>
    <td colspan="2" style="border-bottom: 1px dashed #999999;"><textarea name="message" cols="35" rows="8"></textarea></td>
  </tr>
  <tr>
    <td colspan="3"><div align="center">
	<cfoutput><input type="hidden" name="dateTime" value="#dateformat(now(), "mm/dd/yyyy")# #timeformat(now(), "h:mm tt")#"></cfoutput>
      <input type="submit" value="&nbsp;&nbsp;Submit&nbsp;&nbsp;">
    </div></td>
    </tr>
</table>
</cfform>
</cfif>
<cfif mode eq "send">
<cfoutput>
<!-- send to help contact -->
<cfmail to="#variables.helpContact#" from="#form.sender#" subject="Big Bus Inquiry" type="html">
<table width="400" border="0" cellspacing="2" cellpadding="3">
  <tr>
    <td colspan="2" style="border-bottom: 2px solid red; font-weight: bold;">U&bull;46 Big Bus </td>
    </tr>
  <tr>
    <td colspan="2">On <span style="font-weight: bold">#dateTime#</span>, <span style="font-weight: bold"><a href="mailto:#form.sender#">#form.name#</a></span> wrote: </td>
    </tr>
  <tr>
    <td colspan="2">&quot;#message#&quot;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</cfmail>
<!-- send confirmation to sender -->
<cfmail to="#form.sender#" from="#variables.helpContact#" subject="Big Bus Inquiry" type="html">
<table width="400" border="0" cellspacing="2" cellpadding="3">
  <tr>
    <td style="border-bottom: 2px solid red; font-weight: bold;">U&bull;46 Big Bus</td>
    </tr>
  <tr>
    <td>On <span style="font-weight: bold">#dateTime#</span>, <span style="font-weight: bold">#form.name#</span> wrote: </td>
    </tr>
  <tr>
    <td>&quot;#message#&quot;</td>
    </tr>
</table>
</cfmail>
<table width="400" border="0" align="center" cellpadding="3" cellspacing="2" class="tableBorder">
	<tr>
	  <td>
<p align="center" style="padding: 10px;"><strong>Your inquiry has been submitted.<br>
  A copy of the inquiry has been sent to you.</strong><br>
  <img src="images/email2.jpg" width="128" height="128"></p>
  <div align="center"><form>
<input type="button" value="Close This Window" onClick="javascript:window.close();">
</form> </div>
	  </td>
	</tr>
</table>
</cfoutput>
</cfif>
