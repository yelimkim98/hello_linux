<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/Command.css" />
</head>
<h1>mv 명령어</h1>
move의 약자로 파일을 이동시키는데 원본 파일이 삭제 되는 것이 기본입니다. 따라서 이름을 바꾸는 경우를 포함하여 여러가지 경우로 나눌 수 있습니다. <br><br>
mv [file1] [file2]: [file1]의 파일명을 [file2]의 파일명으로 변경합니다.<br><br>
<!-- <img src="img/ch2-9/mv01.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2$ touch mvfile<br>
user1@centos7:~/f2$ mv mvfile mvfile2<br>
user1@centos7:~/f2$ ls mvfile<br>
mvfile: No such file or directory<br>
user1@centos7:~/f2$ ls mvfile2<br>
mvfile2
</div><br><br>
mv [file] [directory]: 파일을 디렉토리에 넣습니다.<br><br>
<!-- <img src="img/ch2-9/mv02.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2$ touch mvfile3<br>
user1@centos7:~/f2$ mkdir mvdir<br>
user1@centos7:~/f2$ mv mvfile3 mvdir<br>
user1@centos7:~/f2$ cd mvdir<br>
user1@centos7:~/f2/mvdir$ ls<br>
mvfile3<br><br>
</div>
mv [file1] [file2] [directory]: file1과 file2를 디렉토리에 넣습니다.<br><br>
<!-- <img src="img/ch2-9/mv03.png"><br><br>-->
<div id="command-ex">
user1@centos7:~/f2/mvdir$ mkdir mvdir2<br>
user1@centos7:~/f2/mvdir$ mv mvfile4 mvfile5 mvdir2<br>
user1@centos7:~/f2/mvdir$ cd mvdir2<br>
user1@centos7:~/f2/mvdir/mvdir2$ ls<br>
mvfile4 mvfile5
</div><br><br>
mv [directory1] [directory2]: 디렉토리1의 디렉토리명을 디렉토리2의 디렉토리명으로 변경합니다.<br>
mv -b 원본 사본: 이동경로에 같은 이름의 파일이나 디렉토리가 이미 존재하는 경우를 대비해서 백업파일을 만듭니다.<br>
mv -f 원본 사본: 이동경로에 같은 이름의 파일이나 디렉토리가 이미 존재하는 경우 덮어쓸 것인지 확인하지 않고 덮어씁니다.<br>
mv -i 원본 사본: 이동경로에 같은 이름의 파일이나 디렉토리가 이미 존재하는 경우 덮어쓸 것인지 확인합니다.<br><br>
