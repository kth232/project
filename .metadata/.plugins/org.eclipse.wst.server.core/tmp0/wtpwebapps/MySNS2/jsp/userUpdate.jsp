<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="util.FileUtil" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = null, jsonstr = null, ufname = null;
	byte[] ufile = null;
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	List items = sfu.parseRequest(request);
	Iterator iter = items.iterator();
	while(iter.hasNext()) {
		FileItem item = (FileItem) iter.next();
		String name = item.getFieldName();
		if(item.isFormField()) {
			String value = item.getString("utf-8");
			if (name.equals("id")) uid = value;
			//else if (name.equals("content")) ucon = value;
			if (name.equals("jsonstr")) jsonstr = value;
			}
		else {
			if (name.equals("image")) {
				ufname = item.getName();
				ufile = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, ufname, ufile);
				out.print("이미지 업로드가 완료되었습니다.");
			}
		}
	}
	
	UserDAO dao = new UserDAO();
	if (dao.update(uid, jsonstr)) {
		out.print("OK"); //response.sendRedirect("main.jsp");
	}
	else {
		out.print("ER"); //작성 글의 업로드 중 오류가 발생하였습니다.");
	}
%>