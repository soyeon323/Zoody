<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${root}/resources/css/login/login.css">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
</head>
<body>
    <div id="wrap">
        <form id="login-form" action="${root}/member/login" method="POST">
            <img src="${root}/resources/img/logo/logo.svg" alt="로고 이미지">
            <input type="text" name="id" placeholder="ID">
            <input type="text" name="pwd" placeholder="PWD">
            <input class="btn btn-primary" style="color: whitesmoke;" type="submit" value="로그인"> 
        </form>
		</div>
</body>
</html>