<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("id");
	// String upass = request.getParameter("ps");
	// String uname = request.getParameter("name");
	String jsonstr = request.getParameter("jsonstr");
	
	
	UserDAO dao = new UserDAO();
	if (dao.exists(uid)) {
		out.print("EX"); //이미 가입한 회원입니다.");
		return;
	}
	if (dao.insert(uid, jsonstr)) {
		//out.print("회원 가입이 완료되었습니다.");
		session.setAttribute("id", uid);
		out.print("OK"); //response.sendRedirect("main.jsp");
	}
	else {
		out.print("ER"); //회원 가입 중 오류가 발생하었습니다.");
	}
%>