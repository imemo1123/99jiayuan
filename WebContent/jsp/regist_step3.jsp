<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ include file="head.jsp" %>
<%
String rst = (String)request.getAttribute("rst");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>久久佳缘</title>
    <meta charset="utf-8">
    <link href="<%=basePath %>css/kendo.common.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.default.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.dataviz.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.dataviz.default.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.mobile.all.min.css" rel="stylesheet" />
    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script src="<%=basePath %>js/angular.min.js"></script>
    <script src="<%=basePath %>js/kendo.all.min.js"></script>
</head>
<body>
<div data-role="layout" data-id="mobile-tabstrip">
 	<header data-role="header">
		<div data-role="navbar">
			<a class="nav-button" data-align="left" data-role="backbutton"></a> 
			<span data-role="view-title">注册</span>
		</div>
	</header>
</div>
<div id="forms" data-role="view"   data-layout="mobile-tabstrip" data-init="initForm" >
<%if("true".equals(rst)){ %> 
	 <div align="center">
             <span style="font-size:32px;text-align:center;line-height:5;margin:0 auto">注册成功！</span>
       </div>
<%}else{ %>
       <div align="center">
             <span style="font-size:32px;text-align:center;line-height:5;margin:0 auto">注册失败！</span>
       </div>
<%} %>
             <i></i> <a data-role="button" class="km-justified" data-click="gotoLogin">完成</a>
        
</div>
<script type="text/javascript">
function gotoLogin(){
	location.href="login.jsp";
}
</script>
<style>
.km-justified{
	display: block;
    width: 95%;
}
</style>
<script>
window.kendoMobileApplication = new kendo.mobile.Application(document.body);
</script>
    
</body>
</html>