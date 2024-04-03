<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
    <title>회원 삭제 처리</title>
</head>
<body>
    <%
        String id= (String)session.getAttribute("sessionID"); 
        String pw = request.getParameter("password");
        
       // 아이디, 입력받은 비밀번호를 가져온다.
       // 가져온 결과를 가지고 회원정보를 삭제한다. -> 삭제결과를 반환
       // MemberDAO dao = MemberDAO.getInstance();
       //int check = dao.deleteMember(id, pw);
        
       // if(check == 1){
            session.invalidate(); // �������ㅻ㈃ �몄����蹂대�� ��������.
    %>
        <br><br>
        <p>������蹂닿� ���������듬����.</p>
        <br><br>
    
        <input type="button" value="확인" onclick="">
    
    <%    
         // 鍮�諛�踰��멸� ��由닿꼍�� - ����媛� �������� 寃쎌��
       // }else{
    %>
        <script>
            alert("鍮�諛�踰��멸� 留�吏� ���듬����.");
            history.go(-1); //�ㅻ� 媛�湲�
        </script>

<!--하단바 코드-->
    <div class="bar">
        
        <div class="bar__container">
            
            <a href="home.html" class="bar__home">
                <img src="icon_home.png" alt="home icon" class="bar__home__icon">
            </a>
            <a href="mysurvey.html" class="bar__mysurvey">
                <img src="icon_mysurvey.png" alt="mysurvey icon" class="bar__mysurvey__icon">
            </a>
            <a href="pointShop.html" class="bar__pointshop">
                <img src="icon_pointshop.png" alt="pointshop icon" class="bar__pointshop__icon">
            </a>
            <a href="settings.html" class="settings">
                <img src="icon_settings.png" alt="settings icon" class="bar__settings__icon">
            </a>
        </div>
    </div>
</body>
</html>

