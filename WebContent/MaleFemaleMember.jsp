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

var girls = <%= memberDAO.getFemaleMemberCnt() %>;
			
var boys =  <%= memberDAO.getMaleMemberCnt() %>; 
var totalVisitors = girls + boys;

var visitorsData = {
	"Boys vs Girls Visitors": [{
//		click: visitorsChartDrilldownHandler,
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
		text: "여성회원 수 vs 남성회원 수"
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
	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<button class="btn invisible" id="backButton">< Back</button>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
