<%@ page language="java" pageEncoding="UTF-8"%>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>touch 명령어</h1>
"touch [file]"의 형식으로 두 가지 경우로 나뉩니다.<br><br>
파일이 없는 경우에는 비어있는 파일을 생성합니다.<br><br>
<!-- <img src="img/ch2-4/t01.png"><br><br>-->
<div id = "command-ex">
user1@centos7: ~$ ls<br>
hello.txt<br>
user1@centos7: ~$ touch new<br>
user1@centos7: ~$ ls<br>
hello.txt &nbsp;&nbsp;&nbsp;new<br>
</div><br><br>
파일이 있는 경우 현재시간으로 타임스탬프를 변경합니다.<br><br>
<!-- <img src="img/ch2-4/t02.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ touch new<br>
user1@centos7: ~$ stat new<br>
File: ‘new’<br>
Size: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blocks: 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IO Block: 131072 reqular empty file<br>
Device: 13500010007h/1327144960007d&nbsp;&nbsp;&nbsp;Inode: 41160&nbsp;&nbsp;&nbsp;Links: 1<br>
Access: (0644/-rw-r—r--)&nbsp;&nbsp;&nbsp;Uid: (1126/user1)&nbsp;&nbsp;&nbsp;Gid: (500/ studs)<br>
Access: 2019-11-04 21:47:27.796965254 +0900<br>
Modify: 2019-11-04 21:47:27.796965254 +0900<br>
Change: 2019-11-04 21:47:27.796972079 +0900<br>
Birth: - <br>
</div><br><br>

c.f) 타임스탬프 종류<br>
ctime: change time(최종 상태변경시각)<br>
atime: access time(최종 접근시각)<br>
mtime: modified time(최종 수정시각)<br><br>
touch -t yyyymmddhhmmss 파일: atime과 mtime만을 설정한 시간으로 변경시키고 ctime은 현재시각으로 변경시킵니다.<br><br>
<!--  <img src="img/ch2-4/t03.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ touch new<br>
user1@centos7: ~$ stat new
File: ‘new’<br>
Size: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Blocks: 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IO Block: 131072 reqular empty file<br>
Device: 13500010007h/1327144960007d&nbsp;&nbsp;&nbsp;Inode: 41160&nbsp;&nbsp;&nbsp;Links: 1<br>
Access: (0644/-rw-r—r--)&nbsp;&nbsp;&nbsp;Uid: (1126/user1)&nbsp;&nbsp;&nbsp;Gid: (500/ studs)<br>
Access: 2019-11-04 05:55:11.000000000 +0900<br>
Modify: 2019-11-04 05:55:11.000000000 +0900<br>
Change: 2019-11-04 21:52:04.741165174 +0900<br>
Birth: - <br>
</div><br><br>
touch -c [file]: 파일이 없는 경우에는 빈 파일을 만들지 않습니다.<br><br>
<!-- <img src="img/ch2-4/t04.png"><br><br>-->
<div id="command-ex">
user1@centos7: ~$ touch –c newnew<br>
user1@centos7: ~$ ls<br>
hello.txt
</div>
<br><br>



