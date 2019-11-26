<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="helloLinux.member.*" %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberDAO" scope="page" class="helloLinux.member.MemberDAO" />
<jsp:useBean id="member" scope="page" class="helloLinux.member.Member" />


<%	String action = request.getParameter("action");

/******************************************** 회원가입 요청 ********************************************/
	if(action.equals("new")){
		
%>		<jsp:setProperty name="member" property="email" />
		<jsp:setProperty name="member" property="name" />
		<jsp:setProperty name="member" property="passwd" />
		<jsp:setProperty name="member" property="sex" />
		<jsp:setProperty name="member" property="birth_year" />
		<jsp:setProperty name="member" property="birth_month" />
		<jsp:setProperty name="member" property="birth_day" />
<%
		/******** 직업을 '직접입력'선택할 경우, work_etc 텍스트박스의 값을 setWork 인자로 사용함 **********/
		String workRadioBtnValue = request.getParameter("work");
		
		if(workRadioBtnValue != null && !workRadioBtnValue.equals("work_etc")){
%>			<jsp:setProperty name="member" property="work" param="work" />
<%		} else {
%>			<jsp:setProperty name="member" property="work" param="work_etc" />
<%		}
		/******************************************************************************/
		
		/****** 소속을 '직접입력'선택할 경우, belong_etc 텍스트박스의 값을 setBelong 인자로 사용함 ********/
		String belongRadioBtnValue = request.getParameter("belong");
		
		if(belongRadioBtnValue != null && !belongRadioBtnValue.equals("belong_etc")){
%>			<jsp:setProperty name="member" property="belong" param="belong" />
<%		} else {
%>			<jsp:setProperty name="member" property="belong" param="belong_etc" />
<%		}

		/******************* 입력으로 받지 않는 '가입날짜(date)' 항목을 채운다. *********************/ 
		java.util.Date utilDate = new java.util.Date();	
		member.setDate(
				new java.sql.Date(utilDate.getTime())
		);

		/************* 이미 가입된 이메일주소라면 addMember 하지않고 다시 회원가입 화면을 보냄 **************/
		String email = request.getParameter("email");
		
		if(memberDAO.isEmailAlreadyExist(email)){
			response.sendRedirect("Join.jsp");
		}
		
		/***************************** DB에 회원 등록 시도 ***********************************/
		else if(memberDAO.addMember(member)){
			response.sendRedirect("Home.jsp");
		}
		else {
			throw new Exception("DB 입력 오류");
		}
	}
/**************************************************************************************************/
/******************************************* 로그인요청 ***********************************************/
	 else if(action.equals("login")){
		
		String email = request.getParameter("email");
		String passwd = request.getParameter("passwd");
		
		member = memberDAO.login(email, passwd);
		
		if(member != null){ // 로그인 성공
			session.setAttribute("email", email);
			session.setAttribute("name", member.getName());
			response.sendRedirect("Home.jsp");
		} else { // 로그인 실패
			response.sendRedirect("Login.jsp");
		}
	}
/**************************************************************************************************/
/******************************************* 로그아웃요청 **********************************************/

	else if(action.equals("logout")){
		
		
	}
	else if(action.equals("withdraw")){
		
	}
/**************************************************************************************************/
/****************************************계정찾기요청**************************************************/
	else if(action.equals("find")){
	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String birthY = request.getParameter("birth_year");
		String birthM = request.getParameter("birth_month");
		String birthD = request.getParameter("birth_day");
		
		member = null;
		
		if(member != null){
			response.sendRedirect("ResetPw.jsp");
			//근데 findAccount.jsp에서 온 email을 어떻게 다시 resetPw.jsp에 보내지??
		} else { // 계정찾기 실패
			response.sendRedirect("FindAccount");
			// 찾는 회원정보가 없다고 알림창 뜨게 하고싶음 ㅠㅜ
		}
	
	}
%>