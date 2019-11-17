<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hello Linux 수업 내용</title>
	<link rel="stylesheet" type="text/css" href="css/LectureList.css?after" />
	<link rel="stylesheet" type="text/css" href="css/footer.css" />
	
	<!-- Korean Font -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding|Nanum+Myeongjo&display=swap" rel="stylesheet">
	<style>
		body {
			font-family: 'Nanum Gothic Coding', monospace;
		}
		.lecture_list {
			font-family: 'Nanum Myeongjo', serif;
		}
	</style>
</head>
<body>
	<nav>
		<header>
			<%@ include file="include/TopNavigation.jsp" %>
		</header>
	</nav>
	<div class="lecture_list">
		<ul>
			<li>Ch1 : 리눅스란?</li>
			<ul>
				<li>1.1 운영체제란?</li>
				<li>1.2 리눅스 소개</li>
			</ul>
			<li>Ch2 : 리눅스 기본 명령어</li>
			<ul>
				<li><a href="LecViewDefault.jsp?lec=2-1">2.1 ls 명령어</a></li>
				<li><a href="LecViewDefault.jsp?lec=2-2">2.2 cd 명령어</a></li>
				<li><a href="LecViewDefault.jsp?lec=2-3">2.3 pwd 명령어</a></li>
				<li>2.4 touch 명령어</li>
				<li>2.5 rm 명령어</li>
				<li>2.6 mkdir 명령어</li>
				<li>2.7 rmdir 명령어 </li>
				<li>2.8 cp 명령어</li>
				<li>2.9 mv 명령어</li>
			</ul>
			<li>Ch3 : vi 사용하기</li>
			<ul>
				<li>3.1 vi로 파일 작성하기 : 명령모드, 입력모드, 마지막 줄 모드 (1)</li>
				<li>3.2 vi로 파일 작성하기 : 명령모드, 입력모드, 마지막 줄 모드 (2)</li>
				<li>3.3</li>
				<li>3.4</li>
				<li>3.5</li>
			</ul>
		</ul>
	</div>
	<br>
	<br>
	
	<footer>
    		copyright
    </footer>
	
</body>
</html>