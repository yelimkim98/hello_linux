<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="memberDAO" class="helloLinux.member.MemberDAO" scope="page" />
<jsp:useBean id="visitLogDAO" class="helloLinux.log.VisitLogDAO" scope="page" />

<!DOCTYPE HTML>
<html>
<head>
<title>
	Hello Linux/About
</title>
<script>
window.onload = function () {
	var girls = <%= visitLogDAO.getNotMemberVisitingCnt() %> <%-- 비회원 --%>
	var boys =  <%= visitLogDAO.getMemberVisitingCnt() %> <%-- 회원 --%>
	var totalVisitors = girls + boys;
	
	var visitorsData = {
		"Boys vs Girls Visitors": [{
			cursor: "pointer",
			explodeOnClick: false,
			innerRadius: "0%",
			legendMarkerType: "square",
			name: "Boys vs Girls",
			radius: "100%",
			showInLegend: true,
			startAngle: 90,
			type: "doughnut",
			dataPoints: [
				{ y: girls, name: "비회원", color: "#E7823A" },
				{ y: boys, name: "회원", color: "#546BC1" }
			]
		}]
	};
	
	var newVSReturningVisitorsOptions = {
		animationEnabled: true,
		theme: "light2",
		title: {
			text: "회원/비회원 별 방문횟수"
		},
		legend: {
			fontFamily: "calibri",
			fontSize: 14,
			itemTextFormatter: function (e) {
				return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
			}
		},
		data: []
	};
	
	var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["Boys vs Girls Visitors"];
	chart.render();
}
</script>
<style>
.included {
	margin-top: 0px;
}
</style>
</head>
<body class="included">
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
