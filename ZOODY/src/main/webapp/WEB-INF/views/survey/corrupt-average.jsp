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
<!-- <link rel="stylesheet" href="${root}/resources/css/survey/average.css"> -->
<link rel="stylesheet" href="${root}/resources/css/survey/survey.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>

.circle {
    margin: 0 auto;
    width: 650px;
    height: 650px;
    border: 15px solid rgb(255, 255, 255);
    border-top-color: rgb(205, 247, 208);
    border-bottom-color: rgb(205, 247, 208);
    border-radius: 50%;
    position: relative;
    animation: spin 20s infinite linear;
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

#score {
    position: absolute;
    top: 47%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 39px;
    font-weight: bold;  
}

#btn-area {
    display: flex;
    flex-direction: row;
    margin-top: 50px;
}

#circle-wrap{
    display: flex;
    justify-content: center;
    align-items: center;
}

#avgScore{
    margin-left: 150px;
}


</style>
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="title">사내 부패도 평균 점수</div>

        <div class="wrapper">
               <div id="circle-wrap">
                <div id="score">
                    <div> &nbsp;&nbsp; 현재 사내 부패도 점수 <br> (점수가 높을수록 안좋음)</div>
                    <br>
                    <div id="avgScore">${vo.totalScore}</div>
                </div>
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
            checkScoreColor();
        };

        function go() {
            location.href = "${root}/corrupt/survey/";
        }

    //부패도 평균 점수에 따라 원 태두리 색 변함
    // 0~30  초록 31~60 주황 60~100 빨강 
    function checkScoreColor() {
        var scoreElement = document.getElementById('avgScore');
        var score = parseFloat(scoreElement.innerText);

        if (score <= 30) {
            document.querySelector('.circle').style.borderTopColor = 'green';
            document.querySelector('.circle').style.borderBottomColor = 'green';
        }if(score >=31 && score <=60){
            document.querySelector('.circle').style.borderTopColor = 'orange';
            document.querySelector('.circle').style.borderBottomColor = 'orange';
        }else if(score >=61){
            document.querySelector('.circle').style.borderTopColor = 'red';
            document.querySelector('.circle').style.borderBottomColor = 'red';
        }
    }

    </script>
        
</body>
</html>


