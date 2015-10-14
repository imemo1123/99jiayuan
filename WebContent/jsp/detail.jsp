<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.Map;"%>
<%@ include file="head.jsp" %>
<%
Map<String, String> info = (Map<String, String>)request.getAttribute("info");
String id = info.get("id");
String nike = info.get("nike");
String sex = info.get("sex");
String age = info.get("age");
String height = info.get("height");
String salary = info.get("salary");
String addr = info.get("addr");
String edu = info.get("edu");
String marital = info.get("marital");
String pic = info.get("pic");
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
    <div data-role="view" id="tabstrip-profile" data-title="个人中心" data-layout="mobile-tabstrip"  data-init="initData" >
    	<ul  data-role="listview"  data-style="inset">
	                 <li><img src="<%=pic %>"  class="km-thumbnail" style="width: 10em; height: 10em; margin: 2em auto; display: block; float: none;"/></li>
	                <li>会员等级 <span class="sales-up">普通会员</span></li>
	     </ul>
	    <ul data-role="listview" data-style="inset" data-type="group">
	        <li>
	            基本资料  
	            <ul>
	                <li>ID <span class="value"><%=id %></span></li>
	                <li>昵称 <span class="value"><%=nike %></span></li>
	                <li>性别 <span class="value"><%=("0".equals(sex))?"女":"男" %></span></li>
	                <li>年龄 <span class="value"><%=age %></span></li>
	                <li>身高 <span class="value"><%=height %>cm</span></li>
	                <li>月收入 <span class="value"><%=salary %></span></li>
	                <li>居住地 <span class="value"><%=addr %></span></li>
	                <li>学历 <span class="value"><%=edu %></span></li>
	                <li>婚姻状况 <span class="value" id="marital"></script></span></li>
	            </ul>
	        </li>
	        <li>
	            择偶意向
	            <ul>
	                 <li align="center">更多信息需升级<a href="main.jsp#jsp/buy.jsp">高级会员</a>才能查看</li>
	            </ul>
	        </li>
	        <li>
	            小档案
	            <ul>
	                 <li align="center">更多信息需升级<a href="jsp/buy.jsp">高级会员</a>才能查看</li>
	            </ul>
	        </li>
	    </ul>
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
	$("#marital").html(maritalMap[<%=marital%>]);
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
</style>
       <script>
    window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova" });
    </script>
</body>
</html>