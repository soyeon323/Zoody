<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${root}/resources/css/login/login.css">
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
    <div id="wrap">
        <a href="${root}/pwd/setting" id="pwdSetting">비밀번호 설정</a>
        <form id="login-form" action="${root}/member/login" method="POST" >
            <img src="${root}/resources/img/logo/logo.svg" alt="로고 이미지">
            <input type="text" name="id" placeholder="ID">
            <input type="text" name="pwd" placeholder="PWD">
            <input class="btn btn-primary" style="color: whitesmoke;" type="submit" value="로그인" onclick="check()"> 
        </form>
		</div>
</body>
</html>

<script>
    function check() {
    const pwdVal = document.querySelector('input[name="pwd"]').value;
    
    const regex = /^(?=.*\d)(?=.*[a-zA-Z]).+$/;
    if (!regex.test(pwdVal)) {
        location.href = "/zoody/pwd/setting";
    }
}

</script>