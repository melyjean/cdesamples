<cfoutput>
<div style="font-family: arial;">
<div class="row" style="text-transform: uppercase; text-align: center;">
<div id="right">Medical<br />
  Alert</div>
  <div id="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;</div>
School District U-46<br />
<span style="font-size: 14pt; font-weight: bold;">Emergency Card</span></div>
<div class="row"><div id="left"><label id="ENG"><strong>ID Number</strong></label> 
#getStudents.SID#</div>
<div id="right"><label id="ENG"><strong>Confirmation Number</strong></label>
</div>
</div>
<div class="row"><strong>Student Name:</strong> #getStudents.LNAME#, #getStudents.FNAME# <strong>Gender:</strong> #getStudents.GENDER# <strong>Grade: </strong>#getStudents.CURRENTGRADE#</div>
<div class="row"><strong>Date of Birth:</strong> #getStudents.BIRTHMONTH#/#getStudents.BIRTHDAY#/#getStudents.BIRTHYEAR# <strong>Previous School: </strong>#getStudents.LASTSCHOOL#</div>
<div class="row"><strong>Address:</strong>#getStudents.STREET# #getStudents.DIRECTION# #getStudents.STREETNAME# #getStudents.STREETSUFFIX# <strong>Apt. ##</strong> #getStudents.CNUM##getStudents.APARTMENT#  <strong>City:</strong> #getStudents.CITY# <strong>Zip:</strong> #getStudents.ZIP#</div>
<div class="row"><strong>Home Phone: </strong>(#getStudents.FAREA#) #getStudents.FPREFIX# - #getStudents.FSUFFIX# <strong>Preferred Language for mail:</strong> #getStudents.MAILLANGUAGE# </div>
<div class="row">Resides with: #getStudents.M_RESIDESWITH# #getStudents.F_RESIDESWITH#</div>
<table width="671" border="1" cellspacing="0" cellpadding="3" id="tableGrid">
  <tr>
    <td width="50%"><strong>Mother's Name</strong> #getStudents.MFNAME# #getStudents.MLNAME# </td>
    <td><strong>Father's Name</strong> #getStudents.FFNAME# #getStudents.FLNAME# </td>
  </tr>
  <tr>
    <td><strong>Mother's Work Phone</strong>  (#getStudents.MWORKAREA#) : #getStudents.MWORKPREFIX# - #getStudents.MWORKSUFFIX# </td>
    <td><strong>Father's Work Phone</strong> (#getStudents.FWORKAREA#) : #getStudents.FWORKPREFIX# - #getStudents.FWORKSUFFIX# </td>
  </tr>
  <tr>
    <td><strong>Mother's Work Place </strong>#getStudents.MWORKPLACE# </td>
    <td><strong>Father's Work Place</strong> #getStudents.FWORKPLACE# </td>
  </tr>
  <tr>
    <td><strong>Mother's Cell Phone</strong> (#getStudents.MCELLAREA#) : #getStudents.MCELLPREFIX# - #getStudents.MCELLSUFFIX# </td>
    <td><strong>Father's Cell Phone</strong> (#getStudents.FCELLAREA#) : #getStudents.FCELLPREFIX# - #getStudents.FCELLSUFFIX# </td>
  </tr>
  <tr>
    <td><strong>Mother's Email</strong> #getStudents.M_EMAIL# </td>
    <td><strong>Father's Email</strong> #getStudents.F_EMAIL# </td>
  </tr>
</table>
<div class="row">Emergency Phone Numbers: Relative/neighbor/friend who can pick up student at school, if parent cannot be reached. </div>
<div class="row" style="border: 1px solid black; margin-bottom: 3px;"><strong>1. Name:</strong> #getStudents.E1NAME# <strong>Relation:</strong> #getStudents.E1RELATION# <strong>Phone: </strong>(#getStudents.E1AREA#) #getStudents.E1PREFIX# - #getStudents.E1SUFFIX#</div>
<div class="row" style="border: 1px solid black;"><strong>2. Name:</strong> #getStudents.E2_NAME# <strong>Relation:</strong> #getStudents.E2RELATION# <strong>Phone:</strong> (#getStudents.E2AREA#) #getStudents.E2PREFIX# - #getStudents.E2SUFFIX#</div>
<div class="row"><strong>Auxiliary Information Name:</strong> #getStudents.AUXFNAME# #getStudents.AUXLNAME#<br />
  <strong>Address:</strong> #getStudents.AUXSTREET# #getStudents.AUXDIRECTION# #getStudents.AUXSTREETNAME# #getStudents.AUXSTREETSUFFIX# #getStudents.AUXAPARTMENT#<br />
#getStudents.AUXCITY#, #getStudents.AUXSTATE# #getStudents.AUXZIP# </div>
<div class="row"><strong>Health Concerns:</strong><br />
#getStudents.HEALTHCONCERNS#</div>
<div class="row"><strong>Does the student routinely take medications?</strong> #getStudents.MEDICATION# <strong>At Home? </strong>#getStudents.MEDS_HOME# <strong>At School* </strong>#getStudents.MEDS_SCHOOL#</div>
<div class="row"><span id="ENGs">*Specific requirements exist for medication taken at school. Refer to Handbook or call school for information.)</span></div>
<div class="row"><strong>Does the student wear glasses?</strong> #getStudents.GLASSES# <strong>Contact Lenses?</strong> #getStudents.CONTACTS# <strong>Hearing Aid?</strong> #getStudents.HEARINGAID#</div>
<div class="row"><strong>Is there other information about this student that would be useful for the school personnel to know?</strong><br />
#getStudents.HEALTHCOMMN#</div>
<div class="row">Principal, teachers, nurses, builing secretary, etc.) i.e., proof of order of protection</div>
<div class="row"><hr /></div>
<div class="row"><strong>I UNDERSTAND THAT IF EMERGENCY TRANSPORT TO THE HOSPITAL IS NECESSARY, IT WILL BE TO THE NEAREST HOSPITAL AND AT MY EXPENSE.</strong></div>
<div class="row">&nbsp;</div>
<div class="row">DATE _______________________ SIGNATURE ______________________________________________</div>
</div>
</div>
</cfoutput>

