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

<h1>ls 명령어</h1>

리눅스에서의 디렉토리는 윈도우에서의 폴더와 같습니다.<br>
ls 명령어는 현재 디렉토리에 있는 파일들 및 디렉토리들을 출력합니다.<br><br>
실습 창에 "ls" 를 입력해보세요.<br><br>

<!-- <img src="img/ch2-1/ls01.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls<br>
	hello.txt &nbsp;&nbsp;&nbsp; test.txt 
</div>

ls [file]: 파일이 현재 디렉토리에 있는지 확인합니다. 파일이 있으면 파일명 출력하고 없으면 없음을 출력합니다.<br><br>

<!-- <img src="img/ch2-1/ls02.png"><br><br>  -->
<div id="command-ex">
	user1@centos7: ~$ ls hi.txt<br>
	hi.txt: No such file or directory
</div>

<div id="command-ex">
	user1@centos7: ~$ ls hello.txt<br>
	hello.txt
</div>

ls -a (all): 숨겨진 파일이나 디렉토리를 보여줍니다. (아래 그림에서 .bash_history는 숨겨진 디렉토리입니다.)<br><br>

<!-- <img src="img/ch2-1/ls03.png"> <br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -a<br>
	.
	&nbsp;&nbsp;&nbsp; ..
	&nbsp;&nbsp;&nbsp; .I_am_Hidden_File.txt
	&nbsp;&nbsp;&nbsp; hello.txt
	&nbsp;&nbsp;&nbsp; text.txt
</div>

ls -l: 자세한 내용을 출력합니다.<br><br>
각 컬럼은 퍼미션(권한), 포함된 파일수, 소유자, 그룹, 파일크기, 수정일자, 파일이름을 나타냅니다.<br><br>

<!-- <img src="img/ch2-1/ls04.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -l<br>
	total 2<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 7992  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; hello.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 3349  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; text.txt<br>
</div>

ls -S : 파일을 크기 순으로 정렬하여 출력합니다.<br><br>

<!-- <img src="img/ch2-1/ls05.png"><br><br> --> 
<div id="command-ex">
	user1@centos7: ~$ ls -S<br>
	text.txt &nbsp;&nbsp;&nbsp; hello.txt 
</div>

ls -r: 거꾸로 출력합니다. (ls 명령어의 기본은 알파벳 순서)<br><br>

<!-- <img src="img/ch2-1/ls06.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -r<br>
	text.txt &nbsp;&nbsp;&nbsp; hello.txt
</div>

ls -R: 하위 디렉토리까지 출력합니다. (아래 그림은 .디렉토리의 내용과 sub1_dir디렉토리의 내용  sub1_dir디렉토리에 포함된 subsub_dir디렉토리의 내용까지 다 출력된 모습입니다.)<br><br>

<!-- <img src="img/ch2-1/ls07.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -R<br>
	.:<br>
	hello.txt &nbsp;&nbsp;&nbsp; sub1_dir &nbsp;&nbsp;&nbsp; test.txt &nbsp;&nbsp;&nbsp;
	<br><br>
	./sub1_dir:<br>
	birds.txt &nbsp;&nbsp;&nbsp; subsub_dir
	<br><br>
	./sub1_dir/subsub_dir:<br>
	yeah.txt
</div>

ls -h: K, M, G 단위를 사용하여 파일 크기를 사람이 보기 좋게 표시합니다.<br><br>

<!-- <img src="img/ch2-1/ls08.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -lh<br>
	total 2<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 7.8K  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; hello.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 3.3K  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; text.txt<br>
</div>

ls 명령어 u, c 옵션<br>
ls -l 명령은 기본적으로 mtime(수정시간)을 출력합니다.<br><br>

<!-- <img src="img/ch2-1/ls09.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -l<br>
	total 2<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 7992  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; hello.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 3349  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; text.txt<br>
</div>

ls -lu: u 옵션을 사용하면 atime(접근시간)을 출력합니다.<br>
ls -lc: c 옵션을 사용하면 ctime(변경시간)을 출력합니다.<br><br>

* ls 명령어의 활용<br><br>

ls [원하는 디렉토리] : 원하는 디렉토리 안에 있는 디렉토리와 파일이 출력되고 여러 옵션을 겹쳐서 사용할 수 있습니다.)<br><br>

<!-- <img src="img/ch2-1/ls10.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls ./sub1_dir<br>
	birds.txt &nbsp;&nbsp;&nbsp; subsub_dir
</div>

다양한 조합으로 ls 명령어를 사용할 수 있습니다.<br><br>
예시> ls -alSrh<br>
결과> 숨겨진 파일(a)까지 포함해서 파일크기(S) 역순(r)으로 보기 좋게(h) 자세히(l) 보여주세요!<br><br>

<!-- <img src="img/ch2-1/ls11.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls -alSrh<br>
	total 5<br>
	drw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 25  &nbsp;&nbsp;&nbsp; Jan 25 &nbsp;&nbsp; 2018   &nbsp; .<br>
	drw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 46  &nbsp;&nbsp;&nbsp; Feb 10 &nbsp;&nbsp; 2018   &nbsp; ..<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 102  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; c.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 102  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; b.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 102  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; a.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 3349  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; text.txt<br>
	-rw-r--r--  &nbsp;&nbsp;&nbsp; user1 &nbsp;&nbsp;&nbsp; users  &nbsp;&nbsp;&nbsp; 7992  &nbsp;&nbsp;&nbsp; Oct 31 &nbsp;&nbsp; 2018   &nbsp; hello.txt<br>
	
</div>

*, ?와 같은 와일드카드를 활용하면 출력할 내용을 지정할 수 있습니다.<br><br>
예시> ls v*.c <br>
결과> 'v'로 시작하고 '.c'로 끝나는 디렉토리 내용을 출력합니다.<br><br>

<!-- <img src="img/ch2-1/ls13.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls h*.txt<br>
	hello.txt &nbsp;&nbsp;&nbsp; hi.txt
</div>

리다이렉션 연산자(>, >>)를 사용하여 디렉토리 내용을 파일에 저장할 수 있습니다.<br><br>
예시> ls > file.txt<br><br>
<!-- <img src="img/ch2-1/ls13.png"><br><br> -->
<div id="command-ex">
	user1@centos7: ~$ ls > save_ls.txt<br>
	user1@centos7: ~$ cat save_ls.txt<br>
	hello.txt &nbsp;&nbsp;&nbsp; test.txt 
</div>