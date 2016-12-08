<cfoutput><table width="700" border="0" align="center" cellpadding="4" cellspacing="0" style="border: 1px solid black;">
<tr>
	<td colspan=2><strong>School Year:</strong>
		<cfif #getStudents.year# lt schoolyear>
			#getStudents.year#
		<cfelse>
			<select name="year">
				<OPTION VALUE="">--SCHOOL YEAR--</OPTION>
				<option value="#schoolyear#"<cfif #getStudents.year# eq #schoolyear#> selected</cfif>>#Evaluate(schoolyear-1)# - #schoolyear#</option>
				<option value="#Evaluate(schoolyear+1)#"<cfif #getStudents.year# EQ #Evaluate(schoolyear+1)#> selected</cfif>>#schoolyear# - #Evaluate(schoolyear+1)#</option>
			</select>
		</cfif>
	</td>
	<td colspan=2><strong>Enrollment School:</strong>
		<select name="enroll_scid">
			<OPTION VALUE="">--Enrollment School--</OPTION>
			<cfloop list="#session.allowedschools#" index="current_scid">
				<option value="#current_scid#"<cfif #trim(getStudents.enroll_scid)# eq #trim(current_scid)#> selected</cfif>><cfif StructKeyExists(session.schoolStruct, current_scid)>#session.schoolStruct[current_scid]#<cfelse>Elsewhere</cfif></option>
			</cfloop>
		</select>
	</td>
	<td colspan=2><strong>Fee:</strong>
		<select name="FEE_STATUS">
			<OPTION VALUE="">--Fee Status--</OPTION>
			<cfloop collection="#session.feeStruct#" item="fee_cd">
				<option value="#fee_cd#"<cfif #trim(getStudents.FEE_STATUS)# eq #trim(fee_cd)#> selected</cfif>><cfif StructKeyExists(session.feeStruct, fee_cd)>#session.feeStruct[fee_cd]#</cfif></option>
			</cfloop>
		</select>
	</td>
</tr>
	<td colspan="6" align="center" style="font-weight: bold; border-top: 1px solid black;">
		<input type="checkbox" name="DOB_conf" value="Y"<cfif #getStudents.DOB_conf# eq 'Y' or #getStudents.DOB_conf# eq '1'> checked</cfif><cfif #getStudents.approved# eq 'Y'> disabled</cfif>/>DOB Verified &nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="Address_conf" value="Y"<cfif #getStudents.Address_conf# eq 'Y' or #getStudents.Address_conf# eq '1'> checked</cfif><cfif #getStudents.approved# eq 'Y'> disabled</cfif>/>Address Verified&nbsp;&nbsp;
		<input type="checkbox" name="proofcust_conf" value="Y"<cfif #getStudents.proofcust_conf# eq 'Y' or #getStudents.proofcust_conf# eq '1'> checked</cfif><cfif #getStudents.approved# eq 'Y'> disabled</cfif>/>Proof of Custody Verified
	</td>
</tr>
<tr>
	<td colspan="6" style="background-color:##EBEBEB; border-top: 1px dashed black;"><div align="center">If you have reviewed the above information and everything is correct, click the submit button below. </div></td>
</tr>
<tr>
	<td colspan=6 style="font-weight: bold; border-top: 1px solid black;">Last modified by #getStudents.lastmodifiedby# on #getStudents.lastmodified_date#</td>
</tr>
</table>
</cfoutput>