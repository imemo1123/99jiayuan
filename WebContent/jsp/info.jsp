<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="cn.memo.handle.MyHandle"%>
<%@ include file="head.jsp" %>
<%@page import="cn.memo.handle.JspHandle;"%>
<%
String id = (String)session.getAttribute("id");
String nike = (String)session.getAttribute("nike");
String sex = (String)session.getAttribute("sex");
String birthday = (String)session.getAttribute("birthday");
String height = (String)session.getAttribute("height");
String salary = (String)session.getAttribute("salary");
String addr = (String)session.getAttribute("addr");
String edu = (String)session.getAttribute("edu");
String marital = (String)session.getAttribute("marital");
String pic = (String)session.getAttribute("pic");
String t_age_min = MyHandle.nvl((String)session.getAttribute("t_age_min"),"不限");
String t_age_max = MyHandle.nvl((String)session.getAttribute("t_age_max"),"不限");
String t_age = t_age_min+" - "+t_age_max;
String t_height_min = MyHandle.nvl((String)session.getAttribute("t_height_min"),"不限");
String t_height_max = MyHandle.nvl((String)session.getAttribute("t_height_max"),"不限");
String t_height = t_height_min+" - "+t_height_max;
String t_edu = MyHandle.nvl((String)session.getAttribute("t_edu"),"不限");
String t_salary = MyHandle.nvl((String)session.getAttribute("t_salary"),"不限");
String t_addr = MyHandle.nvl((String)session.getAttribute("t_addr"),"不限");
String t_marital = MyHandle.nvl((String)session.getAttribute("t_marital"),"不限");
String school = MyHandle.nvl((String)session.getAttribute("school"),"保密");
String company = MyHandle.nvl((String)session.getAttribute("company"),"保密");
String work = MyHandle.nvl((String)session.getAttribute("work"),"保密");
String house = MyHandle.nvl((String)session.getAttribute("house"),"保密");
String car = MyHandle.nvl((String)session.getAttribute("car"),"保密");
String child = MyHandle.nvl((String)session.getAttribute("child"),"保密");
String weight = MyHandle.nvl((String)session.getAttribute("weight"),"保密");
String charact = MyHandle.nvl((String)session.getAttribute("charact"),"");
String t_charact = MyHandle.nvl((String)session.getAttribute("t_charact"),"");

