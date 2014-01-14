<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bbNG" uri="/bbNG"%>


<bbNG:genericPage ctxId="ctx" >
	<bbNG:pageHeader instructions="Click the button to delete all data from the copyright alerts building block database.">
		<bbNG:breadcrumbBar>
			<bbNG:breadcrumb>Copyright Alerts Reset</bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar >Copyright Alerts Reset</bbNG:pageTitleBar>
	</bbNG:pageHeader>
	
	<p>${reset}</p>
	<a href="setting?reset=true">Reset Database</a>

</bbNG:genericPage>
