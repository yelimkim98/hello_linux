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
			$('#right_console').css("width", ($(document).width() * 0.45)  + "px");
			$('#left_lecture').css("width" , (($(document).width() - $('#right_console').width()) * 0.95) + "px");
			
			$('#left_lecture').css("height" , $(document).height() + "px");
			$('#right_console').css("height", $(document).height() + "px");
			
			$(window).resize(function(){
				$('#right_console').css("width", ($(document).width() * 0.45)  + "px");
				$('#left_lecture').css("width" , (($(document).width() - $('#right_console').width()) * 0.95) + "px");
			})
		})		
	</script>

<!------------------------------------------------>

</head>
<body>
	<section id="left_lecture"> <!-- 왼쪽의 강의 내용 -->
		<article id="in_lecture">
			<% if(req != null){
				   if(req.equals("2-1")) {%>
						<%@include file="lecture_text_files/Ch2-1.jsp" %>
				<% } else if(req.equals("2-2")) {%>
						<%@include file="lecture_text_files/Ch2-2.jsp" %>
				<% } else if(req.equals("2-3")) {%>
						<%@include file="lecture_text_files/Ch2-3.jsp" %>
				<% } %>
			<% } %>
		</article>
	</section>
	<section id="right_console"> <!-- 오른쪽의 실습창 -->
		<div id="console_nav">
			<%="<a href=\"LecViewDefault.jsp?lec=" + req + "\">▶접기</a>" %>
		</div>
		<iframe src="Shell.jsp" id="console_iframe" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0>
			
		</iframe>
	</section>
</body>
</html>