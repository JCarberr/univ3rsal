<cfinclude template="/includes/header.cfm">
	<h1>Job Applicant Login</h1>
	<cfif isDefined("session.badLoginAttempt") AND val(session.badLoginAttempt) is 1>
		<div class="error">
			<h2>Error</h2>
			The e-mail or password you provided did not match our records.<br>
			<br>
			PLEASE TRY AGAIN.
		</div>
		<cfset session.badLoginAttempt = 0>
	</cfif>
	<cfform name="form1" method="post" action="loginAction.cfm">
		REGISTERED USERS: Please login below or <a href="register.cfm" class="footerTextLink">REGISTER</a> to access your online job application.	<br>
		<br>
		<table width="400" border="0" cellspacing="0" cellpadding="3">
			<tr>
				<td width="135">Your e-mail Address</td>
				<td width="253">
					<cfinput type="text" name="email" message="Please enter your E-MAIL ADDRESS." required="yes" class="inputText" id="email" style="width:200px;" maxlength="100">
				</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><cfinput type="password" name="password" message="Please enter your PASSWORD." required="yes" class="inputText" id="password" style="width:200px;" maxlength="20"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="btnLogin" id="btnLogin" value="Login &gt;"></td>
			</tr>
		</table>
	</cfform>
	
	<h1>Register To Apply</h1>
	<form name="frmRegister" method="post" action="register.cfm">
		You must <a href="register.cfm" class="footerTextLink">REGISTER</a> to apply! <br>
		<br>
		<input type="submit" name="btnRegister" id="btnRegister" value="Register To Apply &gt;">
	</form>
<cfinclude template="/includes/footer.cfm">