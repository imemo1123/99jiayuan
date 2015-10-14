<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map;"%>
<%@ include file="head.jsp" %>
<%
String type = (String)request.getParameter("type");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>久久佳缘</title>
    <meta charset="utf-8">
    <link href="<%=basePath %>css/kendo.mobile.nova.min.css" rel="stylesheet" />
    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script src="<%=basePath %>js/angular.min.js"></script>
    <script src="<%=basePath %>js/kendo.all.min.js"></script>
    <script src="<%=basePath %>js/myjs.js"></script>
</head>
<body>
    <div data-role="view" id="tabstrip-profile" data-title="订单详情" data-layout="mobile-tabstrip"  data-init="initData" >
    	<ul  data-role="listview"  data-style="inset">
	                 <li><img src="<%=basePath %>images/vip1.png"  class="km-thumbnail" style="width: 10em; height: 10em; margin: 2em auto; display: block; float: none;"/></li>
	                <li>所选商品 <span class="sales-up">久久佳缘普通会员</span></li>
	                <li>价格 <span class="text-important">￥1999.00</span></li>
	                <li>支付方式 <span class="sales-up"><img src="<%=basePath %>images/wechat-logo.png" style="border:2px solid #ff4350"/></span></li>
	     </ul>
	     <div class="buttonArea">
	     		<a data-role="button"  data-transition="overlay:up reverse" class="km-large km-primary km-justified transitions-button" data-click="submitData">付   款</a>
	     </div>
	</div>
	<div data-role="layout" data-id="mobile-tabstrip">
	    <header data-role="header">
	        <div data-role="navbar">
	            <a data-align="left" data-icon="arrow-w" data-role="backbutton" class="back-button"></a>
	            <span data-role="view-title"></span>
	            <!-- <a data-align="right" data-role="button" class="nav-button" href="#/">Index</a> -->
	        </div>
	    </header>
	</div>

<script>
function initData(){
	
}
function submitData(){
	
}
</script>

<style>
.sales-down,
.sales-hold,
.sales-up,
.value {
	float: right;
}
.sales-up { color: green; }
.sales-down { color: red; }
.sales-hold { color: blue; }
.value { color: #bbb; }
.km-nova .km-navbar .km-button{
	   margin: 0 auto;
     padding-top:  1.135em;
}
.text-important{
	color:#ff4350;
	float: right;
}
.buttonArea{
	margin:50px 10px 0 10px;
}
</style>
       <script>
    window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova" });
    </script>
</body>
</html>