%>
 <div data-role="layout" data-id="tabstrip1">
	    <header data-role="header">
	        <div data-role="navbar">
	            <a data-align="left" data-icon="arrow-w" data-role="backbutton" class="back-button"></a>
	            <span data-role="view-title"></span>
	            <!-- <a data-align="right" data-role="button" class="nav-button" href="#/">Index</a> -->
	        </div>
	    </header>
	</div>
    <div data-role="view" id="tabstrip-profile" data-title="个人中心" data-layout="mobile-tabstrip" data-init="initData">
     <iframe id="fileFrame" name="fileFrame" style="diaplay:none;width:0;height:0">
	</iframe>
	<form id="fileForm" target="fileFrame" action="changePic.do" method="post" name="fileForm" encType="multipart/form-data">
		   <input id="pic"  name="pic" type="file" style="display:none" onchange="handleFiles(this)">
	</form>
    <div style="margin-top:20px">
    	<ul  data-role="listview"  data-style="inset">
	                <li align="center">
		                <a onclick="selectImage()">
		                	<img  id="ico" src="<%=pic %>"  class="km-thumbnail" style="width: 10em; height: 10em; margin: 2em auto; display: block; float: none;"/>
		               	 	<span>点击更换照片</span>
		               </a>
		             </li>
	                <li>会员等级 <span class="sales-up">普通会员</span></li>
	     </ul>
	     </div>
	    <ul data-role="listview" data-style="inset" data-type="group">
	        <li><span class="group-title">基本资料</span>
	            <ul>
	                <li>ID <span class="value" ><%=id %></span></li>
	                <li>昵称 <span class="value" id="_nike"><%=nike %></span></li>
	                <li>性别 <span class="value"><%=("0".equals(sex))?"女":"男" %></span></li>
	                <li>出生日期 <span class="value"  id="_date"><%=birthday %></span></li>
	                <li>身高 <span class="value"  id="_height"><%=height %>cm</span></li>
	                <li>月收入 <span class="value"  id="_salary"><%=salary %></span></li>
	                <li>居住地 <span class="value" id="_addr"><%=addr %></span></li>
	                <li>学历 <span class="value" id="_edu"><%=edu %></span></li>
	                <li>婚姻状况 <span class="value" id="_marital"></span></li>
	                
	                <li>
	                    <i></i> <a data-role="button" class="km-primary km-justified" href="#edit-view1">修改</a>
	                </li>
	            </ul>
	        </li>
	        <li><span class="group-title">择偶意向</span>
	            <ul>
	                 <li>年龄 <span class="value" id="_t_age"><%=t_age %></span></li>
	                  <li>身高 <span class="value" id="_t_height"><%=t_height %></span></li>
	                  <li>学历 <span class="value" id="_t_edu"><%=t_edu %></span></li>
	                  <li>收入 <span class="value" id="_t_salary"><%=t_salary %></span></li>
	                  <li>居住地 <span class="value" id="_t_addr"><%=t_addr %></span></li>
	                  <li>婚姻状况 <span class="value" id="_t_marital"><%=t_marital %></span></li>
	                  <li>性格 <span class="value" id="_t_charact"></span></li>
	                  <li>
	                    <i></i> <a data-role="button" class="km-primary km-justified"  href="#edit-view2">修改</a>
	                </li>
	            </ul>
	        </li>
	        <li><span class="group-title">小档案</span>
	            <ul>
	                <li>毕业学校 <span class="value" id="_school"><%=school %></span></li>
	                <li>工作单位 <span class="value" id="_company"><%=company %></span></li>
	                <li>职位 <span class="value" id="_work"><%=work %></span></li>
	                <li>购房情况 <span class="value" id="_house"><%=house %></span></li>
	                <li>购车情况 <span class="value" id="_car"><%=car %></span></li>
	                <li>有无子女 <span class="value" id="_child"><%=child %></span></li>
	                <li>体重 <span class="value" id="_weight"><%=weight %></span></li>
	                <li>性格 <span class="value" id="_charact"></span></li>
	                <li> 
	                    <i></i> <a id="test1" data-role="button" class="km-primary km-justified" href="#edit-view3" >修改</a>
	                </li>
	            </ul>
	        </li>
	    </ul>
	    
	</div>
	
<div data-role="view" data-title="编辑个人信息" id="edit-view1" data-transition="overlay:up" data-persist="true" data-layout="tabstrip1" data-init="initForm1">
	<ul data-role="listview" data-style="inset">
        	<li>
                <label>昵称
                    <input type="text" id="nike" value="<%=nike %>"/>
                </label>
            </li>
            <li>
                <label>生日
                    <input id="date" type="date" value="<%=birthday %>" />
                </label>
            </li>
            <li>
                <label>身高 /cm
                <input type="number" id="height" value="<%=height%>"/>
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
                <label>居住地
                   <select id="addr" value="<%=addr%>">
                        <%=JspHandle.getAddrOptions() %>
                    </select>
                </label>
            </li>
           <li>
                <label>学历
                    <select id="edu" value="<%=edu %>">
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
                    <select id="marital" value="<%=marital%>">
                        <option value="0">未婚</option>
                        <option value="1">离异</option>
                        <option value="2">丧偶</option>
                    </select>
                </label>
            </li>
            <li>
            	<i></i> <a data-role="button"  data-transition="overlay:up reverse" class="km-primary km-justified transitions-button" data-click="submitData1">完成</a>
            </li>
	</ul>
