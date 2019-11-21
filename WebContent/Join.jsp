<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/Join.css" />
    <link rel="shortcut icon" type="image/x-icon" href="home/img/logo.png"/>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		window.onload = function(){
			passwordCk();
		}
		
		/******************** 비밀번호 확인 함수 ********************/
		
		function passwordCk(){
			var pswd = $("#pswd");
			var pswdCk = $("#pswdCk");
			var ckMsg = document.getElementById("ckMsg");
			if(pswd.val() == ""){
				ckMsg.innerHTML="<font color='red'>* 필수 정보입니다.</font>";
			}
			else if(pswd.val() != pswdCk.val()){
				ckMsg.innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
			}
			else{
				ckMsg.innerHTML="<font color='green'>비밀번호가 일치합니다.</font>";	
			}
		}
		
		/*******************************************************/
		
		/**************** form 검사 통과해야 submit *****************/
		
		function checkForm(){
			var name = document.getElementById("name");
			var email = document.getElementById("email");
			var passwd = document.getElementById("pswd");
			var passwdCheck = document.getElementById("pswdCk");
			
			if(!name.value){
				name.focus();
				name.select();
				return false;
			}
			else if(!email.value){
				email.focus();
				email.select();
				return false
			}
			else if(!passwd.value){
				passwd.focus();
				passwd.select();
				return false;
			}
			else if(!passwdCheck.value){
				passwdCheck.focus();
				passwdCheck.select();
				return false;
			}
		}
	</script>
<style>
</style>
</head>
<body>
	<div id="join_main">
		<form name="join" method="post" action="UserControl.jsp" onsubmit="return checkForm();">
			<input type="hidden" name="action" value="new">
			<a href="Home.jsp" class="title">HELLO LINUX</a>
			<br><br>
			<input type="text" name="name" id="name" placeholder="이름" maxlength="40">
			<br><br>
			<input type="text" name="email" id="email" placeholder="이메일" maxlength="40">
			<br><br>
			<input type="password" name="passwd" id="pswd" placeholder="비밀번호" size=15 maxlength="20">
			<br><br>
			<input type="password" id="pswdCk" placeholder="비밀번호 확인" size=15 maxlength="20"
				onchange="passwordCk()">&nbsp;<span id="ckMsg"></span>
			<br><br>
			생년월일<br>
			<select name="birth_year" class="birth" id="birth_y">
				<option value="1998">1998</option>
				<option value="1999">1999</option>
				<option value="2000">2000</option>
			</select>
			년
			<select name="birth_month" class="birth" id="birth_m">
				<option value="1">01</option>
				<option value="2">02</option>
				<option value="3">03</option>
			</select>
			월
			<select name="birth_day" class="birth" id="birth_d">
				<option value="1">01</option>
				<option value="2">02</option>
				<option value="3">03</option>
			</select>
			일
			<br><br>
			성별<br>
			남<input type="radio" name="sex" value="male"> &nbsp;
			여<input type="radio" name="sex" value="female">
			<br><br>
		 	직업<br>
		 	학생<input type="radio" name="work" value="student" onClick="this.form.work_etc.disabled=true">&nbsp;
			무직<input type="radio" name="work" value="none" onClick="this.form.work_etc.disabled=true">&nbsp;
			직접입력<input type="radio" name="work" value="etc" onClick="this.form.work_etc.disabled=false">
			<input type="text" name="work_etc" placeholder="직업" size=20>
		 	<br><br>
			소속<br>
			없음<input type="radio" name="belong" value="none" onClick="this.form.belong_etc.disabled=true">&nbsp;
			직접입력<input type="radio" name="belong" value="etc" onClick="this.form.belong_etc.disabled=false">
		 	<input type="text" name="belong_etc" placeholder="학교명/회사명" size=20>
		 	<br><br>
			<input type="submit" name="submit" value="가입하기">
			<br><br>
			Copyright ⓒ 2016-2019 Hello Linux
		</form>
	</div>
</body>
</html>