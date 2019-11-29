<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="visitLogDAO" scope="page" class="helloLinux.log.VisitLogDAO" />

<%
	/* 페이지 방문 로그 남기기*/
	
	boolean isLogined = false;
	
	final String URL = "HelloLinux/Login.jsp";
	
	if(session.getAttribute("email") != null) {
		isLogined = true;
		visitLogDAO.visitLogging(URL, session.getAttribute("email").toString());
	}
	else {
		visitLogDAO.visitLogging(URL);
	}
%>

<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/Login.css?after" />
    <link rel="shortcut icon" type="image/x-icon" href="home/logo.png"/>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		$(document).ready(function(){
			// id 입력창이 포커싱될 때
			$('#id_input').focus(function(){
				$('#id_input_mom').css('border-color', 'rgb(40,80,120)');
			})
			// id 입력창 포커싱이 풀렸을 때
			$('#id_input').blur(function(){
				$('#id_input_mom').css('border-color', 'rgb(200,200,200)');
			})
			// password 입력창이 포커싱될 때
			$('#passwd_input').focus(function(){
				$('#passwd_input_mom').css('border-color', 'rgb(40,80,120)');
			})
			// password 입력창 포커싱이 풀렸을 때
			$('#passwd_input').blur(function(){
				$('#passwd_input_mom').css('border-color', 'rgb(200,200,200)');
			})
		})
	</script>

</head>
<body>
	<div id="login_main" align = center>
		<form method="post" action="UserControl.jsp" name="login">
		<input type="hidden" name="action" value="login">
			  <table align="center" border="1">
				  <tr>
					  	<td colspan="3">
					  		<a href="Home.jsp" class="title">HELLO LINUX</a>
					  	</td>
				  </tr>
				  <tr>
					  	<td id="email_input_mom" colspan="3" onmousedown="highlight(this);">
					  		<input type="text" name="email" id="email_input" size=10 placeholder="이메일">
					  	</td>
				  </tr>
				  <tr>
					  	<td id="passwd_input_mom" colspan="3" onmousedown="highlight(this);">
					  		<input type="password" name="passwd" id="passwd_input" placeholder="비밀번호">
					  	</td>
				  </tr>
				  <tr> 
					    <td colspan="3" align="center"> 
					        <input type="submit" name="submit" value="로그인">
					    </td>
				  </tr>
				  <tr>
				  		<td colspan="3"><hr></td>
				  </tr>
				  <tr class="bottom">
				  		<td><a href="About.jsp"> ABOUT</a></td>
					  	<td><a href="FindAccount.jsp"> 비밀번호 찾기</a></td>
				  		<td><a href="Join.jsp"> 회원가입</a></td>
				  </tr>
				  <tr>
				  		<td colspan="3">Copyright ⓒ 2016-2019 Hello Linux</td>
				  </tr>
			</table>
		</form>
	</div>
</body>
</html>