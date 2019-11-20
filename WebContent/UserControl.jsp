<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="helloLinux.member.*" %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberDAO" scope="page" class="helloLinux.member.MemberDAO" />
<jsp:useBean id="member" scope="page" class="helloLinux.member.Member" />
<jsp:setProperty name="member" property="*" />

<%
	/********** 입력으로 받지 않는 '가입날짜(date)' 항목을 채운다. **********/ 
	java.util.Date utilDate = new java.util.Date();	
	member.setDate(
			new java.sql.Date(utilDate.getTime())
	);
	/**********************************************************/
	
	String action = request.getParameter("action");

	if(action.equals("new")){
		// 회원가입 요청
		if(memberDAO.addMember(member)){
			response.sendRedirect("Home.jsp");
		}
		else {
			throw new Exception("DB 입력 오류");
		}
	} else if(action.equals("login")){
		// 로그인 요청
		
	} else if(action.equals("withdraw")){
		// 회원 탈퇴 요청
		
	}
%>