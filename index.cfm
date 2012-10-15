<cfquery name="qGetStates" datasource="universal">
	SELECT 
		*
	FROM 
		tblStates
	ORDER BY 
		"state" ASC 
</cfquery>

<cfset variables.firstName = "">
<cfset variables.lastName = "">
<cfset variables.socialSecurityNumber = "">
<cfset variables.homeAddress1 = "">
<cfset variables.homeAddressCity = "">
<cfset variables.homeAddressState = "">
<cfset variables.homeAddressZip = "">
<cfset variables.homePhone = "">
<cfset variables.email = "">

<cfif isDefined("session.jobApplicationForm")>
	<cfset variables.firstName = session.jobApplicationForm.firstName>
	<cfset variables.lastName = session.jobApplicationForm.lastName>
	<cfset variables.socialSecurityNumber = session.jobApplicationForm.socialSecurityNumber>
	<cfset variables.homeAddress1 = session.jobApplicationForm.homeAddress1>
	<cfset variables.homeAddressCity = session.jobApplicationForm.homeAddressCity>
	<cfset variables.homeAddressState = session.jobApplicationForm.homeAddressState>
	<cfset variables.homeAddressZip = session.jobApplicationForm.homeAddressZip>
	<cfset variables.homePhone = session.jobApplicationForm.homePhone>
	<cfset variables.email = session.jobApplicationForm.email>
</cfif>

