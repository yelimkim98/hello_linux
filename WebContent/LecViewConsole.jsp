<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="visitLogDAO" scope="page" class="helloLinux.log.VisitLogDAO" />

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

<%
	/* 페이지 방문 로그 남기기*/
	final String URL = "HelloLinux/LecViewConsole.jsp";
	String lectureURL = "HelloLinux/Ch" + req + ".jsp";
	
	if(session.getAttribute("email") != null) {
		visitLogDAO.visitLogging(URL, session.getAttribute("email").toString());
		visitLogDAO.visitLogging(lectureURL, session.getAttribute("email").toString());
	}
	else {
		visitLogDAO.visitLogging(URL);
		visitLogDAO.visitLogging(lectureURL);
	}
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/LecViewConsole.css" />
	<meta charset="UTF-8">
	<title>Hello Linux Lecture</title>
	
<!---------------------- 한국어 웹폰트 적용 ------------------------>

	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Myeongjo&display=swap" rel="stylesheet">
	<style>
		article {
			/* 본문(목차)에 폰트 적용 */
			font-family: 'Nanum Myeongjo', serif;
		}
	</style>

<!------------------------------------------------------------>
	
	
<!------------- 영역을 좌우 절반으로 나누기 ---------------->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		var screenWidth;
		$(document).ready(function(){
			$('#right_console').css("width", ($(document).width() * 0.45)  + "px");
			$('#left_lecture').css("width" , (($(document).width() - $('#right_console').width()) * 0.95) + "px");
			
			$('#left_lecture').css("height" , $(document).height() + "px");
			$('#right_console').css("height", $(document).height() + "px");

			// ifame 에 우측 창 크기 전달
			screenWidth = $('#right_console').width(); 
			
			$(window).resize(function(){
				$('#right_console').css("width", ($(document).width() * 0.45)  + "px");
				$('#left_lecture').css("width" , (($(document).width() - $('#right_console').width()) * 0.95) + "px");
				
				// ifame 에 우측 창 크기 전달
				screenWidth = $('#right_console').width(); 
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
				<% } else if(req.equals("2-4")) {%>
						<%@include file="lecture_text_files/Ch2-4.jsp" %>
				<% } else if(req.equals("2-5")) {%>
						<%@include file="lecture_text_files/Ch2-4.jsp" %>
				<% } %>
			<% } %>
		</article>
	</section>
	<section id="right_console"> <!-- 오른쪽의 실습창 -->
		<div id="console_nav">
			<%="<a href=\"LecViewDefault.jsp?lec=" + req + "\">▶접기</a>" %>
		</div>
		<iframe src="Shell.jsp" id="console_iframe"
				frameborder=0 framespacing=0 marginheight=0 marginwidth=0 vspace=0>
			
		</iframe>
	</section>
</body>
</html>