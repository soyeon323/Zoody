    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/employee/detail.css">
<link rel="stylesheet" href="${root}/resources/css/survey/average.css">
<link rel="stylesheet" href="${root}/resources/css/survey/survey.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="title">사내 부패도 평균 점수</div>

        <div class="wrapper">
               <div id="circle-wrap">
                <div id="score">56.38</div>
                <div class="circle"></div>
               </div>
        </div>
        <div id="btn-area">
            <button onclick="go();" class="btn btn-primary"> 설문 조사 하기</button>
        </div>

    </div>

    <script>
        window.onload = function() {
            document.querySelector('.circle').style.animationPlayState = 'running';
        };

        function go() {
            location.href = "${root}/corrupt/survey/";
        }

    </script>
        
</body>
</html>