</div>
<div data-role="view" data-title="编辑个人信息" id="edit-view3" data-transition="overlay:up" data-persist="true" data-layout="tabstrip1" data-init="initForm3">
	<ul data-role="listview" data-style="inset">
        	<li>
                <label>毕业学校
                    <input type="text" id="school" value="<%=school %>"/>
                </label>
            </li>
            <li>
                <label>工作单位
                    <input id="company" type="text" value="<%=company %>" />
                </label>
            </li>
            <li>
                <label>职位
                <input type="text" id="work" value="<%=work%>">
                </label>
            </li>
            
            <li>
                <label>购房情况
                <select id="house">
                	<option value="">保密</option>
                	<option value="1">有房</option>
                	<option value="0">没房</option>
                </select>
                </label>
            </li>
            <li>
                <label>购车情况
                   <select id="car">
	                	<option value="">保密</option>
	                	<option value="1">有车</option>
	                	<option value="0">没车</option>
                    </select>
                </label>
            </li>
           <li>
                <label>有无子女
                    <select id="child">
                    	<option value="">保密</option>
	                	<option value="0">无</option>
	                	<option value="1">有</option>
                    </select>
                </label>
            </li>
         	<li>
                <label>体重 /kg
                     <input type="text" id="weight" value="<%=weight%>"></select>
                </label>
            </li>
            <li>
            	<fieldset>
                    <legend>性格</legend>
        				<ul data-role="listview" data-style="inset" class="checkul">
              				<%=JspHandle.getCharactCheck("checkbox1") %>
              			</ul>
                </fieldset>
            </li>
            <li>
            	<i></i> <a data-role="button"  data-transition="overlay:up reverse" class="km-primary km-justified transitions-button" data-click="submitData3">完成</a>
            </li>
	</ul>
	
</div>

<div data-role="view" data-title="编辑择偶意向" id="edit-view2" data-transition="overlay:up" data-persist="true" data-layout="tabstrip1" data-init="initForm2">
	<ul data-role="listview" data-style="inset">
        	<li>
                <fieldset>
                        <label class="km-inline-field km-label-above" style="width: 200px;">
                        最低年龄
                        <select id="t_age_min">
                        	<option value="">不限</option>
                        	<%=JspHandle.getAgeOptions() %>
                        </select>
                        </label>
                        <label class="km-inline-field km-label-above" style="width: 200px;">
                            最高年龄
                          <select id="t_age_max">
                        	<option value="">不限</option>
                        	<%=JspHandle.getAgeOptions() %>
                        </select>
                      </label>  
                </fieldset>  
            </li>
            <li>
                <fieldset>
                        <label class="km-inline-field km-label-above" style="width: 200px;">
                        最低身高
                        <select id="t_height_min">
                        	<option value="">不限</option>
                        	<%=JspHandle.getHeightOptions() %>
                        </select>
                        </label>
                        <label class="km-inline-field km-label-above" style="width: 200px;">
                            最高身高
                          <select id="t_height_max">
                        	<option value="">不限</option>
                        	<%=JspHandle.getHeightOptions() %>
                        </select>
                      </label>  
                </fieldset>  
            </li>
            <li>
                <label>学历
                    <select id="t_edu">
                    	<option value="">不限</option>
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
                <label>月收入
                <select id="t_salary">
                	<option value="">不限</option>
                	<option value="2000-5000">2000-5000</option>
                	<option value="5000-8000">5000-8000</option>
                	<option value="8000-10000">8000--10000</option>
                	<option value="10000-20000">10000-20000</option>
                	<option value="20000以上">20000以上</option>
                </select>
                </label>
            </li>
            <li>
                <label>居住地
                   <select id="t_addr" >
                   		<option value="">不限</option>
                        <%=JspHandle.getAddrOptions() %>
                    </select>
                </label>
            </li>
         	<li>
                <label>婚姻状况
                    <select id="t_marital" >
                        <option value="0">未婚</option>
                        <option value="1">离异</option>
                        <option value="2">丧偶</option>
                    </select>
                </label>
            </li>
            <li>
            	<fieldset>
                    <legend>对方性格</legend>
        				<ul data-role="listview" data-style="inset" class="checkul">
              				<%=JspHandle.getCharactCheck("checkbox2") %>
              			</ul>
                </fieldset>
            </li>
            <li>
            	<i></i> <a data-role="button"  data-transition="overlay:up reverse" class="km-primary km-justified transitions-button" data-click="submitData2">完成</a>
            </li>
	</ul>