<cfinclude template="/includes/header.cfm">
<cfoutput>
	<h1>Online Employment Application</h1>
	<cfform name="frmJobApplication" method="post" action="jobApplicationAction.cfm">
		<table width="910" border="0" cellspacing="0" cellpadding="3" style="border:1px ##676767 solid;">
			<tr>
				<td width="134"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="172"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="94"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="173"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="100"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="201"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
			</tr>
			<tr>
				<td class="labelRight">First Name</td>
				<td>
					<cfinput type="text" name="firstName" message="Please enter your FIRST NAME." required="yes" class="inputText" id="firstName" maxlength="100" value="#variables.firstName#">
				</td>
				<td class="labelRight">Last Name</td>
				<td><cfinput type="text" name="lastName" required="yes" class="inputText" id="lastName" maxlength="100" message="Please enter your LAST NAME." value="#variables.lastName#"></td>
				<td class="labelRight">Social Security ##</td>
				<td><cfinput type="text" name="socialSecurityNumber" validate="social_security_number" required="yes" class="inputText" id="socialSecurityNumber" maxlength="20" message="Please enter your SOCIAL SECURITY ##\n     with dashes (i.e. 123-45-6789)." value="#variables.socialSecurityNumber#"></td>
			</tr>
			<tr>
				<td class="labelRight">Address</td>
				<td><cfinput type="text" name="homeAddress1" required="yes" class="inputText" id="homeAddress1" maxlength="100" message="Please enter your ADDRESS." value="#variables.homeAddress1#"></td>
				<td class="labelRight">City</td>
				<td><cfinput name="homeAddressCity" type="text" class="inputText" id="homeAddressCity" maxlength="100" required="yes" message="Please enter your CITY." value="#variables.homeAddressCity#"></td>
				<td class="labelRight">State</td>
				<td>
					<select name="homeAddressState" id="homeAddressState" class="inputText">
						<option value="" selected></option>
						<cfloop query="qGetStates">
							<option value="#qGetStates.state#"<cfif qGetStates.state is variables.homeAddressState> selected</cfif>>#qGetStates.state# - #qGetStates.description#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td class="labelRight">Zip</td>
				<td><cfinput type="text" name="homeAddressZip" required="yes" class="inputText" id="homeAddressZip" maxlength="50" message="Please enter your ZIP code." value="#variables.homeAddressZip#"></td>
				<td class="labelRight">Phone</td>
				<td><cfinput name="homePhone" type="text" class="inputText" id="homePhone" maxlength="50" message="Please enter your PHONE." value="#variables.homePhone#"></td>
				<td class="labelRight">e-mail</td> 
				<td><cfinput type="text" name="email" validate="email" required="yes" class="inputText" id="email" maxlength="50" message="Please enter your E-MAIL address\n     (i.e. yourName@company.com)." value="#variables.email#"></td>
			</tr>
			<tr>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
			</tr>
		</table>

		<table width="910" border="0" cellspacing="0" cellpadding="3" style="margin-top:7px; margin-bottom:7px;">
			<tr>
				<td width="120">Emergency Name</td>
				<td width="156"><input name="emergencyName" type="text" class="inputText" id="emergencyName" maxlength="100"></td>
				<td width="80" class="labelRight">Relationship</td>
				<td width="156"><input name="emergencyRelationship" type="text" class="inputText" id="emergencyRelationship" maxlength="100"></td>
				<td width="70" class="labelRight">Phone</td>
				<td width="156"><input name="emergencyPhone" type="text" class="inputText" id="emergencyPhone" maxlength="50"></td>
				<td width="52">&nbsp;</td>
				<td width="120">&nbsp;</td>
			</tr>
			<tr>
				<td>Branch of Service</td>
				<td><input name="serviceBranch" type="text" class="inputText" id="serviceBranch" maxlength="100"></td>
				<td class="labelRight">Rank</td>
				<td><input name="serviceRank" type="text" class="inputText" id="serviceRank" maxlength="100"></td>
				<td class="labelRight">Date From</td>
				<td><cfinput type="datefield" name="serviceDateFrom" style="width:90px; color:##000000"></td>
				<td class="labelRight">Date To</td>
				<td><cfinput type="datefield" name="serviceDateTo" style="width:90px; color:##000000"></td>
			</tr>
			<tr>
				<td colspan="8" class="borderTop">Do you have a High School Diploma?
					<input type="radio" name="highSchoolDiploma" id="highSchoolDiplomaYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="highSchoolDiploma" id="highSchoolDiplomaNo" value="0">
					No
				</td>
			</tr>
			<tr>
				<td>College or Trade School</td>
				<td><input name="collegeTradeSchool" type="text" class="inputText" id="collegeTradeSchool" maxlength="255"></td>
				<td>Date From</td>
				<td><cfinput type="datefield" name="collegeTradeSchoolFrom" id="collegeTradeSchoolFrom" style="width:90px; color:##000000"></td>
				<td>Date To</td>
				<td><cfinput type="datefield" name="collegeTradeSchoolto" id="collegeTradeSchoolTo" style="width:90px; color:##000000"></td>
				<td>Graduate?</td>
				<td>
					<input type="radio" name="collegeTradeSchoolGraduate" id="collegeTradeSchoolGraduateYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="collegeTradeSchoolGraduate" id="collegeTradeSchoolGraduateNo" value="0">
					No
				</td>
			</tr>
			<tr>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
			</tr>
			<tr>
				<td class="borderTop">Start Date</td>
				<td class="borderTop"><cfinput type="datefield" name="startDate" style="width:90px; color:##000000"></td>
				<td class="borderTop">Salary Expected</td>
				<td class="borderTop"><input name="salaryExpected" type="text" class="inputText" id="salaryExpected" maxlength="50"></td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
				<td class="borderTop">&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>

		<table width="910" border="0" cellspacing="0" cellpadding="3" style="margin-top:7px; margin-bottom:7px;">
			<tr>
				<td width="244" class="labelRight">Employed Now?</td>
				<td width="96">
					<input type="radio" name="employedNow" id="employedNowYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="employedNow" id="employedNowNo" value="0">
					No
				</td>
				<td width="63" class="labelRight">&nbsp;</td>
				<td width="159">&nbsp;</td>
				<td width="50" class="labelRight">&nbsp;</td>
				<td width="262">&nbsp;</td>
			</tr>
			<tr>
				<td class="labelRight">May we inquire?</td>
				<td>
					<input type="radio" name="mayWeInquire" id="mayWeInquireYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="mayWeInquire" id="mayWeInquireNo" value="0">
					No
				</td>
				<td class="labelRight">&nbsp;</td>
				<td>&nbsp;</td>
				<td class="labelRight">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td class="labelRight">Ever Applied Before?</td>
				<td>
					<input type="radio" name="appliedBefore" id="appliedBeforeYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="appliedBefore" id="appliedBeforeNo" value="0">
					No
				</td>
				<td class="labelRight">Where?</td>
				<td><input name="appliedWhere" type="text" class="inputText" id="appliedWhere" maxlength="100"></td>
				<td class="labelRight">When?</td>
				<td><input type="text" name="textfield111" id="textfield111" class="inputText"></td>
			</tr>
			<tr>
				<td class="labelRight">Ever worked for us before?</td>
				<td>
					<input type="radio" name="workedForUsBefore" id="workedForUsBeforeYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="workedForUsBefore" id="workedForUsBeforeNo" value="0">
					No
				</td>
				<td class="labelRight">Where?</td>
				<td><input type="text" name="textfield13" id="textfield13" class="inputText"></td>
				<td class="labelRight">When?</td>
				<td><input type="text" name="textfield111" id="textfield111" class="inputText"></td>
			</tr>
			<tr>
				<td class="labelRight">Reason for Leaving</td>
				<td colspan="5"><input name="reasonForLeaving" type="text" class="inputText" id="reasonForLeaving" style="width:500px;" maxlength="500"></td>
				</tr>
			<tr>
				<td class="labelRight">&nbsp;</td>
				<td colspan="5">&nbsp;</td>
			</tr>
			<tr>
				<td class="labelRight">How did you hear about us?</td>
				<td colspan="5"><input name="howDidYouHearAboutUs" type="text" class="inputText" id="howDidYouHearAboutUs" style="width:500px;" maxlength="500"></td>
			</tr>
			<tr>
				<td class="labelRight">Ever been convicted of a felony?</td>
				<td colspan="5">
					<input type="radio" name="convictedOfFelony" id="convictedOfFelonyYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="convictedOfFelony" id="convictedOfFelonyNo" value="0">
					No
				</td>
			</tr>
			<tr>
				<td class="labelRight">Ever been convicted of a Misdemeanor?</td>
				<td colspan="5">
					<input type="radio" name="convictedOfMisdemeanor" id="convictedOfMisdemeanorYes" value="1">
					Yes&nbsp;&nbsp;&nbsp;
					<input type="radio" name="convictedOfMisdemeanor" id="convictedOfMisdemeanorNo" value="0">
					No
				</td>
			</tr>
		</table>

	
		<table width="910" border="0" cellspacing="0" cellpadding="3" style="border:1px ##676767 solid;">
			<tr>
				<td width="109"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="157"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="64"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="164"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="49"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="176"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="30"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td width="111"><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
			</tr>
			<tr>
				<td class="labelRight">Reference 1 Name</td>
				<td>
					<input name="reference1Name" type="text" class="inputText" id="reference1Name" maxlength="100">
				</td>
				<td class="labelRight">Address</td>
				<td><input name="reference1Address" type="text" class="inputText" id="reference1Address" maxlength="100"></td>
				<td class="labelRight">Phone</td>
				<td><input name="reference1Phone" type="text" class="inputText" id="reference1Phone" maxlength="50"></td>
				<td class="labelRight">Yrs</td>
				<td>
					<select name="reference1YearsKnown" id="reference1YearsKnown">
						<option value=""></option>
						<cfloop from="1" to="50" index="yearCounter">
							<option value="#yearCounter#">#yearCounter#</option>
						</cfloop>
						<option value="over 50">over 50</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="labelRight">Reference 2 Name</td>
				<td><input name="reference2Name" type="text" class="inputText" id="reference2Name" maxlength="100"></td>
				<td class="labelRight">Address</td>
				<td><input name="reference2Address" type="text" class="inputText" id="reference2Address" maxlength="100"></td>
				<td class="labelRight">Phone</td>
				<td><input name="reference2Phone" type="text" class="inputText" id="reference2Phone" maxlength="50"></td>
				<td class="labelRight">Yrs</td>
				<td>
					<select name="reference2YearsKnown" id="reference2YearsKnown">
						<option value=""></option>
						<cfloop from="1" to="50" index="yearCounter">
							<option value="#yearCounter#">#yearCounter#</option>
						</cfloop>
						<option value="over 50">over 50</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
				<td><img src="/skins/default/images/spacer.gif" width="1" height="4"></td>
			</tr>
		</table>
		<br>
		<input name="btnSave" type="submit" value="Submit Application">
	</cfform>
</cfoutput>
<cfinclude template="/includes/footer.cfm">