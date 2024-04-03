<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<%
	ArrayList<QuestObj> quests = (new QuestDAO()).getList();
	String id = (String) session.getAttribute("id"); 
	UserObj user = (new UserDAO()).getUserInfo(id);
	String univ = user.getUniv();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<title>설문 목록</title>
	<link rel="stylesheet" href="../css/style.css">  
	<script src="https://kit.fontawesome.com/42105adea0.js" crossorigin="anonymous"></script>  
</head>
<body>

	<div class="surveylist__title">
		<span id="hide">+</span>
		<span id="surveylist__title__text">설문 목록</span>
		<a href = "register.html"><img src="../images/add.png"></a>
	</div>

	<form action="questOutline.jsp" method="get" accept-charset="utf-8"></form>
	<div class="surveylist__form">
		
			<table class="list_table">
				<tr>
					<td class="list_sort">
						<select name="job">
							<option value="time_asc">최신순</option>
							<option value="time_desc">오래된순</option>
							<option value="spell_asc">가나다순</option>
							<option value="campus">교내</option>
							<option value="nation">전국</option>
						</select>
					</td>
					<td class="list_search">
						<input type="text" placeholder="검색어를 입력해주세요.">
						<button onclick=""><img src="../images/search.png"></button>
					</td>
				</tr>
			</table>
		
	</div>
	</form>
		
<%
 String str = "<table class='Questionlist'>";
 

 
 for(QuestObj quest : quests){
	String target = "";
	str += "<tr onclick=''>";
	if(quest.getTarget().equals("campus")){
		target = univ;
	}
	else target = "전국";
	str += "<td class='Questionlist__target'><span>[" + target + "]</span></td>";
	str += "<td class='Questionlist__title'>" + quest.getTitle() + "</td>";
	//int dday = quest.getDeadline()
	String[] array = quest.getDeadline().split("-");
	int year = Integer.parseInt(array[0]);
	int month = Integer.parseInt(array[1]);
	int day = Integer.parseInt(array[2]);
	String dday = (new QuestDAO()).getDday(year, month, day);
	str += "<td class='Questionlist__dday'>D&nbsp;-&nbsp;" + dday + "</td></tr>";
 }
 
 str += "</table>";
 out.print(str);
 //out.print(fromDate);

%>

		
		<div class="list_container">
			<ul class="surveyList__list">
				<li class="pre"><a href="#">이전</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li class="next"><a href="#">다음</a></li>
			</ul>
		</div>
		
		<div class="bar">
			<div class="bar__container">
				<a href="home.html" class="bar__home">
					<img src="../images/icon_home.png" alt="home icon" class="bar__home__icon">
				</a>
				<a href="myQuestion.html" class="bar__mysurvey">
					<img src="../images/icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
				</a>
				<a href="pointShop.html" class="bar__pointshop">
					<img src="../images/icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
				</a>
				<a href="settings.html" class="settings">
					<img src="../images/icon_settings.png" alt="settings icon" class="bar__settings__icon">
				</a>
			</div>
		</div>
	
</body>
</html>