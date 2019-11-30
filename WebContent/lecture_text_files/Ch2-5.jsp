<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>rm 명령어</h1>
rm은 remove의 약자로 파일이나 디렉토리를 삭제하는 명령어입니다. <br>
"rm [file]" 형식으로 사용합니다.<br><br>
rm -f [file]: 강제로 파일이나 디렉토리를 삭제하는 옵션입니다.<br><br>
<!-- <img src="img/ch2-5/rm01.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ touch ex2<br>
user1@centos7: ~$ ls ex2<br>
ex2<br>
user1@centos7: ~$ rm ex2<br>
user1@centos7: ~$ ls ex2<br>
ex2: No such file or directory
</div><br><br>
rm -I [file]: 파일이나 디렉토리를 삭제할 때, 최종적으로 삭제할 것인지 다시 물어보는 옵션입니다.<br><br>
<!-- <img src="img/ch2-5/rm02.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ touch ex2<br>
user1@centos7: ~$ rm –i ex2<br>
rm: remove ex2 (yes/no)? y
</div><br><br>
rm – r [directory]: 하위 디렉토리를 포함하여 모든 내용을 삭제합니다.(디렉토리를 삭제하고 싶을 때 필수적으로 주어야 하는 옵션입니다.)<br><br>
<!--<img src="img/ch2-5/rm03.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ mkdir dir<br>
user1@centos7: ~$ rm dir<br>
rm: dir is a directory<br>
user1@centos7: ~$ rm –r dir<br>
user1@centos7: ~$ ls dir<br>
dir: No such file or directory
</div><br><br>