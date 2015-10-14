<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="head.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>永州大咖秀</title>
    <meta charset="utf-8">
    <link href="<%=basePath %>css/kendo.mobile.nova.min.css" rel="stylesheet" />
    <script src="<%=basePath %>js/jquery.min.js"></script>
    <script src="<%=basePath %>js/angular.min.js"></script>
    <script src="<%=basePath %>js/kendo.all.min.js"></script>
    <script src="<%=basePath %>js/myjs.js"></script>
</head>
<body>
  
    <div data-role="view" id="tabstrip-main" data-title="永州大咖秀" data-layout="mobile-tabstrip" data-init="initList">
            <div data-role="scrollview" id="scrollView" data-page="0" data-duration="500">
                <div  data-role="page">
                	<img src="<%=basePath %>images/logo.png"  width="100%">
                </div>
            </div>
    		<ul data-role="listview" data-style="inset" id="user-listview">
	        	<script type="text/x-kendo-tmpl" id="nominate-template">
							<a href="#:url#" data-transition="slide:left" data-rel="external">
      							<div class="teamMate"	>
									<img src="#=pic#"/>
      								<h3>#:title#</h3>
								</div>
							</a>
				</script>
             </ul>
                       
    </div>

<div data-role="layout" data-id="mobile-tabstrip">
    <header data-role="header">
        <div data-role="navbar">
            <!--<a class="nav-button" data-align="left" data-role="backbutton">Back</a>-->
            <span data-role="view-title"></span>
            <!-- <a data-align="right" data-role="button" class="nav-button" href="#/">Index</a> -->
        </div>
    </header>
    </div>

<script>

function initList(){
	var nominateData = new kendo.data.DataSource({
		transport:{
			read:{
				 url: "<%=basePath%>getDakaxiu.do",
		   		dataType: "json",
			}
   		}
	});
	$("#user-listview").kendoMobileListView({
        dataSource: nominateData,
        template: $("#nominate-template").html()
	});
}
</script>

<style>
    #tabstrip-main h2 {
        display: inline-block;
        font-size: 1.1em;
        margin: 0em 0 0 .7em;
    }
    #tabstrip-main h2 span {
        display: block;
        clear: both;
        font-size: 1.8em;
        margin: .1em 0 0 0;
    }
    .teamMate img {
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

    #scrollview-home .photo {
        margin: 0;
        height: 220px;
        display: inline-block;
        -webkit-background-size: auto 100%;
        background-size: auto 100%;
        background-repeat: no-repeat;
        background-position: center center;
    }

    .km-wp #scrollview-home .photo {
        height: 15em;
    }

    .photo1 {background-image: url("../images/1.jpg");}
    .photo2 {background-image: url("../images/2.jpg");}
    .photo3 {background-image: url("../images/4.jpg");}

    #scrollview-container {
        margin: 0 0 0 0;
        padding-bottom: 2px;
        padding-top: 0px;
        background: rgba(0,0,0,.1);
        border: 1px solid rgba(0,0,0,.3);
        border-width: 1px 0;
        box-shadow: 0 1px 1px rgba(255,255,255,.3);
    }

    .km-flat #scrollview-container {
        background: transparent;
        border-width: 0;
        box-shadow: none;
    }

    .km-ios #scrollview-container {
        background: url(../content/shared/images/patterns/pattern1.png);
        box-shadow: 0 0 2px rgba(255,255,255,.5), inset 0 0 7px #000;
    }

    #scrollview-home .km-ios .km-content {
        background: #bbb;
    }


.teamMate:after {
                    content: ".";
                    display: block;
                    height: 0;
                    line-height: 0;
                    clear: both;
                    visibility: hidden;
                }
                .teamMate h3 {
                    color:#000;
                    margin-left: 0px;
                    padding-top: 20px;
                    margin-top:0;
                }
                .teamMate p {
                    color:#ccc;
                    margin: 5px 0;
                }
                .teamMate img {
                    float: left;
                    margin: 5px 15px 5px 5px;
                    border: 1px solid #ccc;
                }
                .teamTitle :after{
                    line-height: 20px;
                }
                
#user-listview li{
	padding-top:5px;
	padding-bottom:5px;
}

.group-title{
	color:#ff4350;
	font-family: "Microsoft YaHei"
}
</style>
    
    <script>
    window.kendoMobileApplication = new kendo.mobile.Application($(document.body),{ skin: "nova",transition: "slide" });
    //window.kendoMobileApplication = new kendo.mobile.Application(document.body);
    </script>
    
    
</body>
</html>