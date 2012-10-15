<cfif not isDefined("form.firstName")>
	<cflocation url="/">
</cfif>

<cfset session.jobApplicationForm = duplicate(form)>

<cfquery name="qGetJobApplications" datasource="universal">
	SELECT
		*
	FROM
		tblJobApplications
	WHERE
		loginApplicantKey = #val(session.loginApplicantKey)#
</cfquery>

<cfif qGetJobApplications.recordCount gt 0>
	<!--- update existing job application --->
	<cfquery name="qUpdateJobApplication" datasource="universal">
		UPDATE 
			tblJobApplications
		SET
			firstName = '#form.firstName#'
			,lastName = '#form.lastName#'
			,socialSecurityNumber = '#form.socialSecurityNumber#'
			,homeAddress1 = '#form.homeAddress1#'
			,homeAddressCity = '#form.homeAddressCity#'
			,homeAddressState = '#form.homeAddressState#'
			,homeAddressZip = '#form.homeAddressZip#'
			,homePhone = '#form.homePhone#'
			,email = '#form.email#'
		WHERE
			tblJobApplications.loginApplicantKey = #val(session.loginApplicantKey)#
	</cfquery>
<cfelse>
	<!--- create new job application --->
	<cfquery name="qInsertJobApplication" datasource="universal">
		INSERT INTO tblJobApplications
			(
				loginApplicantKey
				,firstName
				,lastName
				,socialSecurityNumber
				,homeAddress1
				,homeAddressCity
				,homeAddressState
				,homeAddressZip
				,homePhone
				,email
				,applicationStatusKey
			)
		VALUES
			(
				#val(session.loginApplicantKey)#
				,'#form.firstName#'
				,'#form.lastName#'
				,'#form.socialSecurityNumber#'
				,'#form.homeAddress1#'
				,'#form.homeAddressCity#'
				,'#form.homeAddressState#'
				,'#form.homeAddressZip#'
				,'#form.homePhone#'
				,'#form.email#'
				,1
			)
	</cfquery>
</cfif>

<cflocation url="/jobApplicationComplete.cfm">