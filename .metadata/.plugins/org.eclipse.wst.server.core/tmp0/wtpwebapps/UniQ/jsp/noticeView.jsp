<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.*" %>
<%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("login.html");
	return;
	}
	session.setAttribute("id", uid);
	
	ArrayList<noticeObj> notices = (new noticeDAO()).getList();
	
	String str = "<table align=center>";
	str += "<tr height=40><td><b>공지사항</b></td>";
	
	for(noticeObj notice: notices) {
		str += "<tr><td colspan=3><hr></td></tr>";
		str += "<tr>";
		str += "<td>" + notice.getId() + "</td>";
		str += "<td>" + notice.getAtitle() + "</td>";
		str += "<td>&nbsp;(" + notice.getTs() + ")</td>";
		str += "</tr>";
	}
	str += "</table>";
	out.print(str);
%>