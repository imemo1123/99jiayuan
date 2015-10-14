<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String tel = (String)request.getParameter("tel");
String psw = (String)request.getParameter("psw");
String name = (String)request.getParameter("name");
String nike = (String)request.getParameter("nike");
String date = (String)request.getParameter("date");
String sex = (String)request.getParameter("sex");
%>
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
			<span data-role="view-title"></span>
			 <!-- <a data-align="right" data-role="button" class="nav-button" href="#/">Index</a> -->
		</div>
	</header>
</div>
<div id="forms" data-role="view"   data-layout="mobile-tabstrip" data-init="initForm" data-title="注册（2/2）">
    <form action="./index.html">
        <ul data-role="listview" data-style="inset" >
        <li align="center">
        <%if("1".equals(sex)) {%>
        	<a data-click="selectImage" onclick="selectImage()"><img id="ico" src="../images/ico_male.jpg"  class="touxiang"/>	</a>
        <%}else{ %>
        	<a data-click="selectImage" onclick="selectImage()"><img id="ico" src="../images/ico_female.jpg"  class="touxiang"/>	</a>
        <%} %>
        </li>
       
        	<li>
                <label>居住地
                   <select id="addr">
                        <option value="冷水滩">冷水滩</option>
                        <option value="零陵">零陵</option>
                    </select>
                </label>
            </li>
            <li>
                <label>身高 /cm
                <input type="number" id="height" value="160"></select>
                </label>
            </li>
            <li>
                <label>月收入
                <select id="salary">
                	<option value="2000-5000">2000-5000</option>
                	<option value="5000-8000">5000-8000</option>
                	<option value="8000-10000">8000--10000</option>
                	<option value="10000-20000">10000-20000</option>
                	<option value="20000以上">20000以上</option>
                </select>
                </label>
            </li>
            <li>
                <label>学历
                    <select id="edu">
                    	<option value="初中">初中</option>
                    	<option value="高中">高中</option>
                    	<option value="大专">大专</option>
                    	<option value="本科">本科</option>
                    	<option value="硕士">硕士</option>
                    	<option value="博士">博士</option>
                    </select>
                </label>
            </li>
         	<li>
                <label>婚姻状况
                    <select id="marital">
                        <option value="0">未婚</option>
                        <option value="1">离异</option>
                        <option value="2">丧偶</option>
                    </select>
                </label>
            </li>
            <li>
            	<i></i> <a data-role="button" class="km-justified" data-click="submitData">完成</a>
            </li>
		</ul>
	</form>
</div>
<form action="../regist.do" name="submitForm" id="submitForm" method="post" encType="multipart/form-data">
	<input type="hidden" id="tel" name="tel" value="<%=tel%>"/>
	<input type="hidden" id="psw" name="psw" value="<%=psw%>"/>
	<input type="hidden" id="nike" name="nike" value="<%=nike%>"/>
	<input type="hidden" id="name" name="name" value="<%=name%>"/>
	<input type="hidden" id="sex" name="sex" value="<%=sex%>"/>
	<input type="hidden" id="date" name="date" value="<%=date%>"/>
	<input type="hidden"  name="addr"/>
	<input type="hidden"  name="height"/>
	<input type="hidden" name="salary"/>
	<input type="hidden"  name="edu"/>
	<input type="hidden" name="marital"/>
	 <input id="pic"  name="pic" type="file" name="uploadFile" style="display:none" onchange="handleFiles(this)">
</form>
<script>
function initForm() {
       
    }
function submitData(){
	var addr=$("#addr").val();
	var height=$("#height").val();
	var salary=$("#salary").val();
	var edu=$("#edu").val();
	var marital=$("#marital").val();
	 document.submitForm.addr.value=addr;
	 document.submitForm.height.value=height;
	 document.submitForm.salary.value=salary;
	 document.submitForm.edu.value=edu;
	 document.submitForm.marital.value=marital;
	 document.submitForm.submit();
}

function selectImage(){
	$("#pic").click();
}
function handleFiles(obj){
	var files = obj.files;
	if(window.URL){
	      $("#ico").attr("src", window.URL.createObjectURL(files[0])); //创建一个object URL，并不是你的本地路径
	      $("#ico").onload = function(e) {
	         window.URL.revokeObjectURL(this.src); //图片加载后，释放object URL
	      }
	}else if(window.FileReader){
		var reader = new FileReader();
		reader.readAsDataURL(files[0]);
		reader.onload = function(e){
			$("#ico").attr("src", this.result);
		}
	}else{
		//ie
		obj.select();
		obj.blur();
		var nfile = document.selection.createRange().text;
		document.selection.empty();
		$("#ico").attr("src", nfile);
	}
}
</script>
<style>
.km-justified{
	display: block;
    width: 100%;
}
.touxiang {
	        width: 8em;
	        height: 8em;
	        margin: 1em;
	        border: 1px solid rgba(0,0,0,.2);
	        -webkit-border-radius: 4em;
	        border-radius: 4em;
	    }
</style>
<script>
window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova" });
</script>
    
</body>
</html>