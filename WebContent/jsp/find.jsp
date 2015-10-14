<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="head.jsp" %>
<div data-role="view" id="tabstrip-sales" data-title="发现" data-layout="mobile-tabstrip" data-init="mobileListViewPressToLoadMore" data-show="nullCurrentExample">
<header data-role="header">
        <div data-role="navbar">
            <!--<a class="nav-button" data-align="left" data-role="backbutton">Back</a>-->
            <span data-role="view-title"></span>
            <a data-align="right" data-icon="organize" data-role="button" href="#choose" data-transition="overlay:up">筛选</a>
        </div>
    </header>
    <ul data-role="listview" id="load-more">
  </ul>
</div>
<div data-role="view" id="choose" data-title="发现" data-layout="mobile-tabstrip" >
       <ul data-role="listview" data-style="inset" data-type="group">
        <li>年龄
            <ul>
                <li><a onclick="javascript:chooseAge()" id="age">18-22</a></li>
            </ul>
        </li>
    </ul>

    <ul data-role="listview" data-style="inset" data-type="group">
        <li>身高
            <ul>
                <li><a onclick="javascript:chooseHeight()" id="height">160-170</a></li>
            </ul>
        </li>
    </ul>
      
     <ul data-role="listview" data-style="inset" data-type="group">
        <li>所在地
            <ul>
                <li><a href="javascript:chooseArea()">冷水滩</a></li>
            </ul>
        </li>
    </ul>
    <div id="bottunarea" style="margin-top: 30px" align="center">
    <a data-role="button" data-animated="true" href="#tabstrip-sales">确    定</a>
    <a data-role="button" data-animated="true" href="#tabstrip-sales">取    消</a>
    </div>
    <div id="chooseAge" style="display:none" class="box-col">
    <select class="myselect" id="minage">
    </select>
    至
    <select  class="myselect" id="maxage">
    </select>
    </div>
<div id="chooseHeight" style="display:none" class="box-col">
    <select class="myselect" id="minheight">
    </select>
    至
    <select  class="myselect" id="maxheight">
    </select>
    </div>
</div>

<script type="text/x-kendo-tmpl" id="dataSource-template">
   <a onclick="getDetail(#:id#)" data-transition="slide:right"> <div class="product">
        <img src="#=pic#" alt="#=name# image" class="pullImage"/>
        <h3>#:nike#</h3>
        <p>#:age#岁，#:edu#</p>
    </div></a>
</script>
<form action="getUserDetail.do" method="post" id="detailForm" name="detailForm">
	<input type="hidden" name="id"/>
</form>
<script>
$(function(){
    for(var i=18;i<=85;i++){
        $("#minage").append("<option value='"+i+"'>"+i+"岁</option>");
        $("#maxage").append("<option value='"+i+"'>"+i+"岁</option>");
    }
    for(var i=160;i<=195;i++){
        $("#minheight").append("<option value='"+i+"'>"+i+"cm</option>");
        $("#maxheight").append("<option value='"+i+"'>"+i+"cm</option>");
    }
    $("#minheight").append("<option value='0'>195cm以上</option>");
    $("#maxheight").append("<option value='0'>195cm以上</option>");
  //  mobileListViewPressToLoadMore();
});
function chooseAge(){
    var diag = new Dialog();
        diag.Width =300;
        diag.Height = 80;
        diag.Title = "请选择配偶年龄";
        diag.ShowMessageRow=false;
        diag.InvokeElementId = "chooseAge";
        diag.ShowButtonRow=true;
        diag.show();
        diag.okButton.style="color:white";
        diag.okButton.onclick = function(){
                diag.close();
                var minage=$("#minage").val();
                var maxage=$("#maxage").val();
                $("#age").html(minage+" - "+maxage);
        };
}
function chooseHeight(){
    var diag = new Dialog();
        diag.Width =300;
        diag.Height = 80;
        diag.Title = "请选择配偶身高";
        diag.ShowMessageRow=false;
        diag.InvokeElementId = "chooseHeight";
        diag.ShowButtonRow=true;
        diag.show();
        diag.okButton.style="color:white";
        diag.okButton.onclick = function(){
                diag.close();
                var minheight=$("#minheight").val();
                var maxheight=$("#maxheight").val();
                $("#height").html(minheight+" - "+maxheight);
        };
}
function mobileListViewPressToLoadMore(){
	var findDataSource = new kendo.data.DataSource({
	       transport:{
	    	   read:{
	    		   url: "<%=basePath%>getUserList.do",
	    		   dataType: "json"
	    	   }
	       }, 
	       pageSize: 90,
			serverPaging: true, 
    		schema: {
	    	    total: function(response) {
	    	      return response.total; // total is returned in the "total" field of the response
	    	    },
	    	    data:function(response) {
	    	      return response.data; // total is returned in the "total" field of the response
	    	    }
    		}
		});
	$("#load-more").kendoMobileListView({
        dataSource: findDataSource,
        template: $("#dataSource-template").text(),
        loadMore: true
    });
}

function getDetail(id){
	document.detailForm.id.value=id;
	document.detailForm.submit();
}
</script>

<style>
 .product h3 {
        font-size: 1.3em;
        line-height: 1.4em;
        margin: 0;
        padding: 0;
        height: 1.3em;
        overflow: hidden;
    }
    .product p {
        font-size: 1em;
        margin: 0;
        padding: .3em 0 0;
    }
    .pullImage {
        width: 64px;
        height: 64px;
        border-radius: 3px;
        float: left;
        margin-right: 10px;
    }
</style>
