<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/Find.css" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
    <link rel="shortcut icon" type="image/x-icon" href="home/img/logo.png"/>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Noto Sans KR', sans-serif;
		}
	</style>
    <title>HELLO UNIX</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		window.onload = function(){
			
		/****************** 생년월일의 select box 세팅 *********************************/
		var date = new Date();
		var year = date.getFullYear();
		var selectYear = document.getElementById("birth_y");
		var selectMonth = document.getElementById("birth_m");
		var selectDay = document.getElementById("birth_d");
		var yIndex = 0;
		var mIndex = 0;
		var dIndex = 0;
		
		for(var i=year-22;i<=year;i++){
			selectYear.add(new Option(i), yIndex++);
		}
		for(var j=1;j<=12;j++){
			selectMonth.add(new Option(j), mIndex++);
		}
		for(var k=1;k<=31;k++){
			selectDay.add(new Option(k), dIndex++);
		}
	}
		
		/**************** form 검사 통과해야 submit *****************/
		
		function checkForm(){
			var name = document.getElementById("name");
			var email = document.getElementById("email");
			
			if(!name.value){
				alert("이름을 정확하게 입력해주세요");
				name.focus();
				return false;
			}
			else if(!email.value){
				alert("이메일을 정확하게 입력해주세요");
				email.focus();
				return false;
			}
			else if( $("#birth_y option:selected").val() == '선택하세요' || 
					 $("#birth_m option:selected").val() == '선택하세요' ||
					 $("#birth_d option:selected").val() == '선택하세요' ){
			// 생년월일 중 '선택하세요' 항목이 선택되어있는 경우
				alert("생년월일을 정확하게 입력해주세요");
				return false;
			}
			return true;
		}
		
	</script>
<style>
</style>
</head>
<body>
	<div id="find_main">
		<form name="find" method="post" action="UserControl.jsp" onsubmit="return checkForm();">
			<input type="hidden" name="action" value="find">
			<a href="Home.jsp" class="title">HELLO LINUX</a>
			<span>비밀번호 찾기 &nbsp; 〉&nbsp; 본인 확인</span>
			<hr>
			<input type="text" name="name" id="name" placeholder="이름" maxlength="40">
			<input type="text" name="email" id="email" placeholder="이메일" maxlength="40">
			<br><br>
			<div id="birth" class="radio_title">생년월일</div>
			<select name="birth_year" class="birth" id="birth_y">
				<option>선택하세요</option>
			</select>
			년
			<select name="birth_month" class="birth" id="birth_m">
				<option>선택하세요</option>
			</select>
			월
			<select name="birth_day" class="birth" id="birth_d">
				<option>선택하세요</option>
			</select>
			일
			<br><br>
			<input type="submit" name="submit" value="다음">
			<br><br>
		</form>
	</div>
	<footer>Copyright ⓒ 2016-2019 Hello Linux</footer>
</body>
</html>