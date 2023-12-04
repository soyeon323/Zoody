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
        <!-- 실패시 알람 메시지 -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                아이디 혹은 비밀번호를 다시 확인해 주세요.    비밀번호가 기억이 나지 않는다면 <a href="${root}/pwd/find" class="alert-link">비밀번호 설정</a>
              </div>
        </c:if>


<body>
    <div id="wrap">
        <a href="${root}/pwd/find">
           
        </a>

        <form id="login-form" action="${root}/member/login" method="POST" >
            <img src="${root}/resources/img/logo/logo.svg" alt="로고 이미지">
            <input type="text" class="form-control" name="id" placeholder="ID">
            <input type="password" class="form-control" name="pwd" placeholder="PWD">
            <input id="loginBtn" class="btn btn-primary" style="color: whitesmoke;" type="submit" value="로그인" onclick="check()"> 
	        <input class="btn btn-primary" style="color: whitesmoke;" type="button" value="비밀번호 설정" onclick="pwdSet()"> 
        </form>
		</div>
</body>
</html>

<script>

    function pwdSet() {
        location.href = "${root}/pwd/setting";
    }

    //로그인 실패시 메시지  
    const urlParams = new URLSearchParams(window.location.search);
    const alertMessage = urlParams.get('alert');

    if (alertMessage) {
    alert(alertMessage);
    }
</script>