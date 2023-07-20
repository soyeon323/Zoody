<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${root}/resources/css/pwd/pwd-setting.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
</style>
</head>
<body>
		<div id="wrap">
            <form action="" method="POST">
                <span>아이디 (사번)</span>
                <input type="text" name="" placeholder="사번">
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="사번 확인"> 
                <br><br><br>
                <span>초기 비밀번호</span>
                <input type="text" name="" placeholder="초기 비밀번호" id="pwdSet1">
                <br>
                <span>초기 비밀번호</span>
                <input type="text" name="" placeholder="초기 비밀번호" id="pwdSet2">
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em;" type="submit" value="비밀번호 일치 확인"> 
                <br><br>
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="비밀번호 설정 하기"> 
            </form>
		</div>
</body>
</html>