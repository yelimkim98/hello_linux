<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<jsp:useBean id="sh" class="helloLinux.linux.Shell" scope="session" />
<%
	String input = request.getParameter("command_input");
%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/Shell.css" />
	<meta charset="UTF-8">

	<!------- 쉘의 텍스트입력 창 크기 자동조절 ------->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  		crossorigin="anonymous">
	</script>
	<script>
		var screenWidth;
		
		$(document).ready(function(){
			screenWidth = parent.screenWidth;
			$('#command_input').css("width", (screenWidth - $('#last_line_header').width() - 50) + "px");
			
			$(window).resize(function(){
				screenWidth = parent.screenWidth;
				$('#command_input').css("width",
					(screenWidth - $('#last_line_header').width() - 50) + "px");
			})
			
			$("#command_input").focus();
		})
	</script>
	<!------------------------------------->
</head>
<body>
	<form method="post" action="Shell.jsp" style="overflow:hidden">
		<div id="history">
			<% if(input != null) { %>
					<%=	sh.shell(input) %>
			<% } %>
		</div>
		<div id="last_line">
			<span id="last_line_header">user@centos:</span>
			<input name="command_input" type=text id="command_input" autocomplete="off" />
		</div>
	</form>
</body>
</html>