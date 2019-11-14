<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
    <link type="text/css" rel="stylesheet" href="/temp.css">
    <link rel="shortcut icon" type="image/x-icon" href="../web/chat.png"/>
    <title>HELLO UNIX</title>
<script>
	var redNow = 1;
	function highlight(cell) {
        redNow == 1 ? redNow = 0 : redNow.style.borderColor = "white";
        redNow = cell;
        cell.style.borderColor = "green";
    }
	window.onload = function(){
		var login_main = document.getElementById("login_main");
		login_main.style.position = "absolute";
		login_main.style.top = ((window.innerHeight / 2) - (login_main.offsetHeight / 2)) + "px";
	}
	
</script>
<style>
	* {padding: 0; margin: 0;}
	table, tr, td{
		text-align: center;
		vertical-align: middle;
		border: 1px solid black;
		border-collapse: separate;
		border-spacing: 20px;
		padding: 5px;
	}
	.bottom{
		font-size: 10px;
	}
	.title{
    	padding-top:20px;
    	font-family:impact;
    	font-size:45px;
    }
	a{
        text-decoration: none;
        color: black;
    }
    div{
    	margin: auto;
    	text-align: center;
    	vertical-align: middle;
    }
    table{
    	width: 500px;
    	margin: 0 auto;
    }
    input{
    	line-height: 30px;
    	width: 400px;
    	height: 30px;
    }
</style>
</head>
<body>
<div id="login_main" align = center>
<form method="post" action="login.jsp" name="login">
  <table align="center" border="1">
 
  <tr><td colspan="3"><a href="home.jsp" class="title">HELLO LINUX</a></td></tr>
  <tr><td colspan="3" onmousedown="highlight(this);"><input type="text" name="userid" size=10 placeholder="아이디"></tr>
  <tr><td colspan="3" onmousedown="highlight(this);"><input type="password" name="passwd" placeholder="비밀번호"></td></tr>
  <tr> 
    <td colspan="3" align="center"> 
        <input type="submit" name="Submit" value="로그인"></td>
  </tr>
  <tr><td colspan="3"><hr></td></tr>
  <tr class="bottom">
  	<td><a href="#"> 아이디 찾기
  	<td><a href="#"> 비밀번호 찾기
  	<td><a href="#"> 회원가입
  </tr>
  <tr><td colspan="3">Copyright ⓒ 2016-2019 Hello Linux</td></tr>
</table>
</form>
</div>
</body>
</html>