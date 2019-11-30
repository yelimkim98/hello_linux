<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>cp 명령어</h1>
copy의 약자로 파일이나 디렉토리를 복사할 때 사용하는 명령어입니다.<br><br>
<!-- <img src="img/ch2-8/cp01.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2$ touch copy1<br>
user1@centos7:~/f2$ cp copy1 copy2<br>
user1@centos7:~/f2$ ls copy2<br>
copy2
</div><br><br>
cp -b [file]: 복사 대상 파일이 이미 존재하는 경우를 대비해서 백업파일을 만듭니다.<br>
cp -f [file]: 복사 대상 파일이 이미 존재하면 이미 존재하는 파일을 지우고 복사합니다.<br>
cp -i [file]: 복사 대상 파일이 이미 존재하면 사용자에게 덮어쓸 것인지 확인한다.<br><br>
<!-- <img src="img/ch2-8/cp02.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2$ touch copy3<br>
user1@centos7:~/f2$ touch copy4<br>
user1@centos7:~/f2$ cp -i copy3 copy4<br>
cp: overwrite copy4 (yes/no)?
</div><br><br>
cp -r [이름]: 디렉토리를 복사할 경우 하위 디렉토리와 파일을 모두 복사합니다.<br><br>
