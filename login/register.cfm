<cfset variables.questions = [
		"What is your favorite car?"
		,"What is your favorite color?"
		,"What city were you born in?"
		,"What is your mother's maiden name?"
		,"What is your pet's name?"
	]
>
<!--- <cfdump var="#variables#"><cfabort> --->
<cfset variables.email = "">
<cfset variables.recoverQuestion = "">
<cfset variables.recoverAnswer = "">
<cfif isDefined("session.registerForm")>
	<cfset variables.email = session.registerForm.email>
	<cfset variables.recoverQuestion = session.registerForm.recoverQuestion>
	<cfset variables.recoverAnswer = session.registerForm.recoverAnswer>
</cfif>

<cfinclude template="/includes/header.cfm">
	<h1>Register To Apply</h1>
	
	<cfif isDefined("session.registerErrorMessage") AND len(session.registerErrorMessage)>
		<div class="error">
			<h2>Error</h2>
			Please correct the following issues in order to register:<br>
			<blockquote>
				<cfoutput>#session.registerErrorMessage#</cfoutput>
			</blockquote>
		</div>
	</cfif>
	
	<cfform name="frmRegister" method="post" action="registerAction.cfm">
		Please complete the form below to create an account on Universal Steel America to apply for jobs online.	<br>
		<br>
		<table width="400" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td width="135">
					Your e-mail Address<br>
					<em style="font-size:10px;">(This will be your login for this website)</em>
				</td>
				<td width="253">
					<cfinput type="text" name="email" message="Please enter your E-MAIL ADDRESS.\n     (i.e. yourName@company.com)" required="yes" class="inputText" id="email" style="width:200px;" maxlength="100" value="#variables.email#" validate="email">
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><cfinput type="password" name="password" message="Please enter your PASSWORD." required="yes" class="inputText" id="password" style="width:200px;" maxlength="20"></td>
			</tr>
			<tr>
				<td>Verify Password</td>
				<td><cfinput type="password" name="passwordVerify" message="Please VERIFY your PASSWORD." required="yes" class="inputText" id="passwordVerify" style="width:200px;" maxlength="20"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">Please select a question, which will be used as a backup method to access your account if your password is forgotten:</td>
				</tr>
			<tr>
				<td>Select Question</td>
				<td>
					<select name="recoverQuestion" id="recoverQuestion">
						<cfloop array="#variables.questions#" index="variables.currentQuestion">
							<cfoutput><option value="#variables.currentQuestion#"<cfif variables.currentQuestion is variables.recoverQuestion> selected</cfif>>#variables.currentQuestion#</option></cfoutput>
						</cfloop>
						<!--- <option value="What is your favorite color?">What is your favorite color?</option>
						<option value="What city were you born in?">What city were you born in?</option>
						<option value="What is your mother's maiden name?">What is your mother's maiden name?</option>
						<option value="What is your pet's name?">What is your pet's name?</option> --->
					</select>
				</td>
			</tr>
			<tr>
				<td>Answer</td>
				<td><cfinput type="text" name="recoverAnswer" message="Please enter your ANSWER to the backup question." required="yes" class="inputText" id="recoverAnswer" style="width:200px;" maxlength="50" value="#variables.recoverAnswer#"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="btnLogin" id="btnLogin" value="Register &gt;"></td>
			</tr>
		</table>
	</cfform>
<cfinclude template="/includes/footer.cfm">