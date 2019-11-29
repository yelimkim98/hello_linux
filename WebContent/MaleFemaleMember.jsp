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

var girls = <%= visitLogDAO.getNotMemberVisitingCnt() %>	<%-- 방문자중 회원이 아닌 방문자 수 --%>
			<%--	<%= memberDAO.getFemaleMemberCnt() %>; 	--%> <%-- 회원 중 여성인 회원의 수 --%>
			
var boys =  <%= visitLogDAO.getMemberVisitingCnt() %> <%-- 회원의 방문 횟수 --%>
			<%-- <%= memberDAO.getMaleMemberCnt() %>; --%>
var totalVisitors = girls + boys;

var visitorsData = {
	"Boys vs Girls Visitors": [{
		click: visitorsChartDrilldownHandler,
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
			{ y: girls, name: "Girls", color: "#E7823A" },
			{ y: boys, name: "Boys", color: "#546BC1" }
		]
	}],
	"Girls": [{
		color: "#E7823A",
		name: "Girls",
		type: "column",
		dataPoints: [
			{ x: new Date("1990"), y: 3 },
			{ x: new Date("2000"), y: 3 },
			{ x: new Date("2010"), y: 4 }
		]
	}],
	"Boys": [{
		color: "#546BC1",
		name: "Boys",
		type: "column",
		dataPoints: [
			{ x: new Date("1990"), y: 3 },
			{ x: new Date("2000"), y: 3 },
			{ x: new Date("2010"), y: 4 }
		]
	}]
};

var newVSReturningVisitorsOptions = {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "Boys VS Girls Visitors"
	},
	subtitles: [{
		text: "Click on Any Segment to Drilldown",
		backgroundColor: "#2eacd1",
		fontSize: 16,
		fontColor: "white",
		padding: 5
	}],
	legend: {
		fontFamily: "calibri",
		fontSize: 14,
		itemTextFormatter: function (e) {
			return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
		}
	},
	data: []
};

var visitorsDrilldownedChartOptions = {
	animationEnabled: true,
	theme: "light2",
	axisX: {
		labelFontColor: "#717171",
		lineColor: "#a2a2a2",
		tickColor: "#a2a2a2"
	},
	axisY: {
		gridThickness: 0,
		includeZero: false,
		labelFontColor: "#717171",
		lineColor: "#a2a2a2",
		tickColor: "#a2a2a2",
		lineThickness: 1
	},
	data: []
};

var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
chart.options.data = visitorsData["Boys vs Girls Visitors"];
chart.render();

function visitorsChartDrilldownHandler(e) {
	chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.name];
	chart.options.title = { text: e.dataPoint.name }
	chart.render();
	$("#backButton").toggleClass("invisible");
}

$("#backButton").click(function() { 
	$(this).toggleClass("invisible");
	chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["Boys vs Girls Visitors"];
	chart.render();
});

}
</script>
<style>
  #backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
  }
  .invisible {
    display: none;
  }
</style>
</head>
<body>
	<nav>
		<a href="PageVisitingCntGraph.jsp">뷰 페이지 별 방문자 수</a>
	</nav>
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<button class="btn invisible" id="backButton">< Back</button>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
