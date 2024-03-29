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

<jsp:useBean id="visitLogDAO" scope="page" class="helloLinux.log.VisitLogDAO" />

<%
	/* 페이지 방문 로그 남기기*/
	final String URL = "HelloLinux/LecViewDefault.jsp";
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
	<link rel="stylesheet" type="text/css" href="css/LecViewDefault.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	<meta charset="UTF-8">
	<title>Hello Linux Lecture</title>

	<!---------------------- 한국어 웹폰트 적용 ------------------------>
	
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Myeongjo&display=swap" rel="stylesheet">
		<style>
			header {
				/* 상단의 나타났다가 없어졌다가 하는 부분에 폰트 적용 */
				font-family: 'Nanum Gothic Coding', monospace;
			}
			article {
				/* 본문(목차)에 폰트 적용 */
				font-family: 'Nanum Myeongjo', serif;
			}
		</style>
	
	<!------------------------------------------------------------>

	<!------------------------ 목차버튼 & 콘솔버튼 나타났다 사라졌다 하는 기능 ------------------------->
		
		<!-- jQuery import -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		  		crossorigin="anonymous">
		</script>
		<script>
		
			$(document).ready(function(){
				var h = window.innerHeight / 2;
				
				$('#lecture_list').css('top', h + 'px' );
				$('#console').css('top', h + 'px' );
	
				// 페이지에 처음 접속했을 때 화면 크기에 따라서
				// 목록 버튼과 실습창 버튼 보여줄지 말지
				if( ( $(document).width() - $('#lecText').width() ) / 4 > 40){
					$('#lecture_list').css('display', 'block');
					$('#console').css('display', 'block');
				}
				else {
					$('#lecture_list').css('display', 'none');
					$('#console').css('display', 'none');
				}
	
				// 화면 크기가 변경됬을 때, 목록 버튼과 실습창 버튼을 보여줄지 말지
				$(window).resize(function(){
					if( ( $(document).width() - $('#lecText').width() ) / 4 > 40){
						$('#lecture_list').css('display', 'block');
						$('#console').css('display', 'block');
					}
					else {
						$('#lecture_list').css('display', 'none');
						$('#console').css('display', 'none');
					}
				})
			})
		</script>
	
	<!----------------------------------------------------------------------------------->
	
</head>
<body>
	<nav>
		<header>
			<%@ include file="include/TopNavigation.jsp" %>
		</header>
	</nav>
	<section>
		<article id="lecture_list">
			<%="<a href=\"LecViewList.jsp?lec=" + req + "\">▶ 목차</a>"%>
		</article>
		<article id="console">
			<%="<a href=\"LecViewConsole.jsp?lec=" + req + "\">실습창 ◀</a>"%>
		</article>
		<article class="lecture_text" id="lecText">
			<% if(req != null){
					// req 에는 원하는 강의 페이지가 저장되어있다. 
					// ex) req = "2-2"; 
					if (req.equals("1-1")){ %>
						<%@include file="lecture_text_files/Ch1-1.jsp" %>
					<% } else if(req.equals("1-2")) { %>
					
					<% } else if(req.equals("2-1")) { %>
						<%@include file="lecture_text_files/Ch2-1.jsp" %>
					<%} else if(req.equals("2-2")) { %>
						<%@include file="lecture_text_files/Ch2-2.jsp" %>
					<%} else if(req.equals("2-3")) { %>
						<%@include file="lecture_text_files/Ch2-3.jsp" %>
					<%} else if(req.equals("2-4")){ %>
						<%@include file="lecture_text_files/Ch2-4.jsp" %>
					<%} else if(req.equals("2-5")){ %>
						<%@include file="lecture_text_files/Ch2-5.jsp" %>
					<%} else if(req.equals("2-6")){ %>
						<%@include file="lecture_text_files/Ch2-6.jsp" %>
					<%} else if(req.equals("2-7")){ %>
						<%@include file="lecture_text_files/Ch2-7.jsp" %>
					<%} else if(req.equals("2-8")){ %>
						<%@include file="lecture_text_files/Ch2-8.jsp" %>
					<%} else if(req.equals("2-9")){ %>
						<%@include file="lecture_text_files/Ch2-9.jsp" %>
					<%}
			}%>
		</article>
	</section>
	<footer>
		Copyright ⓒ 2016-2019 Hello Linux
	</footer>
</body>
</html>