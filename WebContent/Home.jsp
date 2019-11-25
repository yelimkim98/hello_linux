<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/Home.css?after" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	<meta charset="UTF-8">
	<title>Hello Linux</title>
	
	<!-- Korean Font -->	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Nanum Gothic Coding', monospace;
		}
		
	</style>
</head>
<body>
    <header>
    	<nav>
    		<a href="Home.jsp">
		    	<ul class="left-ul">
		    		<li><img src="img/home/logo.png" width="30px" height="30px"></li>
		    		<li>HELLO LINUX</li>
		    	</ul>
	    	</a>
	    	<ul class="right-ul">
	       		<li>ABOUT</li>
	       		<li><a href="Login.jsp">LOGIN</a></li>
	       		<li><a href="Join.jsp">회원가입</a></li>
	        </ul>
        </nav>
        <div align="center">
            <span>HELLO</span>
            <span class="linux">LINUX </span>
            <p class="page_des">LEARN LINUX IN BETTER WAY AND LEVEL UP YOUR CAREER</p>
            <div class="lecture_list"><a href="LectureList.jsp">go to learn</a></div>
        </div>
    </header>
    <section>
	    <div class="site-description" align="center">
	    <table>
	    <tr>
	    <td>
	    <p class="ch1">
	    Chapter1<br>
	    리눅스 <br>소개
	    </p>
	    </td>
	    <td>
	    <p class="ch2">
	    Chapter2<br>
	    기본 <br>명령어
	    </p>
	    </td>
	    <td>
	    <p class="ch3">
	    Chapter3<br>
	    vi <br>사용하기
	    </p>
	    </td>
	    </tr>
	    </table>
	    </div>
    </section>
    <footer>
    		Copyright ⓒ 2016-2019 Hello Linux
    </footer>
</body>
</html>