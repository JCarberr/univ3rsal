<cfapplication name="universalApplications" sessionmanagement="yes" sessiontimeout="#createTimeSpan(0,1,0,0)#">

<cfparam name="session.loggedIn" default="FALSE">
<cfparam name="session.loginApplicantKey" default="-1">
<!--- <cfdump var="#cgi#"><cfabort> --->
<cfif not session.loggedIn AND left(cgi.PATH_INFO,6) neq "/login">
	<cflocation url="/login">
</cfif>