<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/Join.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
    <link rel="shortcut icon" type="image/x-icon" href="home/img/logo.png"/>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		window.onload = function(){
			document.getElementById("work_etc").disabled = true;
			document.getElementById("belong_etc").disabled = true;
			$("#ckMsg").css("display", "none");
		}
		
		/******************** 비밀번호와 비밀번호 확인 창 입력이 같은지 알려주는 함수 ********************/
		
		function isPasswdEqualPasswdCheck(){
			var pswd = $("#pswd");
			var pswdCk = $("#pswdCk");
			/*var ckMsg = document.getElementById("ckMsg");
			if(pswd.val() == ""){ 
				ckMsg.innerHTML="<font color='red'>* 필수 정보입니다.</font>";
			}
			else */
			if(pswd.val() != pswdCk.val()){
				return false;
				//ckMsg.innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
			}
			else {
				return true;
				//
			}
		}
		
		/****************************************************************************/
		
		/**************** form 검사 통과해야 submit *****************/
		
		function checkForm(){
			var name = document.getElementById("name");
			var email = document.getElementById("email");
			var passwd = document.getElementById("pswd");
			var passwdCheck = document.getElementById("pswdCk");
			
			if(!name.value){
				name.focus();
				return false;
			}
			else if(!email.value){
				email.focus();
				return false
			}
			else if(!passwd.value){
				passwd.focus();
				return false;
			}
			else if(!passwdCheck.value){
				passwdCheck.focus();
				return false;
			}
			else if (!isPasswdEqualPasswdCheck()){
				passwd.focus();
				return false;
			}
			else if($(':radio[name="sex"]:checked').length < 1){
			// '성별' 선택지가 아무것도 선택되어있지 않은경우
				var sex = document.getElementById("sex");
				sex.scrollIntoView(); // id="sex" 태그가 있는 위치로 이동 
				
				// '성별' 글자 깜빡이기 효과
				var cnt = 0;
				var sexAnimation = setInterval(function (){
					if($("#sex").css("color") == "rgb(255, 0, 0)"){
						$("#sex").css("color", "rgb(0, 0, 0)");
					} else {
						$("#sex").css("color", "rgb(255, 0, 0)");
					}
					cnt++;
					if(cnt > 9) clearInterval(sexAnimation);
				}, 250);
				
				return false;
			}
			
		/*********** '직업' 선택지가 아무것도 선택되어있지 않은경우 ************/
			if($('input:radio[name="work"]:checked').length < 1){
				
				
					var work = document.getElementById("work");
					work.scrollIntoView(); // id="work" 태그가 있는 위치로 이동 
					
					// '직업' 글자 깜빡이기 효과
					var cnt = 0;
					var workAnimation = setInterval(function (){
						if($("#work").css("color") == "rgb(255, 0, 0)"){
							$("#work").css("color", "rgb(0, 0, 0)");
						} else {
							$("#work").css("color", "rgb(255, 0, 0)");
						}
						cnt++;
						if(cnt > 9) clearInterval(workAnimation);
					}, 250);
					
					return false;
			}
			else if($('input:radio[name="work"]:checked').val() == "work_etc"){
				// 직업 선택지에서 '직접입력'이 선택되었는데 직접입력 텍스트박스가 비어있는 경우
				var workEtc = document.getElementById('work_etc');
				if(!workEtc.value) {
					workEtc.focus();
					return false;
				}
			}
		/************************************************************/
			
		/************ '소속' 선택지가 아무것도 선택되어있지 않은경우 ***************/
			if($(':radio[name="belong"]:checked').length < 1){
				
					var belong = document.getElementById("belong");
					belong.scrollIntoView(); // id="belong" 태그가 있는 위치로 이동 
					
					// '소속' 글자 깜빡이기 효과
					var cnt = 0;
					var belongAnimation = setInterval(function (){
						if($("#belong").css("color") == "rgb(255, 0, 0)"){
							$("#belong").css("color", "rgb(0, 0, 0)");
						} else {
							$("#belong").css("color", "rgb(255, 0, 0)");
						}
						cnt++;
						if(cnt > 9) clearInterval(belongAnimation);
					}, 250);
					
					return false;
			}
			else if($(':radio[name="belong"]:checked').val() == "belong_etc"){
				var belongEtc = document.getElementById('belong_etc');
				if(!belongEtc.value) {
					belongEtc.focus();
					return false;
				}
			}
		/************************************************************/
			
			return true;
		}
		
		function passwdCheckMsg(){
			var ckMsg = document.getElementById("ckMsg");
			
			if(document.getElementById("pswd").value == "" ||  document.getElementById("pswdCk").value == "") {
				$("#ckMsg").css("display", "none");
			}
			else if(!isPasswdEqualPasswdCheck()){
				$("#ckMsg").css("display", "inline");
				ckMsg.innerHTML="<font color='red'>비밀번호가 일치하지 않습니다.</font>";
			} else {
				$("#ckMsg").css("display", "inline");
				ckMsg.innerHTML="<font color='green'>비밀번호가 일치합니다.</font>";
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
			<input type="password" name="passwd" id="pswd" placeholder="비밀번호" onchange="passwdCheckMsg();" size=15 maxlength="20">
			<br><br>
			<input type="password" id="pswdCk" placeholder="비밀번호 확인" onchange="passwdCheckMsg();" size=15 maxlength="20">
			<span id="ckMsg"></span>
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
			<div id="sex">성별<br></div>
				남<input type="radio" name="sex" value="male"> &nbsp;
				여<input type="radio" name="sex" value="female">
			<br><br>
		 	<div id="work">직업<br></div>
			 	학생<input type="radio" name="work" value="student" onClick="this.form.work_etc.disabled=true">&nbsp;
				무직<input type="radio" name="work" value="none" onClick="this.form.work_etc.disabled=true">
				직접입력<input type="radio" name="work" value="work_etc" onClick="this.form.work_etc.disabled=false">
				<input type="text" name="work_etc" id="work_etc" placeholder="직업" size=20>
		 	<br><br>
			<div id="belong">소속<br></div>
				없음<input type="radio" name="belong" value="none" onClick="this.form.belong_etc.disabled=true">&nbsp;
				직접입력<input type="radio" name="belong" value="belong_etc" onClick="this.form.belong_etc.disabled=false">
			 	<input type="text" name="belong_etc" id="belong_etc" placeholder="학교명 또는 회사명" size=20>
		 	<br><br>
			<input type="submit" name="submit" value="가입하기">
			<br><br>
		</form>
	</div>
	<footer>Copyright ⓒ 2016-2019 Hello Linux</footer>
</body>
</html>