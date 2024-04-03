<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
request.setCharacterEncoding("utf-8");

PointObj pobj1 = (new PointDAO()).getStock(1); //포인트샵 첫 번째 칸에 해당하는 pointshop DB불러오기
String item1 = pobj1.getItem();
int ea1 = pobj1.getEa();
int price1 = pobj1.getPrice();

PointObj pobj2 = (new PointDAO()).getStock(2); //포인트샵 두 번째 칸에 해당하는 pointshop DB불러오기
String item2 = pobj2.getItem();
int ea2 = pobj2.getEa();
int price2 = pobj2.getPrice();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	<title>포인트샵 관리</title>
	<link rel="stylesheet" href="css/style.css">  
</head>
<body>
    <form action="adminPointSub.jsp" method="post">
        <div class="admin__title">
            <h1 class="admin__title__text">포인트샵 관리<input class="bold" type="submit" value="변경 완료"></h1>
            <hr class="lightLine">
        </div>
        <div class="adminPoint__container">
                <table class="adminPoint__table-add">
                    <tr>
                    	<td>
                            <input type="number" name="pointNo1" value=1 readonly/> <!-- pno값으로 받기 위해 넣었옹 -->
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            아이템 이름
                        </td>
                        <td>
                            <input type="text" name="itemname1" placeholder = "<%= item1%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            개수
                        </td>
                        <td>
                            <input type="number" name="itemnumber1" placeholder = "<%= ea1%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            포인트 값
                        </td>
                        <td>
                            <input type="number" name="itemvalue1" placeholder = "<%= price1%>"/>
                        </td>
                    </tr>
                </table>
                <hr>
                <table class="adminPoint__table">
                    <tr>
                    	<td>
                            <input type="number" name="pointNo2" value=2 readonly/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            아이템 이름
                        </td>
                        <td>
                            <input type="text" name="itemname2" placeholder = "<%= item2%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            개수
                        </td>
                        <td>
                            <input type="number" name="itemnumber2" placeholder = "<%= ea2%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            포인트 값
                        </td>
                        <td>
                            <input type="number" name="itemvalue2" placeholder = "<%= price2%>"/>
                        </td>
                    </tr>
                </table>
                <hr>
            
        </div>
    </form>
    
    <div class="empty"></div>
    
    
<!--하단바 코드-->
<footer>
    <div class="bar">
    
        <div class="bar__container">
    
            <a href="adminUser.html" class="bar__home">
                <img src="images/icon_user.png" alt="home icon" class="bar__home__icon">
            </a>
            <a href="adminQuestion.html" class="bar__mysurvey">
                <img src="images/icon_adminsurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            </a>
            <a href=adminPointMain.jsp class="bar__pointshop">
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	
</script>