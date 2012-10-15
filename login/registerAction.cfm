<cfif not isDefined("form.email")>
	<cflocation url="register.cfm">
</cfif>

<cfset session.registerForm = duplicate(form)>
<cfset session.registerErrorMessage = "">

<cfif form.password neq form.passwordVerify>
	<cfset session.registerErrorMessage = session.registerErrorMessage & "The PASSWORD you entered did not match the VERIFY PASSWORD. Please re-enter the PASSWORD and VERIFY PASSWORD.">
</cfif>

<cfif len(session.registerErrorMessage)>
	<cflocation url="register.cfm">
<cfelse>
	<cfset structDelete(session,"registerErrorMessage")>
</cfif>

<cftransaction>
	<cfquery name="qInsertLoginsApplicants" datasource="universal" result="variables.insertQueryResult">
		INSERT INTO tblLoginsApplicants
			(
				login
				,password
				,question
				,answer
				,dateTimeCreated
				,ipAddress
			)
		VALUES
			(
				'#trim(form.email)#'
				,'#hash(trim(password),"SHA-256")#'
				,'#form.recoverQuestion#'
				,'#trim(form.recoverAnswer)#'
				,#createOdbcDateTime(now())#
				,'#cgi.REMOTE_ADDR#'
			)
	</cfquery>
	<cfquery name="qGetLoginsApplicants" datasource="universal">
		SELECT TOP 1 
			*
		FROM
			tblLoginsApplicants
		WHERE
			login = '#trim(form.email)#'
		ORDER BY
			dateTimeCreated DESC
	</cfquery>
</cftransaction>
<cfset session.loginApplicantKey = qGetLoginsApplicants.loginApplicantKey>
<cfset structDelete(session,"registerForm")>
<cfset session.loggedIn = "TRUE">
<cflocation url="registerComplete.cfm">