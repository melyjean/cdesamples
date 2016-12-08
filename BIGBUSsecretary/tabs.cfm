<cfinclude template="includes/header.cfm">

<body onload="setActiveStyleSheet('<cfoutput>#session.language#</cfoutput>')">
<table id="wrapper" cellpadding="0" cellspacing="0" border="0">
<tr><td>
<div id="toolbar">
  <a href="#" onclick="setActiveStyleSheet('english'); 
return false;">English</a> &nbsp;&nbsp;
<a href="#" onclick="setActiveStyleSheet('spanish'); 
return false;">Espa&Ntilde;ol</a> &nbsp;&nbsp;
<a href="#" onclick="setActiveStyleSheet('bilingual'); 
return false;">Bilingual</a></div>
<ul id="maintab" class="shadetabs">
<li class="selected"><a href="#" rel="tcontent1">Student Demographics</a></li>
<li><a href="#" rel="tcontent2">Address Information</a></li>
<li><a href="#" rel="tcontent3">Emergency Contacts</a></li>
<li><a href="#" rel="tcontent4">Health Concerns</a></li>
</ul>

<div class="tabcontentstyle">

<div id="tcontent1" class="tabcontent">
<p>&nbsp;</p>
<cfinclude template='includes/incl_demo.cfm'>
<p style="text-align:right;"><input type="button" onclick="javascript: expandtab('maintab', 1)" value="Next >>" /></b></p>
</div>

<div id="tcontent2" class="tabcontent">
<p>&nbsp;</p>
<cfinclude template='includes/incl_address.cfm'>
<p style="text-align:right;"><input type="button" onclick="javascript: expandtab('maintab', 2)" value="Next >>" /></b></p>
</div>

<div id="tcontent3" class="tabcontent">
Tab content 3 here<br />Tab content 3 here<br />
</div>

<div id="tcontent4" class="tabcontent">
Tab content 4 here<br />Tab content 4 here<br />
</div>


</div>
</td></tr></table>
<script type="text/javascript">
//Start Tab Content script for UL with id="maintab" Separate multiple ids each with a comma.
initializetabcontent("maintab")
</script>
<cfinclude template="includes/footer.cfm">
