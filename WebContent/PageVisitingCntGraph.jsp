<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="memberDAO" class="helloLinux.member.MemberDAO" scope="page" />
<jsp:useBean id="visitLogDAO" class="helloLinux.log.VisitLogDAO" scope="page" />

<!DOCTYPE HTML>
<html>
<head>
<title>HelloLinux/About</title>
<script>
window.onload = function () {

	var home = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/Home.jsp") %>
	var lectureList = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/LectureList.jsp") %>
	var lecViewDefault = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/LecViewDefault.jsp") %>
	var lecViewConsole = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/LecViewConsole.jsp") %>
	var lecViewList = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/LecViewList.jsp") %>
	var login = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/Login.jsp") %>
	var ch2_1 = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/Ch2-1.jsp") %>
	var ch2_2 = <%= visitLogDAO.getViewPageVisitCount("HelloLinux/Ch2-2.jsp") %>
	
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title: {
			text: "페이지 별 방문횟수"
		},
		axisY: {
			title: "방문횟수",
			suffix: "회",
			includeZero: false
		},
		axisX: {
			title: "Countries"
		},
		data: [{
			type: "column",
			yValueFormatString: "#,###\"회\"",
			dataPoints: [
				{ label: "Home", y: home },	
				{ label: "LectureList", y: lectureList },	
				{ label: "LecViewDefault", y: lecViewDefault },
				{ label: "LecViewConsole", y: lecViewConsole },	
				{ label: "LecViewList", y: lecViewList },
				{ label: "Login", y: login },
				{ label: "Ch2-1", y: ch2_1 },
				{ label: "Ch2-2", y: ch2_2 }
				
			]
		}]
	});
	chart.render();

}
</script>
</head>
<body>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>