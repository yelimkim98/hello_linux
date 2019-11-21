<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>

<!-- 강의 별 화면(LecViewDefalut.jsp), 강의목록(LectureList.jsp) 에서 사용됨 -->
<!-- 최상단의 header 이자 네비게이션인 부분 -->

	<meta charset="UTF-8">
	<style>
		.top-navigation-body {
			position:fixed;
			top:0;
			width:100%;
    		height: 40px;
			background-image: url(img/home/ocean.png);
			background-repeat: no-repeat;
    		background-size: cover;
		}
		ul.top-navigation {
			position:fixed;
			height: 40px;
			display: inline-block;
    		font-size:18px;
		}
		
		li.top-navigation {
			display: inline-block;
			margin-left: 20px;
			margin-right: 20px;
			height: 40px;
			vertical-align:top;
		}
		
		.left-ul {
			position: absolute;
			top: 10px;
			left: 10px;
		}
		
		.right-ul {
			position: absolute;
			top: 10px;
			right: 10px;
		}
		.nav-up {
			top: -50px;
			// 헤더 높이와 같게
		}
		a {
			text-decoration:none;
			color: white;
		}
		a:visited {
			text-decoration:none;
			color: white;
		}
	</style>
	
	<!-- 나타났다 사라졌다 하는 효과를 위한 자바스크립트(jQuery) 이벤트 -->
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		$(document).ready(function (){
			$(document).on('mousewheel',function(e){
				var wheel = e.originalEvent.wheelDelta;

				//스크롤값을 가져온다.
				if(wheel>1){
					//스크롤 올릴때
					$(".top-navigation-body").fadeIn();
					$(".top-navigation").fadeIn();
				} else {
					//스크롤 내릴때
					$(".top-navigation-body").fadeOut(300);
					$(".top-navigation").fadeOut(300);
				}
			});
		})
	</script>
	
	<!----------------------------------------------->
	
</head>
<div class="top-navigation-body"></div>
<a href="Home.jsp">
<ul class="top-navigation left-ul">
	<li class="top-navigation"><img src="img/home/logo.png" width="30px" height="30px"></li>
	<li class="top-navigation" id="hello_linux_text">HELLO LINUX</li>
</ul>
</a>
<ul class="top-navigation right-ul">
	<li class="top-navigation">ABOUT</li>
 	<li class="top-navigation"><a href="Login.jsp">LOGIN</a></li>
 	<li class="top-navigation"><a href="Join.jsp">회원가입</a></li>
</ul>