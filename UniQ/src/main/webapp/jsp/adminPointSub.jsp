<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8");
adminPointDAO dao= new adminPointDAO();

int pno1 = Integer.parseInt(request.getParameter("pointNo1"));
String item1 = request.getParameter("itemname1");
int ea1 = Integer.parseInt(request.getParameter("itemnumber1"));
int price1 = Integer.parseInt(request.getParameter("itemvalue1"));

int pno2 = Integer.parseInt(request.getParameter("pointNo2"));
String item2 = request.getParameter("itemname2");
int ea2 = Integer.parseInt(request.getParameter("itemnumber2"));
int price2 = Integer.parseInt(request.getParameter("itemvalue2"));

boolean code1 = dao.update(pno1, item1, ea1, price1);
boolean code2 = dao.update(pno2, item2, ea2, price2);

if(code1 && code2){
	out.print("포인트 샵을 업데이트 했습니다.");
	response.sendRedirect("adminPointMain.jsp");
}
else{
	out.print("업데이트 중 오류가 발생했습니다.");
}
%>
