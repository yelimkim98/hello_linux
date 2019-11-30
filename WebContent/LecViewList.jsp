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
	final String URL = "HelloLinux/LecViewList.jsp";
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
	<meta charset="UTF-8">
	<title>Hello Linux Lecture</title>
	<!---------------------- 한국어 웹폰트 적용 ------------------------>
	
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Myeongjo&display=swap" rel="stylesheet">
		<style>
			header {
				/* 상단의 나타났다가 없어졌다가 하는 부분에 폰트 적용 */
				font-family: 'Nanum Gothic Coding', monospace;
			}
			article, .lecture_list {
				/* 본문(목차)에 폰트 적용 */
				font-family: 'Nanum Myeongjo', serif;
			}
		</style>
	
	<!------------------------------------------------------------>
	<link rel="stylesheet" type="text/css" href="css/LecViewList.css?after" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
</head>
<body>
	<nav style="z-index: 1000;">
		<header>
			<%@ include file="include/TopNavigation.jsp" %>
		</header>
	</nav>
	<div>
		<div id="left_lecture_list" style="z-index: -1;">
			<table>
				<tr>
					<td>
						<nav class="lecture_list">
							<ul>
								<li>Ch1 : 리눅스란?</li>
								<ul>
									<li>1.1 운영체제란?</li>
									<li>1.2 리눅스 소개</li>
								</ul>
								<li>Ch2 : 리눅스 기본 명령어</li>
								<ul>
									<li><a href="LecViewDefault.jsp?lec=2-1">2.1 ls 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-2">2.2 cd 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-3">2.3 pwd 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-4">2.4 touch 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-5">2.5 rm 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-6">2.6 mkdir 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-7">2.7 rmdir 명령어 </a></li>
									<li><a href="LecViewDefault.jsp?lec=2-8">2.8 cp 명령어</a></li>
									<li><a href="LecViewDefault.jsp?lec=2-9">2.9 mv 명령어</a></li>
								</ul>
								<li>Ch3 : vi 사용하기</li>
								<ul>
									<li>3.1 vi로 파일 작성하기 : 명령모드, 입력모드, 마지막 줄 모드 (1)</li>
									<li>3.2 vi로 파일 작성하기 : 명령모드, 입력모드, 마지막 줄 모드 (2)</li>
									<li>3.3</li>
									<li>3.4</li>
									<li>3.5</li>
								</ul>
							</ul>
						</nav>
					</td>
					<td id="fold_td">
						<%="<a id=\"fold_a\" href=\"LecViewDefault.jsp?lec=" + req + "\">" %>
							<div id="fold">
								◀<br>접<br>기
							</div>
						<%= "</a>" %>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="right_lecture" style="z-index: -1;">
		<article id="in_lecture">
			<% if(req != null){
					// req 에는 원하는 강의 페이지가 저장되어있다. 
					// ex) req = "2-2"; 
					if(req.equals("2-1")) { %>
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
	</div>

</body>
</html>