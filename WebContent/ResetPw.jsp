<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="visitLogDAO" scope="page" class="helloLinux.log.VisitLogDAO" />

<%
	/* 페이지 방문 로그 남기기*/
	final String URL = "HelloLinux/ResetPw.jsp";
	
	if(session.getAttribute("email") != null) {
		visitLogDAO.visitLogging(URL, session.getAttribute("email").toString());
	}
	else {
		visitLogDAO.visitLogging(URL);
	}
%>

<%
	request.setCharacterEncoding("UTF-8");
	String email = (String)pageContext.getSession().getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/ResetPw.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
    <link rel="shortcut icon" type="image/x-icon" href="home/img/logo.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
		.who{
			color: green;	
		}
	</style>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
	
	function isPasswdEqualPasswdCheck(){
		var pswd = $("#pswd");
		var pswdCk = $("#pswdCk");

		if(pswd.val() != pswdCk.val()){
			return false;
		}
		else {
			return true;
		}
	}
	
	function checkForm(){
		var passwd = document.getElementById("pswd");
		var passwdCheck = document.getElementById("pswdCk");
		
		if(!passwd.value){
			passwd.focus();
			return false;
		}
		else if(!passwdCheck.value){
			passwdCheck.focus();
			return false;
		}
		else if (!isPasswdEqualPasswdCheck()){
			alert("비밀번호를 정확하게 입력해주세요")
			passwd.focus();
			return false;
		}
		return true;
	}
		
	</script>
<style>
</style>
</head>
<body>
	<div id="resetPw_main">
		<form name="reset" method="post" action="UserControl.jsp" onsubmit="return checkForm();">
			<input type="hidden" name="action" value="reset">
			<%= "<input type=\"hidden\" name=\"email\" value=\"" + email +"\">" %>
			<a href="Home.jsp" class="title">HELLO LINUX</a>
			<span>비밀번호 찾기 &nbsp; 〉&nbsp; 본인 확인 &nbsp; 〉&nbsp; </span><span class="who">비밀번호 재설정</span>
			<hr>
			<input type="password" name="passwd" id="pswd" placeholder="비밀번호" onchange="passwdCheckMsg();" size=15 maxlength="20">
			<input type="password" id="pswdCk" placeholder="비밀번호 확인" onchange="passwdCheckMsg();" size=15 maxlength="20">
			<br><br>
			<input type="submit" name="submit" value="확인">
			<br><br>
		</form>
	</div>
	<footer>Copyright ⓒ 2016-2019 Hello Linux</footer>
</body>
</html>