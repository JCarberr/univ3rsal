<cfinclude template="/includes/header.cfm">
	<h1>Job Application Submitted</h1>
	Your job application has been submitted for review. <br>
	<br>
	<form name="frmWhereToNext" method="post" action="whereToNextAction.cfm">
		<input type="submit" name="btnEdit" id="btnEdit" value="Edit Application">
		<input type="submit" name="btnWebsite" id="btnEdit" value="Go to Website">
	</form>
<cfinclude template="/includes/footer.cfm">