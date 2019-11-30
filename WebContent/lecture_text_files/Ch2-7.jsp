<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>rmdir 명령어</h1>
rmdir은 remove directory의 약자로 비어 있는 디렉토리를 삭제할 때 사용하는 명령어입니다.<br>
“rmdir [directory]” 형식으로 사용합니다. <br>
비어있지 않은 경우 디렉토리를 삭제 할 수 없습니다.<br><br>
<!-- <img src="img/ch2-7/r01.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2$ mkdir add<br>
user1@centos7:~/f2$ rmdir add<br>
user1@centos7:~/f2$ mkdir -p dir7/dir8<br>
user1@centos7:~/f2$ rmdir dir7<br>
rmdir: directory "dir7": Directory not empty 
</div><br><br>