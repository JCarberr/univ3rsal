<cfapplication name="universalApplicationsAdmin" sessionmanagement="yes" sessiontimeout="#createTimeSpan(0,1,0,0)#">

<cfparam name="session.loggedIn" default="FALSE">
<!--- 
<cfif not session.loggedIn AND left(cgi.PATH_INFO,6) neq "/login">
	<cflocation url="/login">
</cfif>
 --->