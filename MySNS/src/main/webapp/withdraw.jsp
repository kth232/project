<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");


UserDAO dao = new UserDAO();
if (dao.exists(uid) == false) {
	out.print("회원 정보를 찾을 수 없습니다.");
	return;
	}
if (dao.delete(uid)) {
	out.print("회원 탈퇴가 완료되었습니다.");
}
else {
	out.print("회원 탈퇴 처리 중 오류가 발생하였습니다.");
}
%>