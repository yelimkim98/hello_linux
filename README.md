코드 작성하기 전에 pull 을 한번씩 해줄 것 (git pull origin master)

이 git repository 에는
우리가 직접 작성한 코드만 올립니다.

* 개발 환경
Window 10, Tomcat 8, Eclipse IDE (2017, 2018), Mysql version 8.0.17, Mysql Workbench 8.0 CE

* 코드 실행 방법

1. Tomcat 8 을 설치한다.

2. Eclipse 에서 dynamic web project 를 생성한다.

   // 1의 결과, 다음과 같은 프로젝트 구성을 볼 수 있다.

         ...(생략)...
         build
         WebContent
              META-INF
              WEB-INF

3. git repository의 WebContent 폴더에 있는 모든 파일과 폴더들을 복사하여<br>
   이클립스 화면의 왼쪽 project explorer에서 WebContent 폴더 안에 붙여넣기한다.<br><br>
   git repository의 src 폴더에 있는 것들을 복사하여<br>
   이클립스 화면의 왼쪽 project explorer에서 src 폴더 안에 붙여넣기한다.

   // 2의 결과, 다음과 같이 프로젝트가 구성된다.
   
         ...(생략)...
         src
	    hellolinux
	                 ..(생략)
	    ...
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
	         ..
	         META-INF
	         WEB-INF

4. Mysql을 Developer Default로 설치하고,
   Mysql 에서 hellolinux 라는 데이터베이스(=스키마)를 만든다.

         // cmd
         C:\> mysql -u root -p
         Enter Password: **********
         Welcom to the MySQL ...(이하 생략)...
         mysql> create database hellolinux;
         
         // Workbench에서 만드는 방법도 있음
	 
5. 다음과 같은 계정을 만들고, hellolinux 데이터베이스에 대해서만 모든 권한을 가지게 한다.
   
   Username : hellolinux<br>
   password : ... (비밀임)
   
   Connection Name (커넥션 이름) : hellolinux-connection<br>
   Default Schema(접속했을 때 사용할 ) : hellolinux
   
   ▼ MySQL Workbench 사용자 계정 생성/권한 부여 방법<br>
https://mystyle1057.tistory.com/m/entry/MySQL-Workbench-%EC%82%AC%EC%9A%A9%EC%9E%90-%EA%B3%84%EC%A0%95-%EC%83%9D%EC%84%B1%EA%B6%8C%ED%95%9C-%EB%B6%80%EC%97%AC-%EB%B0%A9%EB%B2%95

6. 테이블을 만든다

          // 6-1 : member table 만들기
          create table hellolinux.member (
               uid varchar(45) not null,
               name varchar(45) not null,
               passwd varchar(45) not null,
               birth_year int not null, 
               birth_month int not null,
               birth_day int not null,
               email varchar(60) not null,
               sex varchar(10) not null,
               work varchar(60) not null,
               belong varchar(60) not null,
               date DATE not null, 
               primary key(uid)
          );
	  
          // 6-2 : lecture_list 테이블 생성
          create table hellolinux.lecture_list (
               chapter_id int not null,
               lecture_id int not null,
               like_cnt int not null default 0,
               url varchar(100),
               primary key(chapter_id, lecture_id)
          );
          
          // 6-3 : visit_log 테이블 생성
          create table hellolinux.visit_log (
               vid int not null,
               date DATE not null,
               uid varchar(45),
               url varchar(100) not null,
               foreign key(uid) references hellolinux.member(uid)
          );
	  
          // 6-4 : comment_log 테이블 생성
          create table comment_log (
               comment_id int AUTO_INCREMENT,
               chapter_id int not null,
               lecture_id int not null,
               is_reply boolean not null default false,
               reply_target_id int,
               primary key(comment_id),
               foreign key(chapter_id, lecture_id) references lecture_list(chapter_id, lecture_id),
               foreign key(reply_target_id) references comment_log(comment_id)
          );
	  
          // 6-5 : login_log 테이블 생성
          create table login_log (
               id int AUTO_INCREMENT,
               uid varchar(45) not null,
               date DATE not null,
               primary key(id),
               foreign key(uid) references hellolinux.member(uid)
          );
	  
          // 6-6 : 
          create table logout_log (
               id int AUTO_INCREMENT,
               uid varchar(45) not null,
               date DATE not null,
               primary key(id),
               foreign key(uid) references hellolinux.member(uid)
          );

7. C:\Program Files (x86)\MySQL\Connector J 8.0 폴더에 있는 mysql-connector-java-8.0.17.jar 라는 이름의 파일을 복사(copy)하여,
   이클립스의 프로젝트의 WebContent\WEB-INF\lib 에 붙여넣기(paste)한다.

8. 
