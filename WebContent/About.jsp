<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 원하는 차트 페이지가 변수 req에 저장된다. 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String req = request.getParameter("whatchart");
	
	if(req==null){
		// Lecture List 를 통해 접속하지 않아서  무슨 강의 페이지를 원하는지 알려주지 않는 접속
		req = "PageVisitingCntGraph";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About HelloLinux</title>
	<link rel="stylesheet" type="text/css" href="css/About.css" />
</head>
<body>
	<nav>
		<ul class="chartlist">
			<li><a href="About.jsp?whatchart=PageVisitingCntGraph">페이지 별 방문자 수</a></li>
			<li><a href="About.jsp?whatchart=SignedNotSignedVisitCnt">회원/비회원 방문자 수</a></li>
			<li><a href="About.jsp?whatchart=MaleFemaleMember">여자/남자 회원 수</a></li>
			<li><a href="Home.jsp">Home</a></li>
		</ul>
	</nav>
	<hr><br>
	<article>
		<% if(req != null){
					if(req.equals("PageVisitingCntGraph")) { %>
						<jsp:include page="PageVisitingCntGraph.jsp" flush="false" />
					<%} else if(req.equals("MaleFemaleMember")) { %>
						<jsp:include page="MaleFemaleMember.jsp" flush="false" />
					<%} else if(req.equals("SignedNotSignedVisitCnt")) { %>
						<jsp:include page="SignedNotSignedVisitCnt.jsp" flush="false" />
					<%}
			}%>
	</article>
</body>
</html>