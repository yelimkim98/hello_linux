<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="helloLinux.member.*" %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberDAO" scope="page" class="helloLinux.member.MemberDAO" />
<jsp:useBean id="member" scope="page" class="helloLinux.member.Member" />


<%	String action = request.getParameter("action");

	if(action.equals("new")){ // 회원가입 요청
		
%>		<jsp:setProperty name="member" property="email" />
		<jsp:setProperty name="member" property="name" />
		<jsp:setProperty name="member" property="passwd" />
		<jsp:setProperty name="member" property="sex" />
		<!-- member 객체의 setBirth_year 은 인자를 Int로 받는데, 이렇게쓰면 알아서 Int로 변환되서 들어간다고 함 -->
		<jsp:setProperty name="member" property="birth_year" />
		<jsp:setProperty name="member" property="birth_month" />
		<jsp:setProperty name="member" property="birth_day" />
		<%-- work, belong은 radio 와 Textbox를 혼용하기 때문에,
		radio 버튼에서 '직접 입력'이 선택된 경우 Textbox의 value를 setWork(), setBelong() 의 인자로 써야한다. --%>
		<jsp:setProperty name="member" property="belong" />
		<jsp:setProperty name="member" property="work" param="work_etc" />
		
<%

		/******** 직업을 '직접입력'선택할 경우, work_etc 텍스트박스의 값을 setWork 인자로 사용함 **********/
		String workRadioBtnValue = request.getParameter("work");
		
		if(workRadioBtnValue != null && !workRadioBtnValue.equals("etc")){
%>			<jsp:setProperty name="member" property="work" param="work" />
<%		} else {
%>			<jsp:setProperty name="member" property="work" param="work_etc" />
<%		}
		/******************************************************************************/
		
		/******** 소속을 '직접입력'선택할 경우, belong_etc 텍스트박스의 값을 setBelong 인자로 사용함 **********/
		String belongRadioBtnValue = request.getParameter("belong");
		
		if(workRadioBtnValue != null && !workRadioBtnValue.equals("etc")){
%>			<jsp:setProperty name="member" property="belong" param="belong" />
<%		} else {
%>			<jsp:setProperty name="member" property="belong" param="belong_etc" />
<%		}
		/******************************************************************************/

		/********** 입력으로 받지 않는 '가입날짜(date)' 항목을 채운다. **********/ 
		java.util.Date utilDate = new java.util.Date();	
		member.setDate(
				new java.sql.Date(utilDate.getTime())
		);
		/**********************************************************/
	
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