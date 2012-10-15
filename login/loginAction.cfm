<cfif not isDefined("form.email")>
	<cflocation url="/login">
</cfif>

<cfquery name="qGetLoginsApplicants" datasource="universal">
	SELECT
		*
	FROM 
		tblLoginsApplicants
	WHERE
		login = '#form.email#'
		AND password = '#hash(form.password,"SHA-256")#'
</cfquery>

<cfif qGetLoginsApplicants.recordCount is 0>
	<cfset session.badLoginAttempt = 1>
	<cflocation url="/login">
<cfelse>
	<cfset session.loggedIn = "TRUE">
	<cfset session.applicant = qGetLoginsApplicants>
	<cfset session.loginApplicantKey = qGetLoginsApplicants.loginApplicantKey>
	<cfquery name="qGetJobApplications" datasource="universal">
		SELECT
			*
		FROM
			tblJobApplications
		WHERE
			loginApplicantKey = #val(qGetLoginsApplicants.loginApplicantKey)#
	</cfquery>
	<cfif qGetJobApplications.recordCount gt 0>
		<cfset session.jobApplicationForm = qGetJobApplications>
	</cfif>
	<cflocation url="/">
</cfif>