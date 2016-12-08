<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/style_v1.css">
<title>U-46 Student Enrollment</title>
<style type="text/css">
<!--
table {border: 2px solid gray;}
table table{border: 0px;}
#bus {display: none;}
#aux {display: none;}
-->
</style>
<script language="JavaScript1.2">

//Highlight form element- © Dynamic Drive (www.dynamicdrive.com)
//For full source code, 100's more DHTML scripts, and TOS,
//visit http://www.dynamicdrive.com

var highlightcolor="#C4FFAA"

var ns6=document.getElementById&&!document.all
var previous=''
var eventobj

//Regular expression to highlight only form elements
var intended=/INPUT|TEXTAREA|SELECT|OPTION/

//Function to check whether element clicked is form element
function checkel(which){
if (which.style&&intended.test(which.tagName)){
if (ns6&&eventobj.nodeType==3)
eventobj=eventobj.parentNode.parentNode
return true
}
else
return false
}

//Function to highlight form element
function highlight(e){
eventobj=ns6? e.target : event.srcElement
if (previous!=''){
if (checkel(previous))
previous.style.backgroundColor=''
previous=eventobj
if (checkel(eventobj))
eventobj.style.backgroundColor=highlightcolor
}
else{
if (checkel(eventobj))
eventobj.style.backgroundColor=highlightcolor
previous=eventobj
}
}

</script>
</head>

<body>
<FORM onKeyUp="highlight(event)" onClick="highlight(event)">
<table width="675" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td width="100" align="right" valign="top"> <div align="right"><strong><label id='ENG'>Student&nbsp;Name:</label><label id='ESP'>Nombre de Estudiante</label></strong></div></td>
    <td width="144"><div align="center">
      <input type="text" name="textfield" />
    <span class="style1">Last</span></div></td>
    <td width="144"><div align="center">
      <input type="text" name="textfield2" />
    <span class="style1">First</span></div></td>
    <td width="144"><div align="center">
      <input type="text" name="textfield22" />
    <span class="style1">Middle</span></div></td>
    <td width="89">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" style="vertical-align:top;"><div align="right"><strong>Birthdate:</strong></div></td>
    <td><table border="0" align="left" cellpadding="0" cellspacing="0">
        <tr>
          <td><input name="textfield3" type="text" size="1" maxlength="2" /></td>
          <td>-</td>
          <td><input name="textfield32" type="text" size="1" maxlength="2" /></td>
          <td>-</td>
          <td><select name="year">
            <option value="2005">2005</option>
            <option value="2004">2004</option>
            <option value="2003">2003</option>
            <option value="2002">2002</option>
            <option value="2001">2001</option>
            <option value="2000">2000</option>
            <option value="1999">1999</option>
            <option value="1998">1998</option>
            <option value="1997">1997</option>
            <option value="1996">1996</option>
            <option value="1995">1995</option>
            <option value="1994">1994</option>
            <option value="1993">1993</option>
            <option value="1992">1992</option>
            <option value="1991">1991</option>
            <option value="1990">1990</option>
          </select></td>
        </tr>
        <tr>
          <td><span class="style1">MM</span></td>
          <td>&nbsp;</td>
          <td><span class="style1">DD</span></td>
          <td>&nbsp;</td>
          <td><span class="style1">YYYY</span></td>
        </tr>
      </table>      </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Gender:</strong></div></td>
    <td><div align="left">
      <input name="radiobutton" type="radio" value="radiobutton" />
      Male&nbsp;&nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
    Female </div></td>
    <td><div align="right"><strong>Ethnic:</strong></div></td>
    <td colspan="2"><div align="left">
      <select name="select">
	  <option value="0">Choose...</option>
        <option value="1">Black</option>
        <option value="2">White</option>
        <option value="3">American Indian Alaskan</option>
        <option value="4">Asian/Pacific Islander</option>
        <option value="5">Hispanic</option>
        <option value="6">Multi-Racial</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><strong>Current Grade:</strong> 
      <select name="select6">
        <option value="invalid">Choose...</option>
        <option value="PK">Pre-K</option>
        <option value="K">Kindergarten</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
      </select>    </td>
    <td valign="top"><strong>Last U-46 School Attended </strong></td>
    <td colspan="2" valign="top"><select name="select14">
	<option value="invalid">Choose...</option>
	<option value="none">New to district</option>
	<option value="SCID">Bartlett Elementary</option>
	<option value='SCID'>Sycamore Trails Elementary</option>
    </select>
    </td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="4" align="left"><strong>Student History </strong></td>
  </tr>
  <tr>
    <td valign="top"><div align="center">
      <input type="text" name="BIRTHCITY" />
      <br />    
    Birth City </div></td>
    <td valign="top"><div align="center">
      <input type="text" name="BIRTHCNTY" />
      <br />
      Birth County </div></td>
    <td valign="top"><div align="center">
      <select name="BIRTHSTATE">
        <option value="IL">IL</option>
      </select>
      <br />
      Birth
      State</div></td>
    <td valign="top"><div align="center">
        <input type="text" name="BIRTHCNTRY" />
        <br />
        Birth
        Country</div></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top">Month/Year of first time entry into U.S. Schools (K-12): </td>
    <td colspan="2" align="left" valign="top"><input type="text" name="textfield15" /></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top">Years of Education in U.S. Schools (K-12) : </td>
    <td colspan="2" align="left" valign="top"><select name="">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
    </select></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top">Refugee? 
      <input name="refugee" type="radio" value="Y" />
