<cfquery name="qDeleteLoginsAdmins" datasource="universal">
	DELETE FROM
		tblLoginsAdmins
	WHERE
		login = 'supervisor'
</cfquery>
<cfquery name="qInsertLoginsAdmins" datasource="universal">
	INSERT INTO tblLoginsAdmins
		(
			login
			,password
			,dateTimeCreated
			,createdBy
		)
	VALUES
		(
			'supervisor'
			,'#hash("password","SHA-256")#'
			,#createOdbcDateTime(now())#
			,1
		)
</cfquery>
<h1>Supervisor Initialized</h1>