<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>mkdir 명령어</h1>
mkdir은 make directory의 약자로 디렉토리를 생성할 때 사용하는 명령어입니다. <br>
"mkdir [directory]" 형식으로 사용합니다.<br><br>
mkdir -m [umask] [directory]: 디렉토리를 생성할 때 권한을 설정할 수 있습니다.<br><br>
<!-- <img src="img/ch2-6/mk01.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ mkdir -m 755 testdir<br>
user1@centos7: ~$ stat testdir<br>
File: 'testdir'<br>
Size: 2 &nbsp;&nbsp;&nbsp;Blocks: 3 &nbsp;&nbsp;&nbsp; IO Block: 131072 directory<br>
Device : 13500010007h/1327144960007d &nbsp;&nbsp;&nbsp; Inode: 41167 &nbsp;&nbsp;&nbsp; Links: 2<br>
Access: (0755/drwxr-xr-x) Uid: (1126/user1) Gid: (500/studs)<br>
</div><br><br>
mkdir -p [상위 디렉토리]/[하위디렉토리]: 상위 경로도 함께 생성합니다.<br><br>
<!-- <img src="img/ch2-6/mk02.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ mkdir -p f2/f3<br>
user1@centos7: ~$ cd f2<br>
user1@centos7: ~/f2$ ls<br>
f3
</div><br><br>