Yes&nbsp;&nbsp;&nbsp;
<input name="refugee" type="radio" value="N" />
No</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="3" align="left"><strong>Health Concerns </strong></td>
  </tr>
  
  <tr>
    <td colspan="3" align="left" valign="top">Does the student routinely take medications?&nbsp;&nbsp;
      <input type="checkbox" name="checkbox5" value="checkbox" />
      Yes&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="checkbox" name="checkbox52" value="checkbox" />
      No&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="checkbox" name="checkbox53" value="checkbox" />
      At Home&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="checkbox" name="checkbox54" value="checkbox" />
    At School </td>
  </tr>
  <tr>
    <td width="232" align="left" valign="top">Does the student wear glasses?</td>
    <td width="189" align="left" valign="top"><input name="" type="radio" value="" />
Yes&nbsp;&nbsp;&nbsp;
<input name="" type="radio" value="" />
No</td>
    <td width="232" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">Contact Lenses? &nbsp;&nbsp;</td>
    <td align="left" valign="top"><input name="" type="radio" value="" />
Yes&nbsp;&nbsp;&nbsp;
<input name="" type="radio" value="" />
No </td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">Hearing Aid? &nbsp;</td>
    <td align="left" valign="top"><input name="" type="radio" value="" />
Yes&nbsp;&nbsp;&nbsp;
<input name="" type="radio" value="" />
No</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top">Is there other information about this student that would be useful 
    for the school personnel to know? </td>
    <td align="left" valign="top"><textarea name="textarea"></textarea></td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td valign="top"><div align="right"><strong>Father's&nbsp;Name: </strong></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield4" />
      <span class="style1"><br />
      Last</span></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield23" />
      <br />
      <span class="style1">First</span></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield222" />
      <br />
    <span class="style1">Middle</span></div></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5" valign="top"><div align="center">
      <input name="radiobutton" type="radio" value="radiobutton" />
      Parent Father &nbsp;&nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
      Guardian Father &nbsp;&nbsp;
        <input name="radiobutton" type="radio" value="radiobutton" />
      Joint Custody Father &nbsp;&nbsp;
        <input name="radiobutton" type="radio" value="radiobutton" />
    Foster Parent Father </div></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Home Phone: </strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
          <input name="textfield54" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
          <input name="textfield55" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
          <input name="textfield56" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><input type="checkbox" name="checkbox" value="checkbox" />
    Unlisted</td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Work Phone: </strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
            <input name="textfield542" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
            <input name="textfield552" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
            <input name="textfield562" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><div align="right">Ext.
      <input name="textfield52" type="text" size="2" />&nbsp;&nbsp;
      <strong>Work&nbsp;Place: </strong></div></td>
    <td valign="top"><input type="text" name="textfield5" /></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Cell Phone: </strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
            <input name="textfield543" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
            <input name="textfield553" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
            <input name="textfield563" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><div align="right"><strong>Email&nbsp;Address: </strong></div></td>
    <td valign="top"><input type="text" name="textfield53" /></td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td valign="top"><div align="right"><strong>Mother's&nbsp;Name: </strong></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield42" />
      <span class="style1"><br />
        Last</span></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield232" />
      <br />
      <span class="style1">First</span></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield2222" />
      <br />
      <span class="style1">Middle</span></div></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5" valign="top"><div align="center">
      <input name="radiobutton" type="radio" value="radiobutton" />
      Parent Mother &nbsp;&nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
      Guardian Mother &nbsp;&nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
      Joint Custody Mother &nbsp;&nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
      Foster Parent Mother </div></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Home Phone:<br />
      <span class="style1">
      <input type="checkbox" name="checkbox3" value="checkbox" />
      (Same as Father)</span></strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
          <input name="textfield544" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
          <input name="textfield554" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
          <input name="textfield564" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><input type="checkbox" name="checkbox2" value="checkbox" />
      Unlisted</td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Work Phone: </strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
          <input name="textfield5422" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
          <input name="textfield5522" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
          <input name="textfield5622" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><div align="right">Ext.
      <input name="textfield522" type="text" size="2" />
      &nbsp;&nbsp; <strong>Work&nbsp;Place: </strong></div></td>
    <td valign="top"><input type="text" name="textfield57" /></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Cell Phone: </strong></div></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
          <input name="textfield5432" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
          <input name="textfield5532" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
          <input name="textfield5632" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top"><div align="right"><strong>Email&nbsp;Address: </strong></div></td>
    <td valign="top"><input type="text" name="textfield532" /></td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="6"><strong>Emergency Phone Numbers</strong></td>
  </tr>
  <tr>
    <td colspan="6">Relative/neighbor/friend who can pick up student at school, if parent cannot be reached. (At least one contact person must be listed). </td>
  </tr>
  <tr>
    <td valign="top"><strong>Name:</strong></td>
    <td valign="top"><input type="text" name="textfield43" /></td>
    <td valign="top"><strong>Relation:</strong></td>
    <td valign="top"><input type="text" name="textfield44" /></td>
    <td valign="top"><strong>Phone:</strong></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
            <input name="textfield5443" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
            <input name="textfield5543" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
            <input name="textfield5643" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area&nbsp;Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><strong>Name:</strong></td>
    <td valign="top"><input type="text" name="textfield46" /></td>
    <td valign="top"><strong>Relation:</strong></td>
    <td valign="top"><input type="text" name="textfield45" /></td>
    <td valign="top"><strong>Phone:</strong></td>
    <td valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
            <input name="textfield5444" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
            <input name="textfield5544" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
            <input name="textfield5644" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area&nbsp;Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td><div align="left"><strong>Student Resides With (SELECT ALL THAT APPLY): </strong></div></td>
  </tr>
  <tr>
    <td><div align="left">
      <input type="checkbox" name="checkbox42" value="checkbox" />
    MOTHER <br />
    <input type="checkbox" name="checkbox43" value="checkbox" />
    FATHER <br />
    <input type="checkbox" name="checkbox44" value="checkbox" />
    STEPFATHER <br />
    <input type="checkbox" name="checkbox45" value="checkbox" />
    LEGAL GUARDIAN <br />
    <input type="checkbox" name="checkbox46" value="checkbox" />
    OTHER: 
    <input type="text" name="textfield12" />
    (SPECIFY)</div></td>
  </tr>
  <tr>
    <td>(Principal, teachers, nurses, building secretary, etc.) i.e., proof of order of protection?
    <input type="checkbox" name="checkbox6" value="checkbox" /></td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="7"><strong>Primary Address Information </strong></td>
  </tr>
  <tr>
    <td width="111" valign="top"><select name="select2">
	<option value="invalid">Choose...</option>
	  <option>Mr. &amp; Mrs.</option>
      <option value="Mr.">Mr.</option>
      <option value="Mrs.">Mrs.</option>
      <option value="Miss">Miss</option>
      <option value="Ms.">Ms.</option>
      
    </select>    </td>
    <td width="81" valign="top"><div align="center">
      <input name="FIRENUMBER" type="text" size="8" />
      
    Street/Fire#</div></td>
    <td width="81" valign="top"><div align="center">
  <select name="select13">
    <option value="N">N</option>
    <option value="NE">NE</option>
    <option value="NW">NW</option>
    <option value="E">E</option>
    <option value="W">W</option>
    <option value="S">S</option>
    <option value="SE">SE</option>
    <option value="SW">SW</option>
  </select><br />
    DIR</div></td>
    <td colspan="2" valign="top"><div align="center">
      <input name="STREET" type="text" size="30" />
      <br />
    Street Name </div></td>
    <td width="82" valign="top"><div align="center">
      <select name="select12">
          <option value='ST'>ST</option>
          <option value='AVE'>AVE</option>
        </select>
      <br />
      Suffix
    </div></td>
    <td width="73" valign="top"><div align="center">
      <input name="APARTMENT" type="text" size="5" />
      <br />
    Apartment </div></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td colspan="2" valign="top"><div align="center">
        <input type="text" name="CITY" />
        <br />
    City</div></td>
    <td width="35" valign="top"><div align="center">
      <select name="STATE">
        <option value="IL">IL</option>
      </select>
      
    State</div></td>
    <td width="162" valign="top"><div align="center">
      <select name="ZIP">
        <option value="60120">60120</option>
        <option value="60123">60123</option>
        <option value="60177">60177</option>
        </select>
      <br />
      ZIP
    </div></td>
    <td colspan="2" valign="top"><div align="center">
        <input type="text" name="textfield11" />
        <br />
    County</div></td>
  </tr>
  <tr>
    <td colspan="4">Primary address is same as mailing address?  </td>
    <td colspan="2"><input name="" type="radio" value="" />
