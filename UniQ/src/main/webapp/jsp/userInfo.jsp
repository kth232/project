<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
request.setCharacterEncoding("utf-8");
adminPointDAO dao= new adminPointDAO();

//String id = "kim@abc.com";
String id = request.getParameter("id");
out.print(id);

UserObj user = (new UserDAO()).getUserInfo(id);
String name = user.getName();
String univ = user.getUniv();
String depart = user.getDepart();
int point = user.getPoint();
int ticket = user.getTicket();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>사용자 정보</title>
<link rel="stylesheet" href="style.css">
    <title>point shop management</title>
</head>

<body>
    <div class="outline__title">
		<a href="adminUser.html"><img class="leftarrow" src="images/left-arrow.png"></a>
        <span class="adminQuestion__title__text">사용자 정보</span>
        <span id="hide">&lt;</span>
	</div>

    
    <div class="user__profile">
        <table class="user__profile__table">
            <tr>
                <td class="user__profile__avatar" rowspan="3"><img src="images/avatar.png" alt="avatar" ></td>
                <td><%=id %></td>
                <td><%=name %></td>
            </tr>
            <tr>
                <td colspan="2">
                    <%=univ %> / <%=depart %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>잔여 티켓 : <%=point %></td>
                <td>잔여 포인트 : <%=ticket %></td>
            </tr>
        </table>
    </div>

<%

ArrayList<QuestObj> regists = (new QuestDAO()).getListRegist(id);
for(QuestObj regist : regists){
	String target = regist.getTarget();
	String title = regist.getTitle();
	
	String str = "<div class='userInfo__registered'>";
	str += "<div class='userInfo__registered__title bold'>작성한 설문조사</div>";
	str +="<hr class='lightLine'><div class='userInfo__registered__list'>";
	str += "<span class='bold'>["+target+"]</span>";
	str += "<span>"+title+"</span>";
	str += "<hr class='lightLine mt1'></div></div>";

	 out.print(str);
}
%>
<!-- 
	<div class="userInfo__registered">
        <div class="userInfo__registered__title bold">
            작성한 설문조사
        </div>
        <hr class="lightLine">
        <div class="userInfo__registered__list">    
            <span class="bold">[교내]</span>
            <span>코로나19 백신 이상반응 설문조사</span>
            <hr class="lightLine mt1">
        </div>    
    </div>
 -->
    
<%
ArrayList<JoinedObj> joined = (new JoinedDAO()).getList(id);
for(JoinedObj join : joined){
	QuestObj quest = (new QuestDAO()).getListJoin(join.getNo());
	String target = quest.getTarget();
	String title = quest.getTitle();
	
	String str = "<div class='userInfo__joined'>";
	str += "<div class='userInfo__joined__title bold'>참여한 설문조사</div>";
	str +="<hr class='lightLine'><div class='userInfo__joined__list'>";
	str += "<span class='bold'>["+target+"]</span>";
	str += "<span>"+title+"</span>";
	str += "<hr class='lightLine mt1'></div></div>";

	 out.print(str);
}
%>
    <!--
    <div class="userInfo__joined">
        <div class="userInfo__joined__title bold">
            참여한 설문조사
        </div>
        <hr class="lightLine">
        <div class="userInfo__joined__list">    
            <span class="bold">[교내]</span>
            <span>도서관 만족도 조사</span>
            <hr class="lightLine mt1">
        </div>   
    </div>  
    -->

    <footer>
		<div class="bar">
		
			<div class="bar__container">
		
				<a href="adminUser.html" class="bar__home">
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