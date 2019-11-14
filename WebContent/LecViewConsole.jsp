<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 원하는 강의 페이지가 변수 req에 저장된다. ex) req = "2-2"; 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String req = request.getParameter("lec");
	
	if(req==null){
		// Lecture List 를 통해 접속하지 않아서  무슨 강의 페이지를 원하는지 알려주지 않는 접속
		response.sendRedirect("Home.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/LecViewConsole.css" />
	<meta charset="UTF-8">
	<title>Hello Linux Lecture</title>
	
<!------------- 영역을 좌우 절반으로 나누기 ---------------->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		$(document).ready(function(){
			$('#left_lecture').css("width" , ($(document).width() / 2) + "px");
			$('#right_console').css("width", ($(document).width() / 2)  + "px");
			$('#left_lecture').css("height" , $(document).height() + "px");
			$('#right_console').css("height", $(document).height() + "px");
			
			$(window).resize(function(){
				$('#left_lecture').css("width" , ($(document).width() / 2) + "px");
				$('#right_console').css("width", ($(document).width() / 2) + "px");
			})
		})		
	</script>

<!------------------------------------------------>

</head>
<body>
	<section id="left_lecture"> <!-- 왼쪽의 강의 내용 -->
		<article id="in_lecture">
			<%@include file="lecture_text_files/Ch2-1.jsp" %>
		</article>
	</section>
	<section id="right_console"> <!-- 오른쪽의 실습창 -->
		<div id="console_nav">
			▶ 접기
		</div>
		<div id="in_console">
			console 영역
		</div>
		
	</section>
</body>
</html>