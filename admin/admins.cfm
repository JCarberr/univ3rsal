<cfquery name="qGetLoginsAdmins" datasource="universal">
	SELECT 
		*
	FROM 
		tblLoginsAdmins 
	ORDER BY 
		login
</cfquery>
<cfinclude template="/includes/header.cfm">
	<h1>Admins</h1>
	<table border="1" cellpadding="3">
		<tr>
			<th>loginAdminKey</th>
			<th>login</th>
			<th>password</th>
			<th>created</th>
			<th>createdBy</th>
			<th>notify</th>
		</tr>
		<cfoutput query="qGetLoginsAdmins">
			<tr>
				<td>#qGetLoginsAdmins.loginAdminKey#</td>
				<td>#qGetLoginsAdmins.login#</td>
				<td>#qGetLoginsAdmins.password#</td>
				<td>#dateFormat(qGetLoginsAdmins.dateTimeCreated)#</td>
				<td>#qGetLoginsAdmins.createdBy#</td>
				<td>#yesNoFormat(qGetLoginsAdmins.notify)#</td>
			</tr>
		</cfoutput>
	</table>
<cfinclude template="/includes/footer.cfm">