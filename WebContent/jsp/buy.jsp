<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="head.jsp" %>

<div data-role="view" data-title="购买" id="actionsheet-view" data-use-native-scrolling="true" data-layout="mobile-tabstrip">
    <h3 id="actionResult"></h3>
    <ul data-role="listview"  class="inboxList">
    	<li>
    		<a class=" km-primary km-button-right" data-role="button" href="jsp/order.jsp?type=1">1299.00</a>
    		<img alt="" src="<%=basePath %>images/vip1.png" class="pazLogo" >
    		<h3 style="color: green;">普通会员</h4>
    		<p>可浏览会员的完整信息，每月可获得12次送花机会</p>
    	</li>
    	<li>
    		<a class=" km-primary km-button-right" data-role="button" href="jsp/order.jsp?type=2">4999.00</a>
    		<img alt="" src="<%=basePath %>images/vip2.png" class="pazLogo" >
    		<h3 style="color: gold;">黄金会员</h4>
    		<p>可浏览会员的完整信息，每月可获得12次送花机会</p>
    	</li>
    	<li>
    		<a class=" km-primary km-button-right" data-role="button" href="jsp/order.jsp?type=3">9999.00</a>
    		<img alt="" src="<%=basePath %>images/vip3.jpg" class="pazLogo" >
    		<h3 style="color: #ff4350;">钻石会员</h4>
    		<p>可浏览会员的完整信息，每月可获得12次送花机会</p>
    	</li>
    </ul>

</div>



<script>
    var inbox = [
        {
            ID: 1,
            From: "John Doe",
            Subject: "Monday meeting",
            Text: "Hi Tom, Since Monday I'll be out of office, I'm rescheduling the meeting for Tuesday.",
            Time: "07:56"
        },
        {
            ID: 2,
            From: "Sarah Connor",
            Subject: "Regarding org chart changes",
            Text: "Tom, I checked the new org chart last night and I have some reservations about it...",
            Time: "08:22"
        },
        {
            ID: 3,
            From: "Jane Parker",
            Subject: "Your Costume is ready",
            Text: "Hi mr. Sawyer, I'm sorry for the delay, your Halloween costume is ready. The bears...",
            Time: "10:14"
        },
        {
            ID: 4,
            From: "Joe Harper",
            Subject: "I'm sorry, Tom",
            Text: "Hi Tom, my aunt comes for a visit this Saturday, so I can't come back to St. Pete...",
            Time: "10:14"
        },
        {
            ID: 5,
            From: "Becky Thatcher",
            Subject: "Out tonight?",
            Text: "Honey, wanna go out tonight to grab some chicken? My weekly vouchers for cooking...",
            Time: "10:14"
        }
    ];

    function onOpen(e) {
        this.element.find(".km-actionsheet-title").text(e.target.next().text());
    }

    function reply(e) {
        $("#actionResult").html("Replying to message #" + e.context);
    }

    function replyAll(e) {
        $("#actionResult").html("Replying to all in message #" + e.context);
    }

    function archive(e) {
        $("#actionResult").html("Archiving message #" + e.context);
    }
</script>

<style>
.pazLogo {
		weight: 5em;
        height: 5em;
        float: left;
        margin: 0.2em;
    }
</style>
