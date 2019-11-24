<%@ page language="java" pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
</head>
<h1>cp 명령어</h1>
copy의 약자로 파일이나 디렉토리를 복사할 때 사용하는 명령어입니다.<br><br>
<img src="img/ch2-8/cp01.png"><br><br>
cp -b [file]: 복사 대상 파일이 이미 존재하는 경우를 대비해서 백업파일을 만듭니다.<br>
cp -f [file]: 복사 대상 파일이 이미 존재하면 이미 존재하는 파일을 지우고 복사합니다.<br>
cp -i [file]: 복사 대상 파일이 이미 존재하면 사용자에게 덮어쓸 것인지 확인한다.<br><br>
<img src="img/ch2-8/cp02.png"><br><br>
cp -r [이름]: 디렉토리를 복사할 경우 하위 디렉토리와 파일을 모두 복사합니다.<br><br>
