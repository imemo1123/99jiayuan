<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>久久佳缘</title>
    <meta charset="utf-8">
    <link href="../css/kendo.mobile.all.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/angular.min.js"></script>
    <script src="../js/kendo.all.min.js"></script>
    <script src="../js/zDialog.js"></script>
    <script src="../js/zDrag.js"></script>
</head>
<body >
<div data-role="view" id="tabstrip-sales" data-title="发现" data-layout="mobile-tabstrip" data-init="mobileListViewPressToLoadMore">
    <ul data-role="listview" id="load-more">
  </ul>
</div>

<script type="text/x-kendo-tmpl" id="dataSource-template">
  #:id#
</script>

<script>
function mobileListViewPressToLoadMore(){ 
	var dataSource = new kendo.data.DataSource({
	       transport:{
	    	   read:{
	    		   url: "../ListTest",
	    		   dataType: "json",	    		   
	    		   data:{"index":1}
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
    	},
    	
	});
	 
	$("#load-more").kendoMobileListView({
        dataSource: dataSource,
        template: $("#dataSource-template").text(),
        loadMore: true
    });
}

  
</script>



<style>
 .buttonStyle{
    background:#3498db;
    color:white;
    font-family: "Microsoft YaHei",Arial,sans-serif;
    padding:5px 8px 5px 8px;
    border: none;
}
.mylabel{

}
.myselect{
    height: 30px;
    width: 80px;
}
.box-col{
    padding-top: 20px;
}

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

<script>
     window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{platform: "ios7"});
</script>
    
</body>
</html>