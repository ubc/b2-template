<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Include the Blackboard Tag Library -->
<%@ taglib prefix="bbNG" uri="/bbNG"%>

<bbNG:genericPage ctxId="ctx" >

<bbNG:pageHeader instructions="Customize this page by editing webapp/admin/index.jsp"> <!-- CHANGEME -->
	<bbNG:pageTitleBar >Example Template Title</bbNG:pageTitleBar> <!-- CHANGEME -->
</bbNG:pageHeader>

<link href="${ctx.request.contextPath}/styles/style.css" type="text/css" rel="stylesheet" />

<script src="${ctx.request.contextPath}/bower_components/angular/angular.js"></script>
<script src="${ctx.request.contextPath}/bower_components/angular-resource/angular-resource.js"></script>
<script src="${ctx.request.contextPath}/scripts/app.js"></script>

<p>Hello World!</p>

</bbNG:genericPage>