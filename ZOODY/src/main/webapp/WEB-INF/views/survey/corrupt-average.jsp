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
<link rel="stylesheet" href="${root}/resources/css/survey/survey.css">
<!-- <link rel="stylesheet" href="${root}/resources/css/survey/average.css"> *****************************-->   
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

/* average.css 에 분리 후 link 태그 활성화 */
    .circle{
        margin: 0 auto;
        width: 400px;
        height: 400px;
        border: 15px solid rgb(150, 233, 125);
        border-top-color: rgb(205, 247, 208);
        border-radius: 50%;
        position: relative;
        animation: spin 10s infinite linear;
    }

    .wrapper {
        margin: 0 auto;
        padding: 30px;
        max-width: 1170px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

    #score{
        margin-left: 50%;
        margin-top: 50%;
    }

    .btn{
        display: flex;
        flex-direction: row;
        margin-top: 50px;
    }

</style>

</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="title">사내 부패도 평균 점수</div>

        <div class="wrapper">
            <div class="circle">
                <div id="score">8888  - 점수는 회전시키지 않게 하기</div>
            </div>
        </div>

        <button onclick="go();" class="btn btn-primary"> 설문 조사 하기</button>

    </div>

    <script>
        window.onload = function() {
            document.querySelector('.circle').style.animationPlayState = 'running';
        };

    </script>
        
</body>
</html>
