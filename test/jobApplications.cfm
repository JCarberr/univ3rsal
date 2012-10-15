	<cfquery name="qGetJobApplications" datasource="universal">
		SELECT
			*
		FROM
			tblJobApplications
	</cfquery>
<cfdump var="#qGetJobApplications#" label="qGetJobApplications">