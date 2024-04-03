<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
request.setCharacterEncoding("utf-8");

String[] arr = request.getParameterValues("survey");
int[] survey = new int[arr.length];
for(int i=0; i<arr.length; i++){
	survey[i] = Integer.parseInt(arr[i]);
}

QuestDAO quest = new QuestDAO();
for(int j = 0; j < survey.length; j++){
	boolean code = quest.delete(survey[j]);
	if(!code) out.println("<script>alert("+j+"'번째 설문지 삭제 중 오류 발생')</script>");
	else {
		response.sendRedirect("adminSurveyList.jsp");
	}
}

%>