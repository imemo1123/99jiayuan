<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>久久佳缘</title>
    <meta charset="utf-8">
    <link href="../css/kendo.common.min.css" rel="stylesheet">
    <link href="../css/kendo.default.min.css" rel="stylesheet">
    <link href="../css/kendo.dataviz.min.css" rel="stylesheet">
    <link href="../css/kendo.dataviz.default.min.css" rel="stylesheet">
    <link href="../css/kendo.mobile.nova.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/angular.min.js"></script>
    <script src="../js/kendo.all.min.js"></script>
</head>
<body>
<div data-role="layout" data-id="mobile-tabstrip">
 	<header data-role="header">
		<div data-role="navbar">
			<a class="nav-button" data-align="left" data-role="backbutton"></a> 
			<span data-role="view-title">注册（1/2）</span>
			 <!-- <a data-align="right" data-role="button" class="nav-button" href="#/">Index</a> -->
		</div>
	</header>
</div>
<span id="centeredNotification" style="display:none;"></span>
<div id="forms" data-role="view"   data-layout="mobile-tabstrip" data-init="initForm" data-title="注册（1/2）">
    <form action="./index.html" id="inputForm">
        <ul data-role="listview" data-style="inset">
        	<li>
                <label>手机号
                    <input type="text" id="tel"  placeholder="请输入您的手机号" required/>
                </label>
            </li>
            <li>
                <label>密码
                <input type="password" id="psw" placeholder="请输入至少6位的密码" min="6" required/>
                </label>
            </li>
            <li>
                <label>确认密码
                <input type="password" id="psw2" placeholder="请再次输入密码" required />
                </label>
            </li>
            <li>
                <label>昵称
                    <input type="text" id="nike" placeholder="请输入昵称" required />
                </label>
            </li>
            <li>
                <label>姓名
                    <input type="text" id="name" placeholder="请输入您的真实姓名" required />
                </label>
            </li>
         	<li>
                <label>性别
                    <select id="sex">
                        <option value="1">男</option>
                        <option value="0">女</option>
                    </select>
                </label>
            </li>
            <li>
                <label>生日
                    <input id="date" type="month" value="1990-01" />
                </label>
            </li>
            <li>
            	<i></i> <a data-role="button" class="km-primary km-justified transitions-button" data-click="checkTel">下一步</a>
            </li>
		</ul>
	</form>
</div>

<form action="regist_step2.jsp" name="submitForm" id="submitForm" method="post">
	<input type="hidden" name="tel"/>
	<input type="hidden"  name="psw"/>
	<input type="hidden" name="nike"/>
	<input type="hidden" name="name"/>
	<input type="hidden"  name="sex"/>
	<input type="hidden" name="date"/>
</form>
<script>
var centered = $("#centeredNotification").kendoNotification({
    stacking: "up",
    show: onShow,
    button: true
}).data("kendoNotification");

function initForm() {
        var body = $(".km-pane");
        if (kendo.ui.DropDownList) {
            $("#sex").kendoDropDownList({
                // The options are needed only for the desktop demo, remove them for mobile.
                popup: { appendTo: body },
                animation: { open: { effects: body.hasClass("km-android") ? "fadeIn" : body.hasClass("km-ios") || body.hasClass("km-wp") ? "slideIn:up" : "slideIn:down" } }
            });
        }
        
    }
function checkTel(){
	 var _tel = $("#tel").val();
	 $.post("../checkTelExict.do",{tel:_tel},function (json){
		 if(json=="false")
		 	submitData();
		 else{
			 centered.show("该手机已经注册！","error");
		 }
	 });	 
}
function submitData(){
	 var tel = $("#tel").val();
		 var psw = $("#psw").val();
		 var psw2 = $("#psw2").val();
		 var nike = $("#nike").val();
		 var name = $("#name").val();
		 var date = $("#date").val();
		 var sex = $("#sex").val();
		 if(tel.length != 11){
			 centered.show("请输入正确的手机号！","error");
			 return;
		 }
		 if(psw.length < 6){
			 centered.show("密码长度至少为6位！","error");
			 return;
		 }
		 if(psw != psw2){
			 centered.show("密码不一致！","error");
			 return;
		 }
		 if(nike==null || nike.length == 0){
			 centered.show("请输入昵称！","error");
			 return;
		 }
		 if(name==null || name.length == 0){
			 centered.show("请输入姓名！","error");
			 return;
		 }
		 document.submitForm.tel.value=tel;
		 document.submitForm.psw.value=psw;
		 document.submitForm.nike.value=nike;
		 document.submitForm.name.value=name;
		 document.submitForm.date.value=date;
		 document.submitForm.sex.value=sex;
		 document.submitForm.submit();
	
}
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
        e.element.parent().css({ left: newLeft});
    }
}


</script>

<script>
window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova" });
</script>
    
</body>
</html>