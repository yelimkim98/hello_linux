<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/Join.css" />
    <link rel="shortcut icon" type="image/x-icon" href="home/logo.png"/>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		//테이블 밖을 클릭하면 적용되지 않음ㅠㅠ
		function passwordCk(){
			var pswd = $("#pswd");
			var pswdCk = $("#pswdCk");
			var chMsg = document.getElementById("ckMsg");
			if(pswd.val() == ""){
				chMsg.innerHTML="<font color='red'>* 필수 정보입니다.</font>";
			}
			else if(pswd.val() != pswdCk.val()){
				chMsg.innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
			}
			else{
				chMsg.innerHTML="<font color='green'>비밀번호가 일치합니다.</font>";	
			}
		}
		
	</script>
<style>
</style>
</head>
<body onmousedown="passwordCk();">
	<div id="join_main">
		<form method="post" action="#" name="join">
			<a href="Home.jsp" class="title">HELLO LINUX</a>
			<br><br>
			<input type="email" id="email" placeholder="이메일" maxlength="40">
			<br><br>
			<input type="password" id="pswd" placeholder="비밀번호" size=15 maxlength="20">
			<br><br>
			<input type="password" id="pswdCk" placeholder="비밀번호 확인" size=15 maxlength="20">&nbsp;<span id="ckMsg"></span>
			<br><br>
			생년월일<br>
			<select class="birth" id="birth_y">
				<option>1998</option>
				<option>1999</option>
				<option>2000</option>
			</select>
			년
			<select class="birth" id="birth_m">
				<option>01</option>
				<option>02</option>
				<option>03</option>
			</select>
			월
			<select class="birth" id="birth_d">
				<option>01</option>
				<option>02</option>
				<option>03</option>
			</select>
			일
			<br><br>
			성별<br>
			남<input type="radio" name="gender" value="male"> &nbsp;
			여<input type="radio" name="gender" value="female">
			<br><br>
		 	직업<br><input type="text" id="userid" size=20>
		 	<br><br>
			소속<br>
		 	<input type="text" id="userid" size=20><br><br>
			<input type="submit" name="Submit" value="가입하기"><br><br>
			Copyright ⓒ 2016-2019 Hello Linux
		</form>
	</div>
</body>
</html>
