<cfparam name="PageNum_qGetJobApplications" default="1">
<cfquery name="qGetJobApplications" datasource="universal">
	SELECT 
		tblJobApplications.applicationKey
		, tblJobApplications.firstName
		, tblJobApplications.lastName
		, tblJobApplications.homeAddressCity
		, tblJobApplications.homeAddressState
		, tblJobApplications.lastUpdatedDateTime
	FROM 
		tblJobApplications
	WHERE
		applicationStatusKey = #val(url.applicationStatusKey)#
	ORDER BY 
		lastName ASC 
</cfquery>
<cfset MaxRows_qGetJobApplications=100>
<cfset StartRow_qGetJobApplications=Min((PageNum_qGetJobApplications-1)*MaxRows_qGetJobApplications+1,Max(qGetJobApplications.RecordCount,1))>
<cfset EndRow_qGetJobApplications=Min(StartRow_qGetJobApplications+MaxRows_qGetJobApplications-1,qGetJobApplications.RecordCount)>
<cfset TotalPages_qGetJobApplications=Ceiling(qGetJobApplications.RecordCount/MaxRows_qGetJobApplications)>
<cfinclude template="/includes/header.cfm">
	<h1>Job Applications</h1>
	<table border="1" cellpadding="3">
		<tr>
			<td>applicationKey</td>
			<td>firstName</td>
			<td>lastName</td>
			<td>homeAddressCity</td>
			<td>homeAddressState</td>
			<td>lastUpdatedDateTime</td>
		</tr>
		<cfoutput query="qGetJobApplications" startRow="#StartRow_qGetJobApplications#" maxRows="#MaxRows_qGetJobApplications#">
			<tr>
				<td>#qGetJobApplications.applicationKey#</td>
				<td>#qGetJobApplications.firstName#</td>
				<td>#qGetJobApplications.lastName#</td>
				<td>#qGetJobApplications.homeAddressCity#</td>
				<td>#qGetJobApplications.homeAddressState#</td>
				<td>#qGetJobApplications.lastUpdatedDateTime#</td>
			</tr>
		</cfoutput>
	</table>
<cfinclude template="/includes/footer.cfm">