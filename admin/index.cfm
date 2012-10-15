<cfquery name="qGetApplicationStatusLookup" datasource="universal">
	SELECT 
		tblApplicationStatusLookup.applicationStatusKey
		,tblApplicationStatusLookup.applicationStatus
	FROM 
		tblApplicationStatusLookup
	ORDER BY 
		tblApplicationStatusLookup.sortOrder ASC 
</cfquery>

<cfinclude template="/includes/header.cfm">
	<cfoutput>
		<h1>Admin Menu</h1>
		<ul>
			<li><a href="admins.cfm" class="headerTextLink">Admin logins</a></li>
			<li><a href="applicationStatusList.cfm" class="headerTextLink">Application Status List</a></li>
			<li>Applications
				<ul>
					<cfloop query="qGetApplicationStatusLookup">
						<cfquery name="qGetApplicationCount" datasource="universal">
							SELECT
								count(*) as itemCount
							FROM 
								tblJobApplications
							WHERE
								applicationStatusKey = #val(qGetApplicationStatusLookup.applicationStatusKey)#
						</cfquery>
						<li><a href="jobApplications.cfm?applicationStatusKey=#qGetApplicationStatusLookup.applicationStatusKey#" class="headerTextLink">#qGetApplicationStatusLookup.applicationStatus# - (#qGetApplicationCount.itemCount#)</a></li>
					</cfloop>
				</ul>
			</li>
		</ul>
	</cfoutput>
<cfinclude template="/includes/footer.cfm">