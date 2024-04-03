<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<header>
		<table>
			<tr>
				<td>
					<button onclick="location.href ='설문 목록.html'"><img  src="뒤로가기 이미지경로"></button>
				</td>
				<td><h3 id="sul_info_header">설문 정보</h3></td>
			</tr>
		</table>
		<h3>[<%= request.getParameter("quest_range") %>]&nbsp;<%= request.getParameter("quest_title") %></h3><br>
		<p><%= request.getParameter("quest_explain") %></p>
		<p><%= request.getParameter("deadline") %></p>
	</header>
	<section>
		<h3>문항수</h3>
		<p>총 <%= request.getParameter("tot_quest") %>문항</p>
		<p>객관식 : <%= request.getParameter("choice_quest") %>문항</p>
		<p>주관식 : <%= request.getParameter("shortAnswer_quest") %>문항</p><br>
		<h3>소요 시간</h3>
		<p><%= request.getParameter("leadTime") %></p><br>
		<h3>적립 예정 포인트</h3>
		<p><%= request.getParameter("point") %></p><br>
	</section>
	<footer>
		<script type="text/javascript">
			function goPage() 
				{ location.href="<%= request.getParameter("quest_url") %>"; } 
		</script>
		<button onclick="location.href='설문 목록.html'">뒤로가기</button>
		<input type="button" onclick="goPage()" value="참여하기"/>
	</footer>
</body>
</html>