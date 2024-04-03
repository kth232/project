<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<% //556 -> 561 작성글 잘 나오나 확인.
	String frids = request.getParameter("frids");
	String maxNo = request.getParameter("limit");
	out.print((new FeedDAO()).getGroup(frids, maxNo));
%>