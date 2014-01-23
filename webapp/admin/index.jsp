<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Include the Blackboard Tag Library -->
<%@ taglib prefix="bbNG" uri="/bbNG"%>

<!-- 
Building block pages should be enclosed in one of the Blackboard provided page
tags. In this example, we used bbNG:genericPage, which lets the page to rendered
with nothing wrapping around it. Other page tags are available such as
bbNG:learningSystemPage (will render the page with course menus, etc) and
bbNG:includedPage (for pages that needs to be jsp-included to another page).

The ctxId params provides access  to a Blackboard Context object where
information about the current request being served can be retrieved. In this
example, we gave it a short 'ctx' name, but the default name is 'bbContext'.
-->
<bbNG:genericPage ctxId="ctx" >

<bbNG:pageHeader instructions="Customize this page by editing webapp/admin/index.jsp"> <!-- CHANGEME -->
	<bbNG:pageTitleBar >Example Template Title</bbNG:pageTitleBar> <!-- CHANGEME -->
</bbNG:pageHeader>

<link href="${ctx.request.contextPath}/styles/style.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
var b2path = "${ctx.request.contextPath}"; // sort of a hacky way to get the b2's url for use by Angular so we don't have to hard code it
</script>
<script src="${ctx.request.contextPath}/bower_components/angular/angular.js"></script>
<script src="${ctx.request.contextPath}/bower_components/angular-resource/angular-resource.js"></script>
<script src="${ctx.request.contextPath}/scripts/app.js"></script>

<!-- AngularJS needs a wrapping ng-app element. We give it a class too to make it easy to isolate this building block's CSS. -->
<div class="TemplateApp" ng-app="templateApp">
	<!-- Only a simple single controller app that, given a username, retrieves some
	basic info about the user. Will initially load the current logged in user's info. -->
	<div ng-controller="AdminCtrl">
		<h3>Find User Information</h3>
		<!-- A form to set the username to look for. -->
		<!-- ng-submit should prevent the default submit action, but doesn't seem to work here, so we set onsubmit for that. -->
		<form ng-submit="submit()" onsubmit="return false;">
			<label>Username:
				<input type="text" ng-model="username" ng-disabled="duringInit" /> <!-- The username we retrieve info for. -->
			 </label>
			<input id="submit" value="Find" type="submit"/>
			<!-- This should only show during the initial page load, and only if the server side is slow for some reason. -->
			<span class="processing" ng-show="duringInit">Initializing...</span>
			<!-- Status messages to give some indication of what the find operation is doing. -->
			<span class="processing" ng-show='submitMsg == "processing"'>Looking...</span>
			<span class="success" ng-show="submitMsg == 'success'">User Found!</span>
			<span class="error" ng-show="submitMsg == 'notfound'">User Not Found!</span>
			<span class="error" ng-show="submitMsg == 'servererror'">Failed due to Server Error</span>
		</form>
		<!-- Displays the retrieved user information. -->
		<h4>User Information</h4>
		<dl>
			<dt>Username</dt><dd>{{info.username}}</dd>
			<dt>ID</dt><dd>{{info.id}}</dd>
			<dt>Name</dt><dd>{{info.name}}</dd>
			<dt>Email</dt><dd>{{info.email}}</dd>
			<dt>Student ID</dt><dd>{{info.studentid}}</dd>
		</dl>
	</div>
</div>

</bbNG:genericPage>