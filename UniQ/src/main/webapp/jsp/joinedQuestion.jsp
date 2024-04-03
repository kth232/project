<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div>
			<table>
				<tr>
					<td class="list_button">
						<button onclick="내_설문_리스트로_가는_링크"><img  src="이미지"></button>
					</td>
					<td><h3 id="joined_list_header">내가 참여한 설문 리스트</h3></td>
				</tr>
			</table>
		</div>
	</header>
	<section>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?allowMultiQueries=true", "root", "1111");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select range, title, deadline from joinedquest");
		String str = "<table><tr><td>";
		while(rs.next()){
		%>
		<%=rs.getString("range")%>&nbsp;<%=rs.getString("title")%>&nbsp;<%=rs.getString("deadline")%>
		<%
		str += "</td></tr>";
		}
		str += "</table>";
		out.print(str);
		rs.close(); stmt.close(); conn.close();
		%>
	</section>
	<footer>
      	<div class="bar">
        
        	<div class="bar__container">
            
            	<a href="home.html" class="bar__home">
                	<img src="icon_home.png" alt="home icon" class="bar__home__icon">
            	</a>
           		<a href="mysurvey.html" class="bar__mysurvey">
                	<img src="icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            	</a>
            	<a href="pointshop.html" class="bar__pointshop">
                	<img src="icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
            	</a>
            	<a href="settings.html" class="settings">
                	<img src="icon_settings.png" alt="settings icon" class="bar__settings__icon">
            	</a>
         	</div>
      	</div>
	</footer>
</body>
</html>