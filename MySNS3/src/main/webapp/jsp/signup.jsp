<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	//String upass = request.getParameter("ps");
	//String uname = request.getParameter("name");
	
	String jsonstr = request.getParameter("jsonstr");
	
	UserDAO dao = new UserDAO();
	if (dao.exists(uid)) {
		out.print("EX");
		return;
	}
	
	if (dao.insert(uid, jsonstr) == true) {
		session.setAttribute("id", uid);
		out.print("OK");
		//response.sendRedirect("jsp/main.jsp");
	}
	
	else {
		out.print("ER");
	}
%>
