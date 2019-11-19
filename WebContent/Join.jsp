<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="utf-8">
    <link type="text/css" rel="stylesheet" href="/temp.css">
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
		}}
		
	</script>
<style>
	* {padding: 0; margin: 0;}
	body, div{
		width: 100%;
		height: 100%;
	}
	table, tr, td{
		vertical-align: middle;
		border: 1px solid white;
		border-collapse: separate;
		border-spacing: 20px;
		padding: 5px;
	}
	tr{
		width: 500px;
	}
	span{
		font-size: 15px;
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
    .alignCt{
    	text-align: center;
    }
    #login_main {
    	display: block;
    	margin: auto;
    	text-align: center;
    }
    table{
    	width: 500px;
    	margin: 0 auto;
    }
    input{
    	line-height: 30px;
    	width: 450px;
    	height: 30px;
    }
    .birth{
    	width:100px;
    }
</style>
</head>
<body onmousedown="passwordCk();">
	<div id="join_main" align = center>
		<form method="post" action="#" name="join">
			  <table align="center" border="1">
			 
			  <tr><td colspan="3" class="alignCt"><a href="Home.jsp" class="title">HELLO LINUX&nbsp;&nbsp;&nbsp;</a></td></tr>
			  <tr><td colspan="3">
			  	아이디 <br><input type="text" id="userid" size=20>
			  </td></tr>
			  <tr><td colspan="3">
			  	비밀번호<br> <input type="password" id="pswd" size=20 maxlength="20">
			  </td></tr>
			  <tr><td colspan="3">
			  	비밀번호 확인<br>
			     <input type="password" id="pswdCk" size=20 maxlength="20">
			     <br><span id="ckMsg"></span>
			 </td></tr>

			<tr><td class="birth">년도<br>
				<input type="text" class="birth" id="birth_y" size=5></td>
			 	<td class="birth">월<br>
			 	<input type="text" class="birth" id="birth_m" size=5></td>
			 	<td class="birth">일<br>
			 	<input type="text" class="birth" id="birth_d" size=5>
			 	</td>
			 </tr>
			 <tr>
			 	<td colspan="3">이메일<br>
			 	<input type="email" id="email" size="60"></td>
			 </tr>
			 <tr>
			 	<td>성별
			 		<input type="radio" name="gender" value="m">&nbsp;&nbsp;&nbsp;&nbsp;남
			 		<input type="radio" name="gender" value="f">여
			 	</td>

			 </tr>
			 <tr>
			 	<td>직업<br>
			 	<input type="text" id="userid" size=20></td>
			 	<td colspan="2">소속<br>
			 	<input type="text" id="userid" size=20></td>
			 </tr>

			 <tr> 
				<td colspan="3"> 
			        <input type="submit" name="Submit" value="가입하기"></td>
			  </tr>
			  <tr><td colspan="3"><hr width="448"></td></tr>
			  <tr><td colspan="3" class="alignCt">Copyright ⓒ 2016-2019 Hello Linux&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
		</table>
		</form>
	</div>
</body>
</html>
