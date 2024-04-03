<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid= request.getParameter("id");
	String atitle= request.getParameter("atitle");
	String content= request.getParameter("content");
	String ts= request.getParameter("ts");

	noticeDAO dao= new noticeDAO();
	if (dao.insert(uid, atitle, content, ts) == true){
		out.print("공지사항 작성이 완료되었습니다.");
	}
%>