이 git repository 에는
우리가 직접 작성한 코드만 올립니다.

코드를 돌려보기 위해서는 * 실행 방법 을 따라하세요.


* 실행 방법

1. Eclipse 에서 dynamic web project 를 생성한다.

   // 1의 결과, 다음과 같은 프로젝트 구성을 볼 수 있다.

         ...(생략)...
         build
         WebContent
              META-INF
              WEB-INF

2. git repository를 보면 WebContent 라는 폴더가 있는데,<br>
   Eclipse에서 생성한 프로젝트의 WebContent와 비교해보면<br>
   META-INF, WEB-INF 폴더가 없다.

   git repository의 WebContent 폴더에 있는 모든 파일과 폴더들이<br>
   이클립스에서 생성한 프로젝트의 WebContent 폴더 하위에 존재하게 해야한다.

   // 2의 결과, 다음과 같이 프로젝트가 구성된다.
   
         ...(생략)...
         build
            WebContent
	         css
		         ..(생략)
	         img
		         ..(생략)
	         include
		         ..(생략)
	         lecture_text_files
	         Home.jsp
	         LectureList.jsp
	         LecViewDefault.jsp
	         LecViewConsole.jsp
		 ..(생략)
	         META-INF
	         WEB-INF