</div>

<script>
function initData(){
	$("#_marital").html(maritalMap[<%=marital%>]);
	var charact = "<%=charact%>";
	if(charact != null && charact.length > 0){
		var charas = charact.split(',');
		var charact_show = "";
		for(var i=-0;i<charas.length;i++){
			if(charactMap[charas[i]] != null && charactMap[charas[i]].length>0 && charactMap[charas[i]]!=undefined)
				charact_show += charactMap[charas[i]]+"，";
		}
		$("#_charact").html(charact_show);
	}
	
	var _charact = "<%=t_charact%>";
	if(_charact != null && _charact.length > 0){
		var _charas = _charact.split(',');
		var _charact_show = "";
		for(var i=-0;i<_charas.length;i++){
			if(charactMap[_charas[i]] != null && charactMap[_charas[i]].length>0 && charactMap[_charas[i]]!=undefined)
				_charact_show += charactMap[_charas[i]]+"，";
		}
		$("#_t_charact").html(_charact_show);
	}
}
function initForm1(){
	$("#addr").val( "<%=addr%>");
	$("#edu").val( "<%=edu%>");
	$("#salary").val( "<%=salary%>");
	$("#marital").val( "<%=marital%>");
}
function submitData1(){
	 $.post(
			 "editBaseInfo.do",
			 {
				 nike:$("#nike").val(),
				 date:$("#date").val(),
				 addr:$("#addr").val(),
				 height:$("#height").val(),
				 salary:$("#salary").val(),
				 edu:$("#edu").val(),
				 marital:$("#marital").val()
			},
			function (json){
				refresh1(json);
				location.href="#tabstrip-profile";
			},
			"json");
}
function refresh1(json){
	$("#_nike").html(json.nike);
	$("#_date").html(json.date);
	$("#_addr").html(json.addr);
	$("#_height").html(json.height);
	$("#_salary").html(json.salary);
	$("#_edu").html(json.edu);
	$("#_marital").html(maritalMap[json.marital]);
}
function initForm2(){
	$("#t_age_min").val( "<%=t_age_min%>");
	$("#t_age_max").val( "<%=t_age_max%>");
	$("#t_height_min").val( "<%=t_height_min%>");
	$("#t_height_max").val( "<%=t_height_max%>");
	$("#t_addr").val( "<%=t_addr%>");
	$("#t_edu").val( "<%=t_edu%>");
	$("#t_salary").val( "<%=t_salary%>");
	$("#t_marital").val( "<%=t_marital%>");
	var charact = "<%=t_charact%>";
	var charas = charact.split(',');
	$("input[name='checkbox2']:checkbox").each(function(){ 
		for(var i=0;i<charas.length;i++){
			if($(this).val() == charas[i]){
				$(this).attr("checked",true);
				return;
			}
		}
	});
}
function submitData2(){
	var str="";
	var box=document.getElementsByName("checkbox2");
	for (i=0;i<box.length;i++){
		if(box[i].checked == true){
			str+= box[i].value+",";
		}
	}
	$.post(
			 "editTargetInfo.do",
			 {
				 t_charact:str,
				 t_age_min:$("#t_age_min").val(),
				 t_age_max:$("#t_age_max").val(),
				 t_height_min:$("#t_height_min").val(),
				 t_height_max:$("#t_height_max").val(),
				 t_edu:$("#t_edu").val(),
				 t_salary:$("#t_salary").val(),
				 t_marital:$("#t_marital").val(),
				 t_addr:$("#t_addr").val()
			},
			function (json){
				refresh2(json);
				location.href="#tabstrip-profile";
			},
			"json");
}
function refresh2(json){
	$("#_t_age").html(json.t_age_min+"-"+json.t_age_max);
	$("#_t_height").html(json.t_height_min+"-"+json.t_height_max);
	$("#_t_salary").html(json.t_salary);
	$("#_t_edu").html(json.t_edu);
	$("#_t_addr").html(json.t_addr);
	$("#_t_marital").html(maritalMap[json.t_marital]);
	var _charact = json.t_charact;
	if(_charact != null && _charact.length > 0){
		var _charas = _charact.split(',');
		var _charact_show = "";
		for(var i=-0;i<_charas.length;i++){
			if(charactMap[_charas[i]] != null && charactMap[_charas[i]].length>0 && charactMap[_charas[i]]!=undefined)
				_charact_show += charactMap[_charas[i]]+"，";
		}
		$("#_t_charact").html(_charact_show);
	}
	
}
function initForm3(){
	$("#house").val( "<%=house%>");
	$("#car").val( "<%=car%>");
	$("#child").val( "<%=child%>");
	var charact = "<%=charact%>";
	var charas = charact.split(',');
	$("input[name='checkbox1']:checkbox").each(function(){ 
		for(var i=0;i<charas.length;i++){
			if($(this).val() == charas[i]){
				$(this).attr("checked",true);
				return;
			}
		}
	});
}
function submitData3(){
	var str="";
	var box=document.getElementsByName("checkbox1");
	for (i=0;i<box.length;i++){
		if(box[i].checked == true){
			str+= box[i].value+",";
		}
	}
	$.post(
			 "editMoreInfo.do",
			 {
				 charact:str,
				 weight:$("#weight").val(),
				 child:$("#child").val(),
				 car:$("#car").val(),
				 house:$("#house").val(),
				 company:$("#company").val(),
				 work:$("#work").val(),
				 school:$("#school").val()
			},
			function (json){
				refresh3(json);
				location.href="#tabstrip-profile";
			},
			"json");
}
function refresh3(json){
	$("#_weight").html(json.weight);
	if(json.child==null || json.child.length<=0)
		$("#_child").html("保密");
	else
		$("#_child").html(json.child=="0"?"无":"有");
	if(json.car==null || json.car.length<=0)
		$("#_car").html("保密");
	else
		$("#_car").html(json.car=="0"?"无":"有");
	if(json.house==null || json.house.length<=0)
		$("#_house").html("保密");
	else
		$("#_house").html(json.house=="0"?"无":"有");
	$("#_company").html(json.company);
	$("#_work").html(json.work);
	$("#_school").html(json.school);

	var charact = json.charact;
	if(charact != null && charact.length > 0){
		var charas = charact.split(',');
		var charact_show = "";
		for(var i=-0;i<charas.length;i++){
			if(charactMap[charas[i]] != null && charactMap[charas[i]].length>0 && charactMap[charas[i]]!=undefined)
				charact_show += charactMap[charas[i]]+"，";
		}
		$("#_charact").html(charact_show);
	}
}

function selectImage(){
	$("#pic").click();
}

function handleFiles(obj){
	var files = obj.files;
	if(files.length<=0)
		return;
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
	$("#fileForm").submit();
}
</script>
	<style>
	    #tabstrip-profile h2 {
	        display: inline-block;
	        font-size: 1.1em;
	        margin: 1.5em 0 0 .7em;
	    }
	    #tabstrip-profile h2 span {
	        display: block;
	        clear: both;
	        font-size: 1.8em;
	        margin: .1em 0 0 0;
	    }
	    .touxiang {
	        width: 5em;
	        height: 5em;
	        float: left;
	        margin: 1em;
	        border: 1px solid rgba(0,0,0,.2);
	        -webkit-border-radius: 4em;
	        border-radius: 4em;
	    }
	
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
	    .group-title{
	color:#ff4350;
	font-family: "Microsoft YaHei"
}
.km-nova .km-navbar .km-button{
	   margin: 0 auto;
     padding-top:  1.135em;
}
select{
	padding-left:0;
}

.checkul  li{
	padding:8px 10px !important;
}
	</style>