Yes&nbsp;&nbsp;&nbsp;
<input name="" type="radio" value="" />
No</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4">Preferred language for mail:</td>
    <td colspan="2"> <input name="radiobutton" type="radio" value="radiobutton" />
      English
      &nbsp; &nbsp;
      <input name="radiobutton" type="radio" value="radiobutton" />
      Spanish    </td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
<p>
Is there another <strong>PARENT</strong> not living with this student that should also receive this student's <br />
information (report cards, progress reports, etc.) by mail? 
<input name="" type="checkbox" value="" onclick="document.getElementById('aux').style.display='block';"/></p>
<table width="675" border="0" cellspacing="0" cellpadding="3" id="aux">
  <tr>
    <td colspan="7"><strong>AUX Mailing Information </strong></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Name:</strong></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield422" />
      <span class="style1"><br />
    Last</span></div></td>
    <td colspan="2" valign="top"><div align="center">
      <input type="text" name="textfield2322" />
      <br />
      <span class="style1">First</span></div></td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="111" valign="top"><div align="right"><strong>Address:</strong></div></td>
    <td width="162" valign="top"><div align="center">
      <input type="text" name="textfield62" />
      <br />
      Street/Fire#</div></td>
    <td width="35" valign="top"><div align="center">
      <input name="textfield72" type="text" size="2" />
      DIR</div></td>
    <td width="162" valign="top"><div align="center">
      <input type="text" name="textfield82" />
      <br />
      Street Name </div></td>
    <td width="82" valign="top"><div align="center">
      <input name="textfield92" type="text" size="5" />
      <br />
      Apartment</div></td>
    <td width="73" valign="top">&nbsp;</td>
    <td width="8" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield102" />
      <br />
      City</div></td>
    <td valign="top"><div align="center">
      <select name="select9">
        <option value="IL">IL</option>
      </select>
      <br />
      State</div></td>
    <td valign="top"><div align="center">
      <select name="select4">
        <option value="60120">60120</option>
        <option value="60123">60123</option>
        <option value="60177">60177</option>
      </select>
      <br />
      ZIP </div></td>
    <td colspan="2" valign="top"><div align="center">
      <input type="text" name="textfield112" />
      <br />
      County</div></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Phone:</strong></div></td>
    <td colspan="2" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
            <input name="textfield5442" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
            <input name="textfield5542" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
            <input name="textfield5642" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top">&nbsp;</td>
    <td colspan="2" valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
