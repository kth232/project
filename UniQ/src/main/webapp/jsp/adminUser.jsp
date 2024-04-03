<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8");
adminPointDAO dao= new adminPointDAO();

ArrayList<AdminUserObj> adusers = (new AdminUserDAO()).getList();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>사용자 관리</title>
<link rel="stylesheet" href="style.css">
    <title>point shop management</title>
</head>
<body>
    <div class="admin__title">
        <h1>사용자 관리</h1>
        <hr class="lightLine">
    </div>
    <section class="userTable">
        <table class="list_table" align="center">
            <tr>
                <td class="list_search" colspan="2">
                    <input type="text" placeholder="검색어를 입력해주세요.">
                    <button onclick=""><img src="images/search.png"></button>
                </td>
            </tr>
		</table>
    </section>
<%
String str = "<form action = 'userInfo.jsp' method = 'get'><table class='list_table' align='center'>";
for(AdminUserObj aduser : adusers){
	String target = "";
	str += "<tr class='list_id' id = 'id' value = '"+aduser.getId()+"'>";
	str += "<td class='list_id_text'>";
	str += "<span><input type = 'submit' value = '"+aduser.getId()+"'/></span>";
	
	str += "</td><td class='list_id_arrow'><input type ='image' src='images/right-arrow.png' name = 'Submit' value = ' ' aligne = 'absmiddle'></td></tr>";
} //form태그로 바꾸고 값 전송을  submit버튼으로 했어
 str += "</table></form>";
 out.print(str);
 %>
    <footer>
		<div class="bar">
			<div class="bar__container">
				<a href="adminUser.jsp" class="bar__home">
					<img src="images/icon_user.png" alt="home icon" class="bar__home__icon">
				</a>
				<a href="adminQuestion.html" class="bar__mysurvey">
					<img src="images/icon_adminsurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
				</a>
				<a href="adminPoint.html" class="bar__pointshop">
					<img src="images/icon_adminpointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
				</a>
				<a href="adminSetting.html" class="settings">
					<img src="images/icon_settings.png" alt="settings icon" class="bar__settings__icon">
				</a>
			</div>
		</div>
   	</footer>
</body>
</html>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/core.js"></script>
<script>
</script>