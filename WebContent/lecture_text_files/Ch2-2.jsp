<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
</head>
<style>
	#command-ex {
		background-color: black;
		color: white;
		margin: 5px;
		padding: 5px;
		margin-bottom: 20px;
		min-height: 80px;
	}
</style>
<h1>cd 명령어</h1>
cd는 change directory의 약자로, cd 명령어를 사용하여 원하는 디렉토리로 이동할 수 있습니다.<br><br>
실습 창에 "cd [directory]" 를 입력해보세요.<br><br>
<!-- <img src="img/ch2-2/cd01.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ mkdir testdir<br>
	user1@centos7: ~$ cd testdir<br>
	user1@centos7: ~/testdir$ pwd<br>
	/testdir
</div>
cd . : 현재 디렉토리로 이동합니다.<br>
cd .. : 한 단계 상위 디렉토리로 이동합니다.<br>
cd / : 최상위 디렉토리인 루트(/)로 이동합니다.<br>
cd - : 이전에 이동한 디렉토리로 이동합니다.<br><br>
<!--  <img src="img/ch2-2/cd02.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~/testdir$ pwd<br>
	/testdir<br>
	user1@centos7: ~/testdir$ cd .<br>
	/testdir<br>
	user1@centos7: ~/testdir$ cd ..<br>
	/
</div>