<p>Is the student's bus pickup location <strong>DIFFERENT</strong> than the primary  address? 
<input name="" type="checkbox" value="" onclick="document.getElementById('bus').style.display='block';"/></p>
<table width="675" border="0" cellspacing="0" cellpadding="3" id="bus">
  <tr>
    <td colspan="7"><strong>Bus Address  Information </strong></td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Name:</strong></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield4222" />
      <span class="style1"><br />
        Last</span></div></td>
    <td colspan="2" valign="top"><div align="center">
      <input type="text" name="textfield23222" />
      <br />
      <span class="style1">First</span></div></td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="111" valign="top"><div align="right"><strong>Address:</strong></div></td>
    <td width="162" valign="top"><div align="center">
      <input type="text" name="textfield622" />
      <br />
      Street/Fire#</div></td>
    <td width="35" valign="top"><div align="center">
      <input name="textfield722" type="text" size="2" />
      DIR</div></td>
    <td width="162" valign="top"><div align="center">
      <input type="text" name="textfield822" />
      <br />
      Street Name </div></td>
    <td width="82" valign="top"><div align="center">
      <input name="textfield922" type="text" size="5" />
      <br />
      Apartment</div></td>
    <td width="73" valign="top">&nbsp;</td>
    <td width="8" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"></div></td>
    <td valign="top"><div align="center">
      <input type="text" name="textfield1022" />
      <br />
      City</div></td>
    <td valign="top"><div align="center">
      <select name="select8">
        <option value="IL">IL</option>
      </select>
      <br />
      State</div></td>
    <td valign="top"><div align="center">
      <select name="select5">
        <option value="60120">60120</option>
        <option value="60123">60123</option>
        <option value="60177">60177</option>
      </select>
      <br />
      ZIP </div></td>
    <td colspan="2" valign="top"><div align="center">
      <input type="text" name="textfield1122" />
      <br />
      County</div></td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><div align="right"><strong>Phone:</strong></div></td>
    <td colspan="2" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><div align="center">
          <input name="textfield54422" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>:</strong></td>
        <td><div align="center">
          <input name="textfield55422" type="text" size="2" maxlength="3" />
        </div></td>
        <td><strong>-</strong></td>
        <td><div align="center">
          <input name="textfield56422" type="text" size="3" maxlength="4" />
        </div></td>
      </tr>
      <tr>
        <td><div align="center" class="style1">Area Code </div></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td valign="top">&nbsp;</td>
    <td colspan="2" valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
