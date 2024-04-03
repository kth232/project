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
					<td><h3 id="sul_list_header">내 설문</h3></td>
				</tr>
			</table>
		</div>
	</header>
	<section><!--section은 slq의 데이터베이스 불러오기.-->
		<div>
			<table>
				<tr>
					<td colspan="2">
						<button onclick="내가_등록한_설문_리스트로_가는_링크">내가 등록한 설문&nbsp;&nbsp;&nbsp;<img  src="이미지경로"></button>
					</td>
					<td class="list_button">
						<button onclick="내가_등록한_설문_리스트로_가는_링크"><img  src="이미지"></button>
					</td>
				</tr>
			</table>
		</div>
      	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?allowMultiQueries=true", "root", "1111");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select range, title, deadline from myquest");
		String str = "<table><tr><td>";
		while(rs.next()){
		%>
		<input type="button" onclick="location.href='구글 폼 결과 화면url#Intent;scheme=http;package=com.android.chrome;end'" value="<%=rs.getString("range")%> <%=rs.getString("title")%> <%=rs.getString("deadline")%>">
		<%
		str += "</td></tr>";
		}
		str += "</table>";
		out.print(str);
		rs.close(); stmt.close(); 
		%>
		<div>
			<table>
				<tr>
					<td colspan="2">
						<button onclick="내가_참여한_설문_리스트로_가는_링크">내가 참여한 설문&nbsp;&nbsp;&nbsp;<img  src="이미지경로"></button>
					</td>
					<td class="list_button">
						<button onclick="내가_참여한_설문_리스트로_가는_링크"><img  src="이미지"></button>
					</td>
				</tr>
			</table>
		</div>
		<%
		Statement stmt1 = conn.createStatement();
		ResultSet rs1 = stmt1.executeQuery("select range, title, deadline from joinedquest");
		String str1 = "<table><tr><td>";
		while(rs1.next()){
		%>
		<input type="button" onclick="location.href='참여한 설문지를 클릭하면 어디로 가게 해야할까?'" value="<%=rs1.getString("range")%> <%=rs1.getString("title")%> <%=rs1.getString("deadline")%>">
		<%
		str1 += "</td></tr>";
		}
		str1 += "</table>";
		out.print(str1);
		rs1.close(); stmt1.close();
		conn.close();
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