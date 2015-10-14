<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="head.jsp" %>
<%
String rst =MyHandle.nvl((String)request.getAttribute("rst"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>久久佳缘</title>
    <meta charset="utf-8">
    <link href="<%=basePath %>css/kendo.mobile.nova.min.css" rel="stylesheet" />
        <link href="<%=basePath %>css/kendo.common.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.default.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.dataviz.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/kendo.dataviz.default.min.css" rel="stylesheet">
    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script src="<%=basePath %>js/angular.min.js"></script>
    <script src="<%=basePath %>js/kendo.all.min.js"></script>
    <script src="<%=basePath %>js/cookie.js"></script>
</head>
<body>
<div data-role="view" data-title="久久佳缘" id="view-transitions" data-persist="true" data-use-native-scrolling="true" style="position:relative">
    <div data-role="footer">
		<a data-role="button" href="#view-transitions-login"  class="km-large km-justified km-primary" >马上体验</a>    
    </div>
    
</div>

<div data-role="view" data-title="登陆" id="view-transitions-login" data-transition="overlay:up" data-persist="true" data-use-native-scrolling="true">
	<header data-role="header">
        <div data-role="navbar">
            <a class="nav-button" data-align="left" data-role="backbutton"></a>
            <span data-role="view-title"></span>
            <a data-align="right" data-role="button" class="nav-button" data-click="goRegist">注册</a> 
        </div>
    </header>
    <span id="centeredNotification" style="display:none;"></span>
    <ul data-role="listview" data-style="inset">
        <li><label for="username">手机号: <input type="text" id="username" /></label></li>
        <li><label for="password">密码: <input type="password" id="password" /></label></li>
        <li>记住密码 <input id="issave" type="checkbox" data-role="switch" checked></li>
    </ul>
    
    <div class="action-buttons">
        <a data-click="login" data-transition="overlay:down reverse" data-role="button" class="km-primary km-justified transitions-button">登陆</a><br />
        <a href="#view-transitions" data-transition="overlay:up reverse" data-role="button" class="km-justified transitions-cancel">取消</a>
    </div>
</div>



<form action="<%=basePath %>login.do" name="submitForm" id="submitForm" method="post">
	<input type="hidden" name="tel"/>
	<input type="hidden" name="psw"/>
</form>
<script>
var centered = $("#centeredNotification").kendoNotification({
    stacking: "up",
    show: onShow,
    button: true
}).data("kendoNotification");

function onShow(e) {
    if (!$("." + e.sender._guid)[1]) {
        var element = e.element.parent(),
            eWidth = element.width(),
            eHeight = element.height(),
            wWidth = $(window).width(),
            wHeight = $(window).height(),
            newTop, newLeft;
        newLeft = Math.floor(wWidth / 2 - eWidth / 2);
        newTop = Math.floor(wHeight / 2 - eHeight / 2);
        e.element.parent().css({top: newTop, left: newLeft});
    }
}


$(function(){
	var rst = "<%=rst%>";
	if(rst.length <= 0){
		var tel = getCookieValue("tel");
		$("#username").val(tel); 
		var psw = getCookieValue("psw");
		$("#password").val(psw);
		
		setTimeout(function(){
			location.href="#view-transitions-login";
		}, 3000);
	}else{
		if(rst == "false"){
			location.href="#view-transitions-login";
			 centered.show("账号或密码错误！","error");
		}
	}
	
});
    function closeModalViewLogin() {
        $("#modalview-login").kendoMobileModalView("close");
    }
    
    function regist(){
    	location.href = "jsp/regist_step1.jsp"
    }
    
    function login(){
    	//location.href = "main.jsp"
    	var issave = $("#issave").attr('checked');
    	if(issave){
    		setCookie("tel",$("#username").val(),24,"/");
            setCookie("psw",$("#password").val(),24,"/"); 
    	}
    	document.submitForm.tel.value=$("#username").val();
    	document.submitForm.psw.value=$("#password").val();
    	document.submitForm.submit();
    }
    
    function goRegist(){
    	window.location.href="jsp/regist_step1.jsp";
    }
</script>
 
 
<style type="text/css" media="screen">
h1.app-logo {
    margin: 3em 0;
    font-size: 3em;
    font-weight: 100;
    text-transform: uppercase;
    text-align: center;
    line-height: .9em;
}
.action-buttons {
    margin: 1em;
}
#view-transitions-login .km-back {
    display: none;
}

#view-transitions .km-content{
	background: url(images/loginbackgroud.jpg) no-repeat;
	background-size:100%;
}
</style>

    <script>
    window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova" });
    </script>
    
    
</body>
</html>