<!---
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="8" align="left" valign="top"><strong>Bus Info </strong></td>
  </tr>
  <tr>
    <td align="left" valign="top">Program:</td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    regular</td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    bilingual</td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    academy</td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    gifted</td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    am kinder </td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    pm kinder </td>
    <td align="left" valign="top"><input name="radiobutton" type="radio" value="radiobutton" />
    alt ed </td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="8" align="left" valign="top"><div align="center">
        <input name="radiobutton" type="radio" value="radiobutton" />
    New Student&nbsp;&nbsp;&nbsp; 
      <input name="radiobutton" type="radio" value="radiobutton" />
    Stop Change &nbsp;&nbsp;&nbsp;
    <input name="radiobutton" type="radio" value="radiobutton" />
    Change of Address &nbsp;&nbsp;&nbsp; 
    <input name="radiobutton" type="radio" value="radiobutton" />
    Cancel Bus </div></td>
  </tr>
  <tr>
    <td colspan="2" align="left" valign="top">BUS COMMENTS </td>
    <td colspan="6" align="left" valign="top"><textarea name="textarea2"></textarea></td>
  </tr>
</table>
<br />&nbsp;<br />
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="4" align="left"><strong>NAMES OF CHILDREN IN YOUR HOUSEHOLD ATTENDING DISTRICT U-46 SCHOOLS </strong></td>
  </tr>
  <tr>
    <td width="45" align="left" valign="top">NAME</td>
    <td width="199" align="left" valign="top"><input name="textfield164" type="text" /></td>
    <td width="85" align="left" valign="top">BIRTHDATE</td>
    <td width="318" align="left" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><input name="textfield35" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield323" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield333" type="text" size="2" maxlength="4" /></td>
      </tr>
      <tr>
        <td><span class="style1">MM</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">DD</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">YYYY</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="4" align="left" valign="top">ATTENDING SCHOOL 
      <select name="select12">
        <option>Bartlett Elementary</option>
      </select>
    </td>
  </tr>
  <tr>
    <td colspan="4" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="top">NAME</td>
    <td align="left" valign="top"><input name="textfield166" type="text" /></td>
    <td align="left" valign="top">BIRTHDATE</td>
    <td align="left" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><input name="textfield36" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield324" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield334" type="text" size="2" maxlength="4" /></td>
      </tr>
      <tr>
        <td><span class="style1">MM</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">DD</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">YYYY</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="4" align="left" valign="top">ATTENDING SCHOOL 
      <select name="select13">
        <option>Bartlett Elementary</option>
      </select></td>
  </tr>
