<cfset structClear(session)>
<cfset session.loggedIn = "FALSE">
<cflocation url="/login">