<cfquery name="qGetApplicationStatusLookup" datasource="universal">
SELECT *
FROM tblApplicationStatusLookup
ORDER BY sortOrder ASC 
</cfquery>
<cfinclude template="/includes/header.cfm">
	<h1>Application Status List</h1>
	<table border="1" cellpadding="3">
		<tr>
			<td>applicationStatusKey</td>
			<td>applicationStatus</td>
			<td>sortOrder</td>
		</tr>
		<cfoutput query="qGetApplicationStatusLookup">
			<tr>
				<td>#qGetApplicationStatusLookup.applicationStatusKey#</td>
				<td>#qGetApplicationStatusLookup.applicationStatus#</td>
				<td>#qGetApplicationStatusLookup.sortOrder#</td>
			</tr>
		</cfoutput>
	</table>
<cfinclude template="/includes/footer.cfm">