</table>
<br />&nbsp;<br />--->
<table width="675" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="6" align="left"><strong>NEW OR Returning STUDENT </strong></td>
  </tr>
  <tr>
    <td colspan="6" align="left" valign="top">LAST SCHOOL ATTENDED
      <input name="textfield17" type="text" size="60" /></td>
  </tr>
  <tr>
    <td width="122" align="left" valign="top">DATE STARTED</td>
    <td width="161" align="left" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><input name="textfield34" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield322" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield332" type="text" size="2" maxlength="4" /></td>
      </tr>
      <tr>
        <td><span class="style1">MM</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">DD</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">YYYY</span></td>
      </tr>
    </table></td>
    <td width="126" align="left" valign="top"><div align="right">DATE LEFT</div></td>
    <td colspan="3" align="left"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><input name="textfield342" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield3222" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield3322" type="text" size="2" maxlength="4" /></td>
      </tr>
      <tr>
        <td><span class="style1">MM</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">DD</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">YYYY</span></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left">STREET NUMBER      </td>
    <td align="left"><input name="textfield16" type="text" /></td>
    <td align="left"><div align="right">STREET NAME</div></td>
    <td colspan="3" align="left"><input name="textfield163" type="text" size="35" /></td>
  </tr>
  <tr>
    <td>CITY</td>
    <td align="left"><input type="text" name="textfield162" /></td>
    <td><div align="right">STATE</div></td>
    <td width="100"><div align="left">
      <select name="select11">
        <option value="IL">IL</option>
      </select>
    </div></td>
    <td width="24"><div align="right">ZIP</div></td>
    <td width="102"><div align="left">
      <input name="textfield165" type="text" size="3" />
    </div></td>
  </tr>
  <tr>
    <td align="left" valign="top">COUNTRY</td>
    <td align="left" valign="top"><input type="text" name="textfield1622" /></td>
    <td align="left" valign="top">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" align="left" valign="top">HAS STUDENT EVER ATTENDED A U-46 SCHOOL?
      <input name="" type="radio" value="" />
      Yes&nbsp;
      <input name="" type="radio" value="" />
      No</td>
    <td colspan="2" align="right" valign="top">LAST DATE ATTENDED</td>
    <td align="left" valign="top"><table border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td><input name="textfield3422" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield32222" type="text" size="1" maxlength="2" /></td>
        <td>-</td>
        <td><input name="textfield33222" type="text" size="2" maxlength="4" /></td>
      </tr>
      <tr>
        <td><span class="style1">MM</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">DD</span></td>
        <td>&nbsp;</td>
        <td><span class="style1">YYYY</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</FORM>
</body>
